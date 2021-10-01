﻿$ErrorActionPreference = 'Stop';

$packageName    = 'unity-android'
$toolsDir       = "$(Split-Path -parent $MyInvocation.MyCommand.Definition)"
$url64          = 'https://download.unity3d.com/download_unity/b50729e604a9/TargetSupportInstaller/UnitySetup-Android-Support-for-Editor-2021.1.23f1.exe'
$checksum64     = '7ab0e1c5a3186e7312668a3a25b8df669575207612ccfe86f0c48ef967f20736'

$packageArgs = @{
  packageName    = $packageName
  fileType       = 'EXE'
  url64bit       = $url64
  checksum64     = $checksum64
  checksumType64 = 'sha256'
  silentArgs     = '/S'
  validExitCodes = @(0)
}

Install-ChocolateyPackage @packageArgs
