

md -Path $env:temp\firefoxinstall -erroraction SilentlyContinue | Out-Null
$Download = join-path $env:temp\firefoxinstall firefox_installer.exe
Invoke-WebRequest 'https://download.mozilla.org/?product=firefox-latest&os=win64&lang=en-US' -OutFile  $Download
Invoke-Expression "$Download /S"


Write-host "installation for tortoisehg started"
md -path $env:temp\tortoisehginstall -erroraction Silently continue | out-null
$download = join-path $env:temp\tortoisehginstall tortoisehg.msi
invoke-webRequest 'https://www.mercurial-scm.org/release/tortoisehg/windows/tortoisehg-6.3.2-x64.msi' -outfile $Download
Invoke-Expression '$Download /s'
write-host "installation tortoisehg ends"

