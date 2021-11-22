$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'exe'
  url             = 'https://cdn.getvideostream.com/videostream-native-updates/windows/x86/Setup.exe'
  url64           = 'https://cdn.getvideostream.com/videostream-native-updates/windows/x64/Setup.exe'

  softwareName  = 'videostream*'

  checksum      = '8aa1b4ac6f6bd376bf796ac4e93df201a75b2571fcff98dfc2dd6a8092d6435a'
  checksum64    = '66b364e2a4b04f3c1d33103afdaa1ac36dfb7d0999a6774ade61f2de0feed141'
  checksumType  = 'sha256'
  checksumType64= 'sha256'

  silentArgs    = ""
  validExitCodes= @(0)
}

Install-ChocolateyPackage @packageArgs
