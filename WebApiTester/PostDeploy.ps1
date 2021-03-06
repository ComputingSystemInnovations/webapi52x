#Gets the installation folder
$installDir = $OctopusParameters["OctopusOriginalPackageDirectoryPath"]
$pscriptDir = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$custInstallDir = $OctopusParameters["Octopus.Action.Package.CustomInstallationDirectory"]

Write-Host "Install Directory $installDir"
Write-Host "PS Script Directory $pscriptDir"

#Gets CSI PS Library
$csiOctoLib = [System.IO.Path]::Combine($pscriptDir, 'CsiOctoPackLib.ps1')
$csiPsLib = [System.IO.Path]::Combine($pscriptDir, 'CsiPsLib.ps1')

#Load CSI PS Library
. $csiOctoLib
. $csiPsLib

Write-Host "'$csiOctoLib' loaded."
Write-Host "'$csiPsLib' loaded."
Write-Host ""

$appExe = [System.IO.Path]::Combine($custInstallDir, "WebApiTester.exe")
$appDescr = "Intellidact Web API Tester"
$appIco = [System.IO.Path]::Combine($custInstallDir, "webapi.ico")

#Desktop icon
Set-Shortcut -Name "Web API Tester" -TargetPath $appExe -Description $appDescr -Icon $appIco

#Intellidact folder
Set-Shortcut -Name "Web API Tester" -TargetPath $appExe -Description $appDescr -Root 'AllUsersPrograms' -Path "Intellidact\Web API Tester" -Icon $appIco
