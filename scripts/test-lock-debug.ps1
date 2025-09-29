$VerbosePreference = 'Continue'
. .\scripts\generatedocs.ps1

Write-Host "Getting parameters..." -ForegroundColor Yellow
$params = Get-BicepParameters -FilePath 'infra/main.bicep' -Verbose 4>&1 | Where-Object { $_ -match 'DEBUG.*lock' }

Write-Host "`nDebug output:" -ForegroundColor Cyan
$params | ForEach-Object { Write-Host $_ }
