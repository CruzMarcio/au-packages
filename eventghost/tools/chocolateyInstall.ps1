$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url           = 'https://github.com/EventGhost/EventGhost/releases/download/v0.5.0-rc7/EventGhost_0.5.0-rc7_Setup.exe'

  softwareName  = 'eventghost*'

  checksum      = '0b78a321812093815f4bf23f0f0725ca20e45c58d8aa835ad1b92d7256baed56'
  checksumType  = 'sha256'

  silentArgs    = "/VERYSILENT /SUPPRESSMSGBOXES /NORESTART /SP-"
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
