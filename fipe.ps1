$tempFolder = New-Item -ItemType Directory -Path "$env:TEMP\ProvisionWindows" -Force
$info = "тему урока предлагаю объявить" 
$installPythonBatUrl = "https://raw.githubusercontent.com/nuket/provision-windows/master/install-python.bat"
$installPythonBatPath = Join-Path -Path $tempFolder.FullName -ChildPath "install-python.bat"

$installPythonToolsBatUrl = "https://raw.githubusercontent.com/nuket/provision-windows/master/install-python-tools.bat"
$installPythonToolsBatPath = Join-Path -Path $tempFolder.FullName -ChildPath "install-python-tools.bat"

$batFileUrl = "https://raw.githubusercontent.com/nuket/provision-windows/master/install-python.bat"
$batFilePath = Join-Path -Path $tempFolder.FullName -ChildPath "install-python.bat"

$pythonScriptUrl = "https://raw.githubusercontent.com/chandrasreasgop/Animate-Typing/main/animatetyping.py"
$pythonScriptPath = Join-Path -Path $tempFolder.FullName -ChildPath "animatetyping.py"

Invoke-WebRequest -Uri $installPythonBatUrl -OutFile $installPythonBatPath
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $installPythonBatPath" -Verb RunAs -Wait
Invoke-WebRequest -Uri $installPythonToolsBatUrl -OutFile $installPythonToolsBatPath
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $installPythonToolsBatPath" -Wait
Invoke-WebRequest -Uri $batFileUrl -OutFile $batFilePath
Start-Process -FilePath "cmd.exe" -ArgumentList "/c $batFilePath" -Verb RunAs -Wait
Invoke-WebRequest -Uri $pythonScriptUrl -OutFile $pythonScriptPath
Start-Process -FilePath "cmd.exe" -ArgumentList "/c pip install --yes pyfiglet" -Verb RunAs -Wait
Start-Process -FilePath "cmd.exe" -ArgumentList "/c python $pythonScriptPath -Expression 'Comptype($info)'"
