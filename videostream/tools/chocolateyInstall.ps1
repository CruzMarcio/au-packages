$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url             = 'https://cdn.getvideostream.com/videostream-native-updates/windows/x86/Setup.exe'
  url64           = 'https://cdn.getvideostream.com/videostream-native-updates/windows/x64/Setup.exe'

  softwareName  = 'videostream*'

  checksum      = 'eb48c9d020867294990fa2a3de0dbb7828778a746637180e383e439937027a7d'
  checksum64    = 'ae0b654d99526c351ff977d272c17adc1149bc23c1244d3d827591af8d908792'
  checksumType  = 'sha256'
  checksumType64= 'sha256'

  silentArgs    = ""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
