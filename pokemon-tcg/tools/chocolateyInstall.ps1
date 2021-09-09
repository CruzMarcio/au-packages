$toolsPath = Split-Path $MyInvocation.MyCommand.Definition
 
$packageArgs = @{
  packageName            = 'Pokémon Trading Card Game Online'
  fileType               = 'MSI'
  url                    = 'https://tcgo-installer.s3.amazonaws.com/PokemonInstaller.msi'
  checksum               = 'fd5066e153f9f1bc68462017990c8822a733f3b3c9f83ac97f9480b31b22d48f'
  checksumType           = 'sha256'
  silentArgs             = "/quiet /norestart /l*v `"$($env:TEMP)\$($env:chocolateyPackageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes         = @(0)
}
 
Install-ChocolateyPackage @packageArgs
