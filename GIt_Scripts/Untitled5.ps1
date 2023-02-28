 ## Tortoisehg 
write-host " TortoiseHg installion begins"
$url = "https://www.mercurial-scm.org/release/tortoisehg/windows/tortoisehg-6.3.2-x64.msi"
$Path = $env:TEMP
$Installer = "tortoisehg.msi"
Invoke-WebRequest $Url -OutFile $Path\$Installer
Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -WaitRemove-Item $Path\$Installer
Write-Host "TortoiseHg installion ends."