$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
 
$packageArgs = @{
  packageName            = 'Pokémon Trading Card Game Online'
  fileType               = 'MSI'
  url                    = 'https://tcgo-installer.s3.amazonaws.com/PokemonInstaller.msi'
  checksum               = '1654f98f334b4a6fa100addbf4351ae23a27e3493c9f73f501643fe6554e8409'
  checksumType           = 'sha256'
  silentArgs             = "/quiet /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes         = @(0)
}
 
Install-ChocolateyPackage @packageArgs
