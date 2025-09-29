$json = Get-Content -Raw -Path 'infra/main.json' | ConvertFrom-Json

# Get containerAppType
$containerAppsType = $json.definitions.containerAppType

Write-Host "=== Lock property type ===" -ForegroundColor Cyan
$containerAppsType.properties.lock.GetType().FullName

Write-Host "`n=== Lock property structure ===" -ForegroundColor Cyan
$containerAppsType.properties.lock | ConvertTo-Json -Depth 5

Write-Host "`n=== Has properties? ===" -ForegroundColor Cyan
[bool]$containerAppsType.properties.lock.properties

Write-Host "`n=== Properties count ===" -ForegroundColor Cyan
if ($containerAppsType.properties.lock.properties) {
    $containerAppsType.properties.lock.properties.PSObject.Properties.Count
} else {
    "No properties found"
}
