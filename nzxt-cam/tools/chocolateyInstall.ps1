$ErrorActionPreference = 'Stop';

$packageArgs = @{
    packageName    = $env:ChocolateyPackageName
    unzipLocation  = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
    fileType       = 'exe'
    url            = 'https://nzxt-app.nzxt.com/NZXT-CAM-Setup.exe'

    softwareName   = 'CAM'

    checksum       = '47c83ac3471b06f61aa938f66d26a578fe6996910bb2ecfb825823a8d92cadb7'
    checksumType   = 'sha256'

    silentArgs     = "/exelang 1033 /quiet"
    validExitCodes = @(0)
}
if ((Get-ItemProperty -Path "HKLM:SOFTWARE\Microsoft\NET Framework Setup\NDP\v4\Full" -ErrorAction SilentlyContinue).Release -ge 393295) {
    Install-ChocolateyPackage @packageArgs
}
else {
  Write-Host "Please reboot the system if .NET 4.6 or greater was just installed before installing this package." -BackgroundColor Black -ForegroundColor Red
  throw
}
