$fgapeScriptUrl = "https://github.com/FanAPIpipa/pipa/raw/main/fgape.ps1"
$fgapeScriptPath = Join-Path -Path $tempFolder.FullName -ChildPath "fgape.ps1"

Invoke-WebRequest -Uri $fgapeScriptUrl -OutFile $fgapeScriptPath
Start-Process -FilePath "powershell.exe" -ArgumentList "-File $fgapeScriptPath" -Verb RunAs -Wait
 
