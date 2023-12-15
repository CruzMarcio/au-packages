$ErrorActionPreference = 'Stop';
$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$exePath = Join-Path $toolsDir "ckan.exe"

$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  fileFullPath  = $exePath
  url           = 'https://github.com/KSP-CKAN/CKAN/releases/download/v1.34.2/ckan.exe'

  checksum      = '31468a82d2c756cad4cb9e651de9656b66026e52c67678f4e77d2a0b995ad881'
  checksumType  = 'sha256'
}


Get-ChocolateyWebFile @packageArgs

$desktop = $([System.Environment]::GetFolderPath([System.Environment+SpecialFolder]::DesktopDirectory))
$link = Join-Path $desktop "CKAN.lnk"
if (!(Test-Path $link)) {
    Install-ChocolateyShortcut -ShortcutFilePath "$link" -TargetPath $exePath -WorkingDirectory "$toolsDir"
}
