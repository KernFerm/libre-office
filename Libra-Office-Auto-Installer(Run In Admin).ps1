# Define log function
function Write-Log {
    param (
        [string]$Message,
        [string]$LogLevel = "INFO"
    )
    $timestamp = Get-Date -Format "yyyy-MM-dd HH:mm:ss"
    $logMessage = "$timestamp [$LogLevel] $Message"
    Write-Output $logMessage
    Add-Content -Path "$PSScriptRoot\installation_log.txt" -Value $logMessage
}

# Check if running as administrator
if (-not ([Security.Principal.WindowsPrincipal] [Security.Principal.WindowsIdentity]::GetCurrent()).IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Log "You need to run this script as an administrator." "WARNING"
    Start-Sleep -Seconds 3
    Start-Process powershell.exe -Verb RunAs -ArgumentList ("-NoProfile -ExecutionPolicy Bypass -File `"$PSCommandPath`"")
    Exit
}

# Define URLs for software installers
$LibreOfficeURL = 'https://tdf.mirror.garr.it/libreoffice/stable/24.8.2/win/x86_64/LibreOffice_24.8.2_Win_x86-64.msi'

# Extract the filename from the URL dynamically
$LibreOfficeFILE = Split-Path -Path $LibreOfficeURL -Leaf

# Define installation paths (adjust as needed)
$installPathLibreOffice = 'C:\Program Files\LibreOffice'

# Change working directory to the script's directory
Set-Location -Path $PSScriptRoot

# Downloading the LibreOffice installer
try {
    Write-Log 'Downloading LibreOffice installer...'
    Invoke-WebRequest -Uri $LibreOfficeURL -OutFile $LibreOfficeFILE -ErrorAction Stop
    Write-Log 'LibreOffice installer downloaded successfully.'
} catch {
    Write-Log "Error downloading LibreOffice installer: $_" "ERROR"
    Exit 1
}

# Installing LibreOffice
try {
    Write-Log 'Installing LibreOffice...'
    Start-Process 'msiexec.exe' -ArgumentList "/i $LibreOfficeFILE /qn INSTALLDIR=`"$installPathLibreOffice`"" -NoNewWindow -Wait
    Write-Log 'LibreOffice installation initiated.'
} catch {
    Write-Log "Error starting LibreOffice installation: $_" "ERROR"
    Exit 1
}

# Confirm installation
if (Test-Path "$installPathLibreOffice\program\soffice.exe") {
    Write-Log 'Installation completed successfully.'
} else {
    Write-Log 'Installation failed.' "ERROR"
    Exit 1
}

# Delete the downloaded installer after installation
try {
    Write-Log 'Deleting LibreOffice installer...'
    Remove-Item $LibreOfficeFILE -Force -ErrorAction Stop
    Write-Log 'Installer deleted. Installation process is complete.'
} catch {
    Write-Log "Error deleting LibreOffice installer: $_" "ERROR"
    Exit 1
}
