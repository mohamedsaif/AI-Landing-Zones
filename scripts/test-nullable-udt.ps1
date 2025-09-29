# Test script for nullable UDT parameter expansion
$ErrorActionPreference = 'Stop'

# Source the main script
. "$PSScriptRoot\generatedocs.ps1"

# Get parameters from the compiled JSON
$infraPath = Join-Path (Split-Path $PSScriptRoot -Parent) "infra\main.bicep"
$params = Get-BicepParameters -FilePath $infraPath

# Filter for acrPrivateDnsZoneDefinition and its nested properties
$acrParams = $params | Where-Object { $_.Name -like "acrPrivateDnsZoneDefinition*" }

Write-Host "`n=== acrPrivateDnsZoneDefinition Parameters ===" -ForegroundColor Cyan
$acrParams | Format-Table Name, Type, IsStructured, IsSubProperty -AutoSize

Write-Host "`nTotal parameters found: $($acrParams.Count)" -ForegroundColor Yellow

# Check if nested properties exist
$nestedCount = ($acrParams | Where-Object { $_.Name -like "*.*" }).Count
Write-Host "Nested properties: $nestedCount" -ForegroundColor Yellow

if ($nestedCount -gt 0) {
    Write-Host "`n✅ SUCCESS: Nested properties were expanded!" -ForegroundColor Green
} else {
    Write-Host "`n❌ FAILED: No nested properties found!" -ForegroundColor Red
}
