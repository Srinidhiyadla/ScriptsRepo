

##google chrome
write-host " started chrome installtion"
$LocalTempDir = $env:TEMP;
$ChromeInstaller = "ChromeInstaller.exe"; 
(new-object System.Net.WebClient).DownloadFile('http://dl.google.com/chrome/install/375.126/chrome_installer.exe', "$LocalTempDir\$ChromeInstaller"); 
& "$LocalTempDir\$ChromeInstaller" /silent /install; 
$Process2Monitor =  "ChromeInstaller";
Do { $ProcessesFound = Get-Process | ?{$Process2Monitor -contains $_.Name} | Select-Object -ExpandProperty Name; 
If ($ProcessesFound) { "Still running: $($ProcessesFound -join ', ')" | Write-Host; Start-Sleep -Seconds 2 } else { rm "$LocalTempDir\$ChromeInstaller" -ErrorAction SilentlyContinue -Verbose } 
} Until (!$ProcessesFound)
write-host "chrome installation completed"



test-chrome Text Write-Host "Google Chrome installer Start."
# install the latest Google Chrome. We should use an explicit version.
$Url = "http://dl.google.com/chrome/install/latest/chrome_installer.exe"
$Path = $env:TEMP
$Installer = "chrome_installer.exe"
Invoke-WebRequest $Url -OutFile $Path\$Installer
Start-Process -FilePath $Path\$Installer -Args "/silent /install" -Verb RunAs -WaitRemove-Item $Path\$Installer
Write-Host "Google Chrome installer End."