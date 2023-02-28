## AWS command line interface
$download_url = 'https://s3.amazonaws.com/aws-cli/AWSCLI64.msi'
$downloaddestination = 'C:\Program Files\awscli.msi'
$checkpath='C:\Program Files\Amazon\AWSCLI'
if (Test-Path $downloaddestination) {
  # // File exists do nothing
} else {
  # // File does not exist download it
  (New-Object System.Net.WebClient).DownloadFile($download_url, $downloaddestination)
}
##$env:SEE_MASK_NOZONECHECKS = 1
Start-Process $downloaddestination /qn -Wait | Out-Null
Start-Sleep -Seconds 60
if (Test-Path $checkpath) {
  Write-Host "awscli installed"
} else {
  Write-Host "Installation failed"
}