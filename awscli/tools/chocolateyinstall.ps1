﻿$ErrorActionPreference = 'Stop';

$toolsDir   = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url        = 'https://s3.amazonaws.com/aws-cli/AWSCLI32PY3-1.25.89.msi'
$checksum   = 'e87c9ee34cd709721046a94fea83b1bbfa8ea6684ef621f71e94dfb2c3f33ab4'
$url64      = 'https://s3.amazonaws.com/aws-cli/AWSCLI64PY3-1.25.89.msi'
$checksum64 = '69c4ed43400b9b71efc5118581173a516cbab422795ec3a2a34952f49a85b2e2'
 
$packageArgs = @{
  packageName   = $env:ChocolateyPackageName
  unzipLocation = $toolsDir
  fileType      = 'MSI'
  url           = $url
  url64bit      = $url64
  softwareName  = 'AWS Command Line Interface*'
  checksum      = $checksum
  checksumType  = 'sha256'
  checksum64    = $checksum64
  checksumType64= 'sha256'
  silentArgs    = "/qn /norestart /l*v `"$($env:TEMP)\$($packageName).$($env:chocolateyPackageVersion).MsiInstall.log`""
  validExitCodes= @(0, 3010, 1641)
}

Install-ChocolateyPackage @packageArgs
