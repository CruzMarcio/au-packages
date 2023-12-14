$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir "ckan.exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = $exePath
  url           = 'https://github.com/KSP-CKAN/CKAN/releases/download/v1.34.0/ckan.exe'

  checksum      = 'b241699311ac44dd4e7534663d83157c7bdfc817f4b223eb060838d458996c29'
  checksumType  = 'sha256'
}


Get-ChocolateyWebFile @packageArgs

$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "CKAN.lnk"
if (!(Test-Path $link)) {
    Install-ChocolateyShortcut -ShortcutFilePath "$link" -TargetPath $exePath -WorkingDirectory "$toolsDir"
}
