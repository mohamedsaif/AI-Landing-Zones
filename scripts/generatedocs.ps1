param(
    [Parameter(Mandatory = $false)]
    [string]$TemplatePath = "infra/main.bicep",
    
    [Parameter(Mandatory = $false)]
    [string]$OutputPath = "docs/parameters.md"
)

# Helper function to generate safer documentation URLs
function Generate-SafeLearnUrl {
    param([string]$ResourceType, [string]$ApiVersion)
    
    $typeForUrl = $ResourceType.ToLower()
    
    # Known working patterns for resource types that have different URL structures
    $specialCases = @{
        'microsoft.resources/deployments' = 'https://learn.microsoft.com/en-us/azure/azure-resource-manager/templates/template-syntax'
        'microsoft.authorization/roleassignments' = 'https://learn.microsoft.com/en-us/azure/templates/microsoft.authorization/roleassignments'
        'microsoft.authorization/locks' = 'https://learn.microsoft.com/en-us/azure/templates/microsoft.authorization/locks'
        'microsoft.insights/diagnosticsettings' = 'https://learn.microsoft.com/en-us/azure/templates/microsoft.insights/diagnosticsettings'
        'microsoft.bing/accounts' = 'https://learn.microsoft.com/en-us/azure/templates/microsoft.bing/accounts'
    }
    
    # Check for special cases first
    if ($specialCases.ContainsKey($typeForUrl)) {
        return $specialCases[$typeForUrl]
    }
    
    # For standard resource types, use the generic template reference pattern
    # Remove specific API version if it might not exist, use the base resource type documentation
    return "https://learn.microsoft.com/en-us/azure/templates/$typeForUrl"
}

# Helper function to convert absolute path to relative path from current directory
function Get-RelativePath {
    param([string]$AbsolutePath)
    
    $currentDir = Get-Location
    $relativePath = [System.IO.Path]::GetRelativePath($currentDir.Path, $AbsolutePath)
    return $relativePath -replace '\\', '/'
}

# Function to parse UDT definition from types.bicep file
function Parse-UdtDefinition {
    param([string]$TypesFilePath, [string]$TypeName)
    
    if (!(Test-Path $TypesFilePath)) {
        return $null
    }
    
    $content = Get-Content $TypesFilePath -Raw
    
    # Find the type definition - looking for "type TypeName = {"
    $typePattern = "type\s+$TypeName\s*=\s*\{"
    $match = [regex]::Match($content, $typePattern)
    
    if (!$match.Success) {
        return $null
    }
    
    # Extract the type definition by finding the matching braces
    $startPos = $match.Index + $match.Length - 1  # Position of opening brace
    $braceCount = 1
    $pos = $startPos + 1
    
    while ($pos -lt $content.Length -and $braceCount -gt 0) {
        $char = $content[$pos]
        if ($char -eq '{') { $braceCount++ }
        elseif ($char -eq '}') { $braceCount-- }
        $pos++
    }
    
    if ($braceCount -eq 0) {
        $typeDefinition = $content.Substring($startPos, $pos - $startPos)
        return $typeDefinition
    }
    
    return $null
}

# Function to convert Bicep type definition to parameter structure
function Convert-BicepTypeToParameters {
    param([string]$TypeDefinition, [string]$ParentName, [string]$Description, [string]$Conditionality = "Optional")
    
    $parameters = @()
    
    # Add the main parameter
    $parameters += [PSCustomObject]@{
        Name = $ParentName
        Type = "object"
        Description = $Description
        Conditionality = $Conditionality
        DefaultValue = $null
        HasDefault = $Conditionality -eq "Optional"
        IsStructured = $true
        IsSubProperty = $false
    }
    
    # Parse properties from the type definition using a more precise pattern
    $lines = $TypeDefinition -split "`n"
    $currentDescription = ""
    $insideProperty = $false
    
    foreach ($line in $lines) {
        $line = $line.Trim()
        
        # Match @description lines
        if ($line -match '@description\([''"]([^''"]*)[''"]') {
            $currentDescription = $matches[1]
            continue
        }
        
        # Match property definitions: propertyName: type
        if ($line -match '^(\w+):\s*(.+)$') {
            $propName = $matches[1]
            $propTypeRaw = $matches[2].Trim()
            
            # Clean up the type
            $propType = $propTypeRaw
            $isOptional = $false
            
            # Handle optional properties (ending with ?)
            if ($propTypeRaw.EndsWith('?')) {
                $isOptional = $true
                $propType = $propTypeRaw.Substring(0, $propTypeRaw.Length - 1).Trim()
            }
            
            # Handle array types
            if ($propType.EndsWith('[]')) {
                $propType = 'array'
            } elseif ($propType.StartsWith('{') -or $propType.Contains('{')) {
                # Any type that contains braces is an object
                $propType = 'object'
            } elseif ($propType.Contains('|')) {
                # Union types - just show as string for simplicity
                $propType = 'string'
            } elseif ($propType -match '^[A-Z]') {
                # Starts with capital letter - likely a specific type, treat as string
                $propType = 'string'
            }
            
            # Determine conditionality from description
            $conditionality = "Optional"
            if ($currentDescription) {
                if ($currentDescription.StartsWith("Required")) {
                    $conditionality = "Required"
                } elseif ($currentDescription.StartsWith("Conditional")) {
                    $conditionality = "Conditional"
                } else {
                    $conditionality = "Optional"
                }
            }
            
            $parameters += [PSCustomObject]@{
                Name = "$ParentName.$propName"
                Type = $propType
                Description = $currentDescription
                Conditionality = $conditionality
                DefaultValue = $null
                HasDefault = $isOptional
                IsStructured = $false
                IsSubProperty = $true
            }
            
            # Reset description for next property
            $currentDescription = ""
        }
    }
    
    return $parameters
}

# Function to map UDT parameters from Bicep source
function Get-UdtParameterMappings {
    param([string]$BicepFilePath)
    
    $udtMappings = @{}
    
    if (Test-Path $BicepFilePath) {
        $bicepContent = Get-Content $BicepFilePath -Raw
        
        # Find parameters that use User Defined Types
        $paramPattern = 'param\s+(\w+)\s+(\w+)\??\s*$'
        $matches = [regex]::Matches($bicepContent, $paramPattern, [Text.RegularExpressions.RegexOptions]::Multiline)
        
        foreach ($match in $matches) {
            $paramName = $match.Groups[1].Value
            $typeName = $match.Groups[2].Value
            
            # Only track types that end with "Type" (typical UDT naming convention)
            if ($typeName -match 'Type$') {
                $udtMappings[$paramName] = $typeName
            }
        }
    }
    
    return $udtMappings
}

# Function to extract parameters from compiled JSON with expanded structured attributes
function Get-BicepParameters {
    param([string]$FilePath)
    
    $parameters = @()
    
    # Build the corresponding JSON file path
    $jsonPath = $FilePath -replace '\.bicep$', '.json'
    
    if (!(Test-Path $jsonPath)) {
        Write-Host "Building Bicep template..." -ForegroundColor Yellow
        try {
            & bicep build $FilePath
        } catch {
            Write-Error "Failed to build Bicep template: $_"
            return @()
        }
    }
    
    if (!(Test-Path $jsonPath)) {
        Write-Error "JSON template not found: $jsonPath"
        return @()
    }
    
    $jsonContent = Get-Content $jsonPath -Raw | ConvertFrom-Json
    
    # Helper function to determine parameter conditionality from description
    function Get-ParameterConditionality {
        param([string]$Description, [bool]$HasDefault)
        
        $desc = $Description.ToLower()
        if ($desc.StartsWith("required")) {
            return "Required"
        } elseif ($desc.StartsWith("conditional")) {
            return "Conditional"
        } elseif ($desc.StartsWith("optional") -or $HasDefault) {
            return "Optional"
        } else {
            # Default fallback based on whether it has a default value
            if ($HasDefault) { return "Optional" } else { return "Required" }
        }
    }
    
    # Helper function to expand structured parameters recursively
    # Helper function to extract parameter types from Bicep source
    function Get-BicepParameterType {
        param(
            [string]$BicepFilePath,
            [string]$ParameterName
        )
        
        if (-not (Test-Path $BicepFilePath)) {
            return $null
        }
        
        $bicepContent = Get-Content -Path $BicepFilePath -Raw
        $pattern = "param\s+$ParameterName\s+(\w+)\??"
        
        if ($bicepContent -match $pattern) {
            return $Matches[1]
        }
        
        return $null
    }

    function Expand-StructuredParameter {
        param(
            [string]$ParamName,
            [object]$ParamDef,
            [object]$JsonContent,
            [string]$ParentPath = "",
            [int]$Depth = 0,
            [string]$BicepFilePath = ""
        )
        
        $expandedParams = @()
        $description = ""
        if ($ParamDef.metadata -and $ParamDef.metadata.description) {
            $description = $ParamDef.metadata.description
        }
        
        $hasDefault = [bool]$ParamDef.PSObject.Properties['defaultValue'] -or [bool]$ParamDef.nullable
        $conditionality = Get-ParameterConditionality -Description $description -HasDefault $hasDefault
        
        $fullParamName = if ($ParentPath) { "$ParentPath.$ParamName" } else { $ParamName }
        
        # Debug: Log parameter being processed
        if ($fullParamName -like "*lock*") {
            Write-Verbose "DEBUG: Processing $fullParamName - Type: $($ParamDef.type), Has `$ref: $([bool]$ParamDef.'$ref'), Has properties: $([bool]$ParamDef.properties)"
        }
        
        # Check if this parameter references a user-defined type
        if ($ParamDef.'$ref' -and $JsonContent.definitions) {
            $refName = $ParamDef.'$ref' -replace '^#/definitions/', ''
            $typeDef = $JsonContent.definitions.$refName
            
            if ($typeDef -and $typeDef.type -eq "object" -and $typeDef.properties) {
                # Add the main parameter
                $expandedParams += [PSCustomObject]@{
                    Name = $fullParamName
                    Type = "object"
                    Description = $description
                    Conditionality = $conditionality
                    DefaultValue = if ($hasDefault) { $ParamDef.defaultValue } else { $null }
                    HasDefault = $hasDefault
                    IsStructured = $true
                    IsSubProperty = $Depth -gt 0
                }
                
                # Recursively expand sub-properties
                foreach ($propName in $typeDef.properties.PSObject.Properties.Name) {
                    $prop = $typeDef.properties.$propName
                    $nestedParams = Expand-StructuredParameter -ParamName $propName -ParamDef $prop -JsonContent $JsonContent -ParentPath $fullParamName -Depth ($Depth + 1) -BicepFilePath $BicepFilePath
                    $expandedParams += $nestedParams
                }
            } else {
                # Non-object structured type
                $expandedParams += [PSCustomObject]@{
                    Name = $fullParamName
                    Type = if ($ParamDef.type) { $ParamDef.type } else { "object" }
                    Description = $description
                    Conditionality = $conditionality
                    DefaultValue = if ($hasDefault) { $ParamDef.defaultValue } else { $null }
                    HasDefault = $hasDefault
                    IsStructured = $false
                    IsSubProperty = $Depth -gt 0
                }
            }
        } elseif ($ParamDef.type -eq "object" -and $ParamDef.properties) {
            # Inline object definition
            Write-Verbose "Processing inline object: $fullParamName (Depth: $Depth, Has properties: $($ParamDef.properties.PSObject.Properties.Count))"
            $expandedParams += [PSCustomObject]@{
                Name = $fullParamName
                Type = "object"
                Description = $description
                Conditionality = $conditionality
                DefaultValue = if ($hasDefault) { $ParamDef.defaultValue } else { $null }
                HasDefault = $hasDefault
                IsStructured = $true
                IsSubProperty = $Depth -gt 0
            }
            
            # Recursively expand inline object properties
            foreach ($propName in $ParamDef.properties.PSObject.Properties.Name) {
                $prop = $ParamDef.properties.$propName
                Write-Verbose "  Expanding property: $propName under $fullParamName"
                $nestedParams = Expand-StructuredParameter -ParamName $propName -ParamDef $prop -JsonContent $JsonContent -ParentPath $fullParamName -Depth ($Depth + 1) -BicepFilePath $BicepFilePath
                $expandedParams += $nestedParams
            }
        } elseif ($ParamDef.type -eq "object" -and $ParamDef.nullable -and !$ParamDef.properties -and $BicepFilePath -and $Depth -eq 0) {
            # Handle nullable UDT parameters that lost their $ref during Bicep compilation
            # This is a known Bicep limitation - nullable UDTs compile to plain "type: object" without $ref
            Write-Verbose "Detected nullable object without properties at top level: $fullParamName - attempting Bicep lookup"
            
            $udtType = Get-BicepParameterType -BicepFilePath $BicepFilePath -ParameterName $ParamName
            
            if ($udtType -and $JsonContent.definitions.$udtType) {
                Write-Verbose "Found UDT type '$udtType' in Bicep source for parameter '$ParamName'"
                $typeDef = $JsonContent.definitions.$udtType
                
                if ($typeDef.type -eq "object" -and $typeDef.properties) {
                    # Add the main parameter
                    $expandedParams += [PSCustomObject]@{
                        Name = $fullParamName
                        Type = "object"
                        Description = $description
                        Conditionality = $conditionality
                        DefaultValue = if ($hasDefault) { $ParamDef.defaultValue } else { $null }
                        HasDefault = $hasDefault
                        IsStructured = $true
                        IsSubProperty = $false
                    }
                    
                    # Recursively expand sub-properties from the UDT definition
                    foreach ($propName in $typeDef.properties.PSObject.Properties.Name) {
                        $prop = $typeDef.properties.$propName
                        $nestedParams = Expand-StructuredParameter -ParamName $propName -ParamDef $prop -JsonContent $JsonContent -ParentPath $fullParamName -Depth ($Depth + 1) -BicepFilePath $BicepFilePath
                        $expandedParams += $nestedParams
                    }
                } else {
                    # Type found but not an expandable object
                    $expandedParams += [PSCustomObject]@{
                        Name = $fullParamName
                        Type = "object"
                        Description = $description
                        Conditionality = $conditionality
                        DefaultValue = if ($hasDefault) { $ParamDef.defaultValue } else { $null }
                        HasDefault = $hasDefault
                        IsStructured = $false
                        IsSubProperty = $false
                    }
                }
            } else {
                # No UDT found in Bicep - treat as plain object
                Write-Verbose "No UDT type found for parameter '$ParamName' - treating as plain object"
                $expandedParams += [PSCustomObject]@{
                    Name = $fullParamName
                    Type = "object"
                    Description = $description
                    Conditionality = $conditionality
                    DefaultValue = if ($hasDefault) { $ParamDef.defaultValue } else { $null }
                    HasDefault = $hasDefault
                    IsStructured = $false
                    IsSubProperty = $false
                }
            }
        } elseif ($ParamDef.type -eq "array" -and $ParamDef.items) {
            # Array type - add the array parameter and try to expand items if they are objects
            $expandedParams += [PSCustomObject]@{
                Name = $fullParamName
                Type = "array"
                Description = $description
                Conditionality = $conditionality
                DefaultValue = if ($hasDefault) { $ParamDef.defaultValue } else { $null }
                HasDefault = $hasDefault
                IsStructured = $false
                IsSubProperty = $Depth -gt 0
            }
            
            # If array items are objects, expand them as well
            if ($ParamDef.items.type -eq "object" -and $ParamDef.items.properties) {
                # Add a synthetic container representing an individual array item to preserve hierarchy
                $expandedParams += [PSCustomObject]@{
                    Name = "$fullParamName[*]"
                    Type = "object"
                    Description = "Array item for $fullParamName"
                    Conditionality = "Optional"
                    DefaultValue = $null
                    HasDefault = $false
                    IsStructured = $true
                    IsSubProperty = $true
                }

                foreach ($propName in $ParamDef.items.properties.PSObject.Properties.Name) {
                    $prop = $ParamDef.items.properties.$propName
                    $nestedParams = Expand-StructuredParameter -ParamName $propName -ParamDef $prop -JsonContent $JsonContent -ParentPath "$fullParamName[*]" -Depth ($Depth + 2) -BicepFilePath $BicepFilePath
                    $expandedParams += $nestedParams
                }
            } elseif ($ParamDef.items.'$ref' -and $JsonContent.definitions) {
                # Array items reference a user-defined type
                $refName = $ParamDef.items.'$ref' -replace '^#/definitions/', ''
                $typeDef = $JsonContent.definitions.$refName
                
                if ($typeDef -and $typeDef.type -eq "object" -and $typeDef.properties) {
                    $expandedParams += [PSCustomObject]@{
                        Name = "$fullParamName[*]"
                        Type = "object"
                        Description = "Array item for $fullParamName"
                        Conditionality = "Optional"
                        DefaultValue = $null
                        HasDefault = $false
                        IsStructured = $true
                        IsSubProperty = $true
                    }
                    foreach ($propName in $typeDef.properties.PSObject.Properties.Name) {
                        $prop = $typeDef.properties.$propName
                        $nestedParams = Expand-StructuredParameter -ParamName $propName -ParamDef $prop -JsonContent $JsonContent -ParentPath "$fullParamName[*]" -Depth ($Depth + 2) -BicepFilePath $BicepFilePath
                        $expandedParams += $nestedParams
                    }
                }
            }
        } else {
            # Simple parameter
            $propDescription = $description
            $propConditionality = $conditionality
            
            # For sub-properties, check if parent type definition has requirements
            if ($Depth -gt 0 -and !$propDescription) {
                $propConditionality = "Optional"  # Default for sub-properties without explicit description
            }
            
            $expandedParams += [PSCustomObject]@{
                Name = $fullParamName
                Type = if ($ParamDef.type) { $ParamDef.type } else { "object" }
                Description = $propDescription
                Conditionality = $propConditionality
                DefaultValue = if ($hasDefault) { $ParamDef.defaultValue } else { $null }
                HasDefault = $hasDefault
                IsStructured = $false
                IsSubProperty = $Depth -gt 0
            }
        }
        
        return $expandedParams
    }
    
    function Resolve-UdtDefinitionName {
        param(
            [object]$Definitions,
            [string]$TypeName
        )

        if (-not $Definitions) {
            return $null
        }

        $directMatch = $Definitions.PSObject.Properties | Where-Object { $_.Name -eq $TypeName } | Select-Object -First 1
        if ($directMatch) {
            return $directMatch.Name
        }

        $suffixMatch = $Definitions.PSObject.Properties | Where-Object { $_.Name -like "*.$TypeName" } | Select-Object -First 1
        if ($suffixMatch) {
            return $suffixMatch.Name
        }

        return $null
    }
    
    # Get UDT mappings from Bicep source file
    $udtMappings = Get-UdtParameterMappings -BicepFilePath $FilePath
    
    # Get the types file path
    $bicepDir = Split-Path $FilePath -Parent
    $typesFilePath = Join-Path $bicepDir "common/types.bicep"
    
    # Extract parameters from JSON
    if ($jsonContent.parameters) {
        foreach ($paramName in $jsonContent.parameters.PSObject.Properties.Name) {
            $param = $jsonContent.parameters.$paramName
            
            # Check if this parameter uses a UDT
            if ($udtMappings.ContainsKey($paramName)) {
                $udtTypeName = $udtMappings[$paramName]
                
                $definitionName = Resolve-UdtDefinitionName -Definitions $jsonContent.definitions -TypeName $udtTypeName

                if ($definitionName) {
                    $syntheticParam = [pscustomobject]@{
                        '$ref' = "#/definitions/$definitionName"
                    }

                    if ($param.PSObject.Properties['metadata']) {
                        $syntheticParam | Add-Member -NotePropertyName 'metadata' -NotePropertyValue $param.metadata
                    }

                    if ($param.PSObject.Properties['defaultValue']) {
                        $syntheticParam | Add-Member -NotePropertyName 'defaultValue' -NotePropertyValue $param.defaultValue
                    }

                    if ($param.PSObject.Properties['nullable']) {
                        $syntheticParam | Add-Member -NotePropertyName 'nullable' -NotePropertyValue $param.nullable
                    }

                    $expandedParams = Expand-StructuredParameter -ParamName $paramName -ParamDef $syntheticParam -JsonContent $jsonContent -BicepFilePath $FilePath
                } else {
                    # Try to parse the UDT definition directly from the types file as a fallback
                    $typeDefinition = Parse-UdtDefinition -TypesFilePath $typesFilePath -TypeName $udtTypeName

                    if ($typeDefinition) {
                        $description = if ($param.metadata -and $param.metadata.description) { $param.metadata.description } else { "" }
                        $conditionality = Get-ParameterConditionality -Description $description -HasDefault ([bool]$param.defaultValue)
                        $expandedParams = Convert-BicepTypeToParameters -TypeDefinition $typeDefinition -ParentName $paramName -Description $description -Conditionality $conditionality
                    } else {
                        # Fallback to normal processing if UDT definition not found
                        $expandedParams = Expand-StructuredParameter -ParamName $paramName -ParamDef $param -JsonContent $jsonContent -BicepFilePath $FilePath
                    }
                }
            } else {
                # Normal parameter processing
                $expandedParams = Expand-StructuredParameter -ParamName $paramName -ParamDef $param -JsonContent $jsonContent -BicepFilePath $FilePath
            }
            
            $parameters += $expandedParams
        }
    }
    
    return $parameters | Sort-Object Name
}

# Function to extract outputs from compiled JSON
function Get-BicepOutputs {
    param([string]$FilePath)
    
    $outputs = @()
    
    # Build the corresponding JSON file path
    $jsonPath = $FilePath -replace '\.bicep$', '.json'
    
    if (!(Test-Path $jsonPath)) {
        Write-Host "Building Bicep template..." -ForegroundColor Yellow
        try {
            & bicep build $FilePath
        } catch {
            Write-Error "Failed to build Bicep template: $_"
            return @()
        }
    }
    
    if (!(Test-Path $jsonPath)) {
        Write-Error "JSON template not found: $jsonPath"
        return @()
    }
    
    $jsonContent = Get-Content $jsonPath -Raw | ConvertFrom-Json
    
    # Extract outputs from JSON
    if ($jsonContent.outputs) {
        foreach ($outputName in $jsonContent.outputs.PSObject.Properties.Name) {
            $output = $jsonContent.outputs.$outputName
            
            $description = ""
            if ($output.metadata -and $output.metadata.description) {
                $description = $output.metadata.description
            }
            
            $type = $output.type
            
            $outputs += [PSCustomObject]@{
                Name = $outputName
                Type = $type
                Description = $description
            }
        }
    }
    
    return $outputs | Sort-Object Name
}

# Function to extract User Defined Types (UDTs) from compiled JSON
function Get-BicepUserDefinedTypes {
    param([string]$FilePath)
    
    $types = @{}
    
    # Build the corresponding JSON file path
    $jsonPath = $FilePath -replace '\.bicep$', '.json'
    
    if (!(Test-Path $jsonPath)) {
        Write-Warning "JSON template not found at $jsonPath. Building Bicep template..."
        try {
            & bicep build $FilePath
        } catch {
            Write-Error "Failed to build Bicep template: $_"
            return @{}
        }
    }
    
    if (!(Test-Path $jsonPath)) {
        Write-Error "JSON template still not found after build attempt: $jsonPath"
        return @{}
    }
    
    $jsonContent = Get-Content $jsonPath -Raw | ConvertFrom-Json
    
    # Extract UDTs from definitions section
    if ($jsonContent.definitions) {
        foreach ($typeName in $jsonContent.definitions.PSObject.Properties.Name) {
            $typeData = $jsonContent.definitions.$typeName
            
            $description = ""
            if ($typeData.metadata -and $typeData.metadata.description) {
                $description = $typeData.metadata.description
            }
            
            $properties = @()
            if ($typeData.type -eq "object" -and $typeData.properties) {
                foreach ($propName in $typeData.properties.PSObject.Properties.Name) {
                    $prop = $typeData.properties.$propName
                    
                    $propDescription = ""
                    if ($prop.metadata -and $prop.metadata.description) {
                        $propDescription = $prop.metadata.description
                    }
                    
                    $isOptional = $true
                    if ($typeData.required -and $typeData.required -contains $propName) {
                        $isOptional = $false
                    }
                    
                    $properties += [PSCustomObject]@{
                        Name = $propName
                        Type = $prop.type
                        Description = $propDescription
                        Optional = $isOptional
                    }
                }
            }
            
            # Clean up type name (remove prefixes like "_1.")
            $cleanTypeName = $typeName -replace '^_\d+\.', ''
            
            $types[$cleanTypeName] = @{
                Description = $description
                Definition = $typeData.type
                Properties = $properties
            }
        }
    }
    
    return $types
}

# Function to extract resource types recursively from main template and all wrapper modules
function Get-BicepResourceTypes {
    param([string]$FilePath)
    
    $script:resourceTypes = @()
    $processedModules = @{}
    
    # Helper function to recursively process a bicep file
    function ProcessBicepFile($bicepFilePath) {
        if ($processedModules.ContainsKey($bicepFilePath)) {
            return
        }
        $processedModules[$bicepFilePath] = $true
        
        Write-Host "Processing: $bicepFilePath" -ForegroundColor DarkGray
        
        # Build the corresponding JSON file path
        $jsonPath = $bicepFilePath -replace '\.bicep$', '.json'
        
        if (!(Test-Path $jsonPath)) {
            Write-Host "Building: $bicepFilePath" -ForegroundColor DarkYellow
            try {
                & bicep build $bicepFilePath
            } catch {
                Write-Warning "Failed to build $bicepFilePath : $_"
                return
            }
        }
        
        if (!(Test-Path $jsonPath)) {
            Write-Warning "JSON template not found after build: $jsonPath"
            return
        }
        
        $jsonContent = Get-Content $jsonPath -Raw | ConvertFrom-Json
        
        # Extract resource types from resources section
        if ($jsonContent.resources) {
            # Handle both object and array formats for main resources
            if ($jsonContent.resources -is [System.Array]) {
                # Resources are in an array format
                for ($i = 0; $i -lt $jsonContent.resources.Count; $i++) {
                    $resource = $jsonContent.resources[$i]
                    if ($resource.type -and $resource.apiVersion) {
                        # Generate proper ARM template reference URL
                        $resourceTypeObj = [PSCustomObject]@{
                            ResourceType = $resource.type
                            ApiVersion = $resource.apiVersion
                            LearnUrl = Generate-SafeLearnUrl -ResourceType $resource.type -ApiVersion $resource.apiVersion
                            Source = Get-RelativePath -AbsolutePath $bicepFilePath
                        }
                        $script:resourceTypes = $script:resourceTypes + @($resourceTypeObj)
                        
                        # Check for nested deployments (Microsoft.Resources/deployments) and extract their resources
                        if ($resource.type -eq "Microsoft.Resources/deployments" -and $resource.properties -and $resource.properties.template -and $resource.properties.template.resources) {
                            Write-Host "  Found nested deployment in array[$i] - extracting nested resources" -ForegroundColor DarkCyan
                            
                            # Handle both object and array formats for nested resources
                            $nestedResources = $resource.properties.template.resources
                            
                            if ($nestedResources -is [System.Array]) {
                                # Resources are in an array format
                                for ($j = 0; $j -lt $nestedResources.Count; $j++) {
                                    $nestedResource = $nestedResources[$j]
                                    if ($nestedResource -and $nestedResource.type -and $nestedResource.apiVersion) {
                                        $nestedTypeForUrl = Generate-SafeLearnUrl -ResourceType $nestedResource.type -ApiVersion $nestedResource.apiVersion
                                        $nestedResourceTypeObj = [PSCustomObject]@{
                                            ResourceType = $nestedResource.type
                                            ApiVersion = $nestedResource.apiVersion
                                            LearnUrl = $nestedTypeForUrl
                                            Source = "Nested in $(Get-RelativePath -AbsolutePath $bicepFilePath)"
                                        }
                                        $script:resourceTypes = $script:resourceTypes + @($nestedResourceTypeObj)
                                        Write-Host "    Found nested resource: $($nestedResource.type) @ $($nestedResource.apiVersion)" -ForegroundColor Gray
                                    }
                                }
                            } else {
                                # Resources are in an object format (properties)
                                foreach ($nestedResourceName in $nestedResources.PSObject.Properties.Name) {
                                    $nestedResource = $nestedResources.$nestedResourceName
                                    if ($nestedResource -and $nestedResource.type -and $nestedResource.apiVersion) {
                                        $nestedTypeForUrl = Generate-SafeLearnUrl -ResourceType $nestedResource.type -ApiVersion $nestedResource.apiVersion
                                        $nestedResourceTypeObj = [PSCustomObject]@{
                                            ResourceType = $nestedResource.type
                                            ApiVersion = $nestedResource.apiVersion
                                            LearnUrl = $nestedTypeForUrl
                                            Source = "Nested in $(Get-RelativePath -AbsolutePath $bicepFilePath)"
                                        }
                                        $script:resourceTypes = $script:resourceTypes + @($nestedResourceTypeObj)
                                        Write-Host "    Found nested resource: $($nestedResource.type) @ $($nestedResource.apiVersion)" -ForegroundColor Gray
                                    }
                                }
                            }
                        }
                    }
                }
            } else {
                # Resources are in an object format (properties)
                foreach ($resourceName in $jsonContent.resources.PSObject.Properties.Name) {
                    $resource = $jsonContent.resources.$resourceName
                    if ($resource.type -and $resource.apiVersion) {
                        # Generate proper ARM template reference URL
                        $resourceTypeObj = [PSCustomObject]@{
                            ResourceType = $resource.type
                            ApiVersion = $resource.apiVersion
                            LearnUrl = Generate-SafeLearnUrl -ResourceType $resource.type -ApiVersion $resource.apiVersion
                            Source = Get-RelativePath -AbsolutePath $bicepFilePath
                        }
                        $script:resourceTypes = $script:resourceTypes + @($resourceTypeObj)
                    
                        # Check for nested deployments (Microsoft.Resources/deployments) and extract their resources
                        if ($resource.type -eq "Microsoft.Resources/deployments" -and $resource.properties -and $resource.properties.template -and $resource.properties.template.resources) {
                            Write-Host "  Found nested deployment in $resourceName - extracting nested resources" -ForegroundColor DarkCyan
                            
                            # Handle both object and array formats for nested resources
                            $nestedResources = $resource.properties.template.resources
                            
                            if ($nestedResources -is [System.Array]) {
                                # Resources are in an array format
                                for ($i = 0; $i -lt $nestedResources.Count; $i++) {
                                    $nestedResource = $nestedResources[$i]
                                    if ($nestedResource.type -and $nestedResource.apiVersion) {
                                        $nestedResourceTypeObj = [PSCustomObject]@{
                                            ResourceType = $nestedResource.type
                                            ApiVersion = $nestedResource.apiVersion
                                            LearnUrl = Generate-SafeLearnUrl -ResourceType $nestedResource.type -ApiVersion $nestedResource.apiVersion
                                            Source = "Nested in $(Get-RelativePath -AbsolutePath $bicepFilePath)"
                                        }
                                        $script:resourceTypes = $script:resourceTypes + @($nestedResourceTypeObj)
                                        Write-Host "    Found nested resource: $($nestedResource.type) @ $($nestedResource.apiVersion)" -ForegroundColor Gray
                                    }
                                }
                            } else {
                                # Resources are in an object format (properties)
                                foreach ($nestedResourceName in $nestedResources.PSObject.Properties.Name) {
                                    $nestedResource = $nestedResources.$nestedResourceName
                                    if ($nestedResource.type -and $nestedResource.apiVersion) {
                                        $nestedResourceTypeObj = [PSCustomObject]@{
                                            ResourceType = $nestedResource.type
                                            ApiVersion = $nestedResource.apiVersion
                                            LearnUrl = Generate-SafeLearnUrl -ResourceType $nestedResource.type -ApiVersion $nestedResource.apiVersion
                                            Source = "Nested in $(Get-RelativePath -AbsolutePath $bicepFilePath)"
                                        }
                                        $script:resourceTypes = $script:resourceTypes + @($nestedResourceTypeObj)
                                        Write-Host "    Found nested resource: $($nestedResource.type) @ $($nestedResource.apiVersion)" -ForegroundColor Gray
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }
        
        # Scan for local module references and br/public AVM modules in the original Bicep file
        $content = Get-Content $bicepFilePath -Raw
        
        # Pattern for br/public AVM modules
        $avmModulePattern = "(?m)module\s+\w+\s+'br/public:([^:]+):([^']+)'"
        $avmModuleMatches = [regex]::Matches($content, $avmModulePattern)
        
        foreach ($match in $avmModuleMatches) {
            $modulePath = $match.Groups[1].Value
            $version = $match.Groups[2].Value
            
            Write-Host "Found AVM module: $modulePath version $version" -ForegroundColor Green
            
            # Extract resource type from AVM module path
            $pathParts = $modulePath.Split('/')
            if ($pathParts.Length -ge 4 -and $pathParts[0] -eq "avm") {
                $resourceType = "Microsoft.$($pathParts[2])/$($pathParts[3])"
                $typeForUrl = $resourceType.ToLower()
                
                # Get the actual ARM API version from the AVM module source
                $armApiVersion = Get-AVMModuleApiVersion -ModulePath $modulePath -Version $version
                
                if ($armApiVersion) {
                    Write-Host "Mapped to resource type: $resourceType (ARM API: $armApiVersion)" -ForegroundColor Green
                    
                    $resourceTypeObj = [PSCustomObject]@{
                        ResourceType = $resourceType
                        ApiVersion = $version
                        ArmApiVersion = $armApiVersion
                        LearnUrl = Generate-SafeLearnUrl -ResourceType $resourceType -ApiVersion $armApiVersion
                        Source = "AVM: $modulePath"
                    }
                } else {
                    Write-Host "Mapped to resource type: $resourceType (using AVM version)" -ForegroundColor Green
                    
                    $resourceTypeObj = [PSCustomObject]@{
                        ResourceType = $resourceType
                        ApiVersion = $version
                        ArmApiVersion = $null
                        LearnUrl = Generate-SafeLearnUrl -ResourceType $resourceType -ApiVersion $version
                        Source = "AVM: $modulePath"
                    }
                }
                
                $script:resourceTypes = $script:resourceTypes + @($resourceTypeObj)
            }
        }
        
        # Pattern for local module references (wrappers)
        $localModulePattern = "(?m)module\s+\w+\s+'([^']+\.bicep)'"
        $localModuleMatches = [regex]::Matches($content, $localModulePattern)
        
        foreach ($match in $localModuleMatches) {
            $relativeModulePath = $match.Groups[1].Value
            $absoluteModulePath = Join-Path (Split-Path $bicepFilePath -Parent) $relativeModulePath
            $absoluteModulePath = Resolve-Path $absoluteModulePath -ErrorAction SilentlyContinue
            
            if ($absoluteModulePath -and (Test-Path $absoluteModulePath)) {
                ProcessBicepFile $absoluteModulePath.Path
            }
        }
    }
    
    # Function to get ARM API version from AVM module
    function Get-AVMModuleApiVersion {
        param(
            [string]$ModulePath,
            [string]$Version
        )
        
        try {
            # Construct GitHub raw content URL
            $githubUrl = "https://raw.githubusercontent.com/Azure/bicep-registry-modules/main/$ModulePath/main.bicep"
            
            Write-Host "Fetching AVM module source: $ModulePath" -ForegroundColor Cyan
            
            # Download the main.bicep file content
            $response = Invoke-WebRequest -Uri $githubUrl -UseBasicParsing -TimeoutSec 10
            $content = $response.Content
            
            # Extract API version from resource declarations, excluding telemetry deployments
            # Pattern: resource resourceName 'Microsoft.*/resourceType@YYYY-MM-DD(-preview)?'
            $apiVersionPattern = "resource\s+\w+\s+'([^']+@(\d{4}-\d{2}-\d{2}(?:-preview)?))"
            $matches = [regex]::Matches($content, $apiVersionPattern)
            
            # Filter out telemetry/deployment resources and look for the main resource
            $mainResource = $null
            $mainApiVersion = $null
            
            foreach ($match in $matches) {
                $fullResourceType = $match.Groups[1].Value
                $apiVersion = $match.Groups[2].Value
                
                # Skip telemetry deployments
                if ($fullResourceType -match "Microsoft\.Resources/deployments") {
                    continue
                }
                
                # This should be the main resource
                $mainResource = $fullResourceType
                $mainApiVersion = $apiVersion
                break
            }
            
            if ($mainApiVersion) {
                Write-Host "Found ARM API version: $mainApiVersion for $mainResource" -ForegroundColor Green
                return $mainApiVersion
            } else {
                Write-Host "No main ARM API version found in $ModulePath (only found telemetry resources)" -ForegroundColor Yellow
                return $null
            }
        } catch {
            Write-Host "Failed to fetch AVM module info for $ModulePath`: $_" -ForegroundColor Red
            return $null
        }
    }
    
    # Start processing from the main file
    ProcessBicepFile $FilePath
    
    # Also process all wrapper modules directly to ensure we get everything
    $bicepDir = Split-Path $FilePath -Parent
    $wrappersDir = Join-Path $bicepDir "wrappers"
    
    if (Test-Path $wrappersDir) {
        Write-Host "Scanning wrapper modules in: $wrappersDir" -ForegroundColor Cyan
        $wrapperFiles = Get-ChildItem -Path $wrappersDir -Filter "*.bicep"
        foreach ($wrapperFile in $wrapperFiles) {
            ProcessBicepFile $wrapperFile.FullName
        }
    }
    
    Write-Host "Total resource types collected: $($script:resourceTypes.Count)" -ForegroundColor Cyan
    
    # Remove duplicates and sort - group by individual resource type to prevent concatenation
    $uniqueResourceTypes = $script:resourceTypes | Sort-Object ResourceType, ApiVersion | Group-Object -Property ResourceType | ForEach-Object {
        # For each unique resource type, take the one with the most information (ArmApiVersion if available)
        $bestEntry = $_.Group | Sort-Object { if ($_.ArmApiVersion) { 1 } else { 0 } } -Descending | Select-Object -First 1
        $bestEntry
    }
    
    Write-Host "Unique resource types after deduplication: $($uniqueResourceTypes.Count)" -ForegroundColor Cyan
    
    return $uniqueResourceTypes | Sort-Object ResourceType
}

# Function to determine parameter conditionality
function Get-ParameterConditionality {
    param(
        [PSCustomObject]$Parameter,
        [string]$BicepContent
    )
    
    # Check if parameter has a default value
    if ($Parameter.HasDefault) {
        return "Optional"
    }
    
    # Check if parameter is used in conditional expressions
    $paramName = $Parameter.Name
    if ($BicepContent -match "param\s+$paramName\s*=") {
        return "Conditional"
    }
    
    return "Required"
}

# Function to generate markdown documentation
function Generate-MarkdownDocumentation {
    param(
        [array]$Parameters,
        [array]$ResourceTypes,
        [hashtable]$UserDefinedTypes,
        [array]$Outputs,
        [string]$TemplateName
    )
    
    $markdown = "# $TemplateName" + "`n`n"
    $markdown += "## Overview" + "`n`n"
    $markdown += "This template deploys Azure resources for AI/ML workloads." + "`n`n"
    
    # Table of Contents with individual parameter links
    $markdown += "## Table of Contents" + "`n`n"
    if ($ResourceTypes.Count -gt 0) {
        # Check if we have AVM modules
        $avmModules = $ResourceTypes | Where-Object { $_.Source -and $_.Source.StartsWith("AVM:") }
        if ($avmModules.Count -gt 0) {
            $markdown += "- [AVM Modules](#avm-modules)" + "`n"
        }
        $markdown += "- [Resource Types](#resource-types)" + "`n"
    }
    $markdown += "- [Parameters](#parameters)" + "`n"
    
    # Group parameters by main parameter (exclude sub-properties for TOC)
    $mainParams = $Parameters | Where-Object { -not $_.IsSubProperty } | Sort-Object Name
    
    # Group parameters by conditionality for TOC
    $requiredParams = $mainParams | Where-Object { $_.Conditionality -eq "Required" } | Sort-Object Name
    $conditionalParams = $mainParams | Where-Object { $_.Conditionality -eq "Conditional" } | Sort-Object Name
    $optionalParams = $mainParams | Where-Object { $_.Conditionality -eq "Optional" } | Sort-Object Name
    
    # Required Parameters section in TOC
    if ($requiredParams.Count -gt 0) {
        $markdown += "  - [Required Parameters](#required-parameters)" + "`n"
        foreach ($param in $requiredParams) {
            $paramAnchor = $param.Name.ToLower() -replace '[^a-z0-9]', '-'
            $markdown += "    - [$($param.Name)](#$paramAnchor)" + "`n"
        }
    }
    
    # Conditional Parameters section in TOC
    if ($conditionalParams.Count -gt 0) {
        $markdown += "  - [Conditional Parameters](#conditional-parameters)" + "`n"
        foreach ($param in $conditionalParams) {
            $paramAnchor = $param.Name.ToLower() -replace '[^a-z0-9]', '-'
            $markdown += "    - [$($param.Name)](#$paramAnchor)" + "`n"
        }
    }
    
    # Optional Parameters section in TOC
    if ($optionalParams.Count -gt 0) {
        $markdown += "  - [Optional Parameters](#optional-parameters)" + "`n"
        foreach ($param in $optionalParams) {
            $paramAnchor = $param.Name.ToLower() -replace '[^a-z0-9]', '-'
            $markdown += "    - [$($param.Name)](#$paramAnchor)" + "`n"
        }
    }
    
    $markdown += "- [Outputs](#outputs)" + "`n"
    $markdown += "`n"
    
    # AVM Modules section (new)
    if ($ResourceTypes.Count -gt 0) {
        $avmModules = $ResourceTypes | Where-Object { $_.Source -and $_.Source.StartsWith("AVM:") } | Sort-Object ResourceType
        
        if ($avmModules.Count -gt 0) {
            $markdown += "## AVM Modules" + "`n`n"
            $markdown += "| Module | Version |" + "`n"
            $markdown += "| :-- | :-- |" + "`n"
            
            foreach ($module in $avmModules) {
                $moduleName = $module.Source -replace "^AVM: ", ""
                $markdown += "| ``$moduleName`` | $($module.ApiVersion) |" + "`n"
            }
            $markdown += "`n"
        }
    }
    
    # Resource Types section (modified to remove Source column and ARM API links, excluding AVM module representations)
    if ($ResourceTypes.Count -gt 0) {
        # Filter out AVM module representations - only show actual ARM resource types
        $actualResourceTypes = $ResourceTypes | Where-Object { -not ($_.Source -and $_.Source.StartsWith("AVM:")) } | Sort-Object ResourceType
        
        if ($actualResourceTypes.Count -gt 0) {
            $markdown += "## Resource Types" + "`n`n"
            $markdown += "| Resource Type | API Version |" + "`n"
            $markdown += "| :-- | :-- |" + "`n"
            
            foreach ($resource in $actualResourceTypes) {
                # For direct template resources, show API version
                $apiVersion = $resource.ApiVersion
                $markdown += "| ``$($resource.ResourceType)`` | $apiVersion |" + "`n"
            }
            $markdown += "`n"
        }
    }
    
    # Parameters section
    $markdown += "## Parameters" + "`n`n"
    
    # Group parameters by main parameter (exclude sub-properties for main grouping)
    $mainParams = $Parameters | Where-Object { -not $_.IsSubProperty } | Sort-Object Name
    
    # Group parameters by conditionality
    $requiredParams = $mainParams | Where-Object { $_.Conditionality -eq "Required" } | Sort-Object Name
    $conditionalParams = $mainParams | Where-Object { $_.Conditionality -eq "Conditional" } | Sort-Object Name
    $optionalParams = $mainParams | Where-Object { $_.Conditionality -eq "Optional" } | Sort-Object Name
    
    # Helper function to generate parameter documentation with hierarchical structure
    function Add-ParameterDocumentation {
        param([object]$param, [array]$allParameters)
        
        $paramMarkdown = "### ``$($param.Name)``" + "`n`n"
        
        # Clean description by removing redundant conditionality prefixes
        $cleanDescription = $param.Description
        if ($cleanDescription) {
            $cleanDescription = $cleanDescription -replace '^Required\.\s*', ''
            $cleanDescription = $cleanDescription -replace '^Conditional\.\s*', ''
            $cleanDescription = $cleanDescription -replace '^Optional\.\s*', ''
        }
        
        # Main parameter table
        $paramMarkdown += "| Parameter | Type | Required | Description |" + "`n"
        $paramMarkdown += "| :-- | :-- | :-- | :-- |" + "`n"
        
        $paramMarkdown += "| ``$($param.Name)`` | ``$($param.Type)`` | $($param.Conditionality) | $cleanDescription |" + "`n"
        $paramMarkdown += "`n"
        
        # Add hierarchical properties if this parameter is an object and has sub-properties
        $subProperties = $allParameters | Where-Object { $_.IsSubProperty -and $_.Name.StartsWith("$($param.Name).") } | Sort-Object Name
        if ($subProperties.Count -gt 0 -and $param.Type -eq "object") {
            $paramMarkdown += Add-HierarchicalProperties -parentName $param.Name -allParameters $allParameters -indent 0
        }
        
        return $paramMarkdown
    }
    
    # Helper function to recursively generate hierarchical property documentation
    function Add-HierarchicalProperties {
        param(
            [string]$parentName,
            [array]$allParameters,
            [int]$indent
        )
        
        $hierarchyMarkdown = ""
        $indentString = "  " * $indent  # Two spaces per indent level
        
        # Normalization function to ignore array item markers [*]
        # Updated: also remove plain [] markers so that paths like parent.arrayProp[].child
        # normalize to parent.arrayProp.child, enabling correct hierarchical grouping.
        function Normalize-Path([string]$n) { return ($n -replace '\[\*\]', '' -replace '\[\]', '') }
        $normalizedParent = Normalize-Path $parentName

        # Select children that are one segment deeper after normalization
        $directChildren = $allParameters | Where-Object {
            $_.IsSubProperty -and (
                (
                    # Direct dot child
                    (Normalize-Path $_.Name).StartsWith("$normalizedParent.") -and
                    ((Normalize-Path $_.Name).Split('.').Count -eq ($normalizedParent.Split('.').Count + 1))
                ) -or (
                    # Synthetic array item container (parentName[*])
                    $_.Name -eq "$parentName[*]"
                )
            )
        } | Sort-Object Name | Where-Object { $_.Name -ne "$parentName[*]" -or $indent -eq 0 }

        # If parent is an array item container we don't print it; its children will appear under array property
        if ($parentName -like '*[*]*' -and $parentName.EndsWith('[*]')) {
            # Recurse immediately to its children without creating a bullet for the synthetic node
            foreach ($child in ($allParameters | Where-Object { $_.IsSubProperty -and (Normalize-Path $_.Name).StartsWith("$normalizedParent.") -and $_.Name -ne $parentName })) {
                $hierarchyMarkdown += Add-HierarchicalProperties -parentName $child.Name -allParameters $allParameters -indent $indent
            }
            return $hierarchyMarkdown
        }
        
        if ($directChildren.Count -gt 0) {
            if ($indent -eq 0) {
                $hierarchyMarkdown += "**Properties:**" + "`n`n"
            }
            
            foreach ($child in $directChildren) {
                $propName = $child.Name.Split('.')[-1]  # Get just the property name, not the full path
                $propName = $propName -replace '\[\*\]','[]'
                
                # Clean description
                $cleanDescription = $child.Description
                if ($cleanDescription) {
                    $cleanDescription = $cleanDescription -replace '^Required\.\s*', ''
                    $cleanDescription = $cleanDescription -replace '^Conditional\.\s*', ''
                    $cleanDescription = $cleanDescription -replace '^Optional\.\s*', ''
                }
                
                # Format as list item with indentation
                $hierarchyMarkdown += "$indentString- **``$propName``** (``$($child.Type)``) - $($child.Conditionality)" + "`n"
                $hierarchyMarkdown += "$indentString  - **Description:** $cleanDescription" + "`n"
                
                # Check if this property has sub-properties (recursive)
                $hasChildren = $allParameters | Where-Object { 
                    $_.IsSubProperty -and 
                    (
                        (Normalize-Path $_.Name).StartsWith((Normalize-Path $child.Name) + '.') -and
                        $_.Name -ne $child.Name
                    )
                }
                
                if ($hasChildren.Count -gt 0) {
                    $hierarchyMarkdown += Add-HierarchicalProperties -parentName $child.Name -allParameters $allParameters -indent ($indent + 1)
                }
                
                $hierarchyMarkdown += "`n"
            }
        }
        
        return $hierarchyMarkdown
    }
    
    # Required Parameters section
    if ($requiredParams.Count -gt 0) {
        $markdown += "### Required Parameters" + "`n`n"
        foreach ($param in $requiredParams) {
            $markdown += Add-ParameterDocumentation -param $param -allParameters $Parameters
        }
    }
    
    # Conditional Parameters section
    if ($conditionalParams.Count -gt 0) {
        $markdown += "### Conditional Parameters" + "`n`n"
        foreach ($param in $conditionalParams) {
            $markdown += Add-ParameterDocumentation -param $param -allParameters $Parameters
        }
    }
    
    # Optional Parameters section
    if ($optionalParams.Count -gt 0) {
        $markdown += "### Optional Parameters" + "`n`n"
        foreach ($param in $optionalParams) {
            $markdown += Add-ParameterDocumentation -param $param -allParameters $Parameters
        }
    }
    
    # Outputs section
    $markdown += "## Outputs" + "`n`n"
    if ($Outputs.Count -gt 0) {
        $markdown += "| Output Name | Type | Description |" + "`n"
        $markdown += "| :-- | :-- | :-- |" + "`n"
        
        foreach ($output in ($Outputs | Sort-Object Name)) {
            $markdown += "| ``$($output.Name)`` | $($output.Type) | $($output.Description) |" + "`n"
        }
    } else {
        $markdown += "_No outputs defined._" + "`n"
    }
    $markdown += "`n"
    

    
    return $markdown
}

# Main execution
Write-Host "Parsing Bicep template: $TemplatePath" -ForegroundColor Cyan

if (!(Test-Path $TemplatePath)) {
    Write-Error "Template file not found: $TemplatePath"
    exit 1
}

# Extract parameters, resource types, and UDTs
$parameters = Get-BicepParameters -FilePath $TemplatePath
$resourceTypes = Get-BicepResourceTypes -FilePath $TemplatePath
$userDefinedTypes = Get-BicepUserDefinedTypes -FilePath $TemplatePath
$outputs = Get-BicepOutputs -FilePath $TemplatePath

Write-Host "Found $($parameters.Count) parameters" -ForegroundColor Green
Write-Host "Found $($resourceTypes.Count) resource types" -ForegroundColor Green
Write-Host "Found $($userDefinedTypes.Count) user defined types" -ForegroundColor Green
Write-Host "Found $($outputs.Count) outputs" -ForegroundColor Green

# Generate markdown
$templateName = "AI Landing Zone"
$markdown = Generate-MarkdownDocumentation -Parameters $parameters -ResourceTypes $resourceTypes -UserDefinedTypes $userDefinedTypes -Outputs $outputs -TemplateName $templateName

# Write to output file
$outputDir = Split-Path $OutputPath -Parent
if (!(Test-Path $outputDir)) {
    New-Item -ItemType Directory -Path $outputDir -Force | Out-Null
}

Set-Content -Path $OutputPath -Value $markdown -Encoding UTF8

Write-Host "Documentation generated successfully!" -ForegroundColor Green
Write-Host "Parameters documented: $($parameters.Count)" -ForegroundColor White
Write-Host "Resource types documented: $($resourceTypes.Count)" -ForegroundColor White
Write-Host "User defined types documented: $($userDefinedTypes.Count)" -ForegroundColor White
Write-Host "Outputs documented: $($outputs.Count)" -ForegroundColor White
Write-Host "Output file: $OutputPath" -ForegroundColor White