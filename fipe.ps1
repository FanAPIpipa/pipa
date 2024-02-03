$tempFolder = New-Item -ItemType Directory -Path "$env:TEMP\ProvisionWindows" -Force
$fgapeScriptUrl = "https://github.com/FanAPIpipa/pipa/raw/main/fgape.ps1"
$fgapeScriptPath = Join-Path -Path $tempFolder.FullName -ChildPath "fgape.ps1"

Invoke-WebRequest -Uri $fgapeScriptUrl -OutFile $fgapeScriptPath

# Проверяем, успешно ли был выполнен скрипт fgape.ps1
if (Test-Path $fgapeScriptPath) {
    # Запускаем скрипт fgape.ps1
    Start-Process -FilePath "powershell.exe" -ArgumentList "-File $fgapeScriptPath" -Verb RunAs -Wait

    # Выводим окно с информацией
    [System.Windows.Forms.MessageBox]::Show("Скрипт fgape.ps1 успешно выполнен.", "Информация")
} else {
    Write-Host "Не удалось загрузить скрипт fgape.ps1."
}
