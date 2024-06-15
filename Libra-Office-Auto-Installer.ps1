# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Warning "You need to run this script as an administrator."
    Start-Sleep -Seconds 3
    Start-Process powershell.exe -Verb RunAs -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"")
    Exit
}

# Define URLs for software installers
$LibreOfficeURL = 'https://tdf.mirror.garr.it/libreoffice/stable/24.2.4/win/x86_64/LibreOffice_24.2.4_Win_x86-64.msi'

# Define installation paths (adjust as needed)
$installPathLibreOffice = 'C:\Program Files\LibreOffice'

# Change working directory to the script's directory
Set-Location -Path $PSScriptRoot

Write-Output 'Downloading LibreOffice installer...'

# Downloading the LibreOffice installer
Invoke-WebRequest -Uri $LibreOfficeURL -OutFile 'LibreOffice_24.2.4_Win_x86-64.msi'

Write-Output 'Installing LibreOffice...'

# Execute the installation file
Start-Process 'msiexec.exe' -ArgumentList "/i LibreOffice_24.2.4_Win_x86-64.msi /qn INSTALLDIR=`"$installPathLibreOffice`"" -NoNewWindow -Wait

Write-Output 'Installation completed.'

# Delete the downloaded installer after installation
Write-Output 'Deleting LibreOffice installer...'
Remove-Item 'LibreOffice_24.2.4_Win_x86-64.msi' -Force

Write-Output 'Installer deleted. Installation process is complete.'
