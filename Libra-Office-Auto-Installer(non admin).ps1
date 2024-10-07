# Define URLs for software installers
$LibreOfficeURL = 'https://tdf.mirror.garr.it/libreoffice/stable/24.8.0/win/x86_64/LibreOffice_24.8.0_Win_x86-64.msi'

# Store LibreOffice URL basename in variable
$LibreOfficeFILE = Split-Path -Path $LibreOfficeURL -Leaf

# Define installation paths (adjust as needed)
$installPathLibreOffice = "$env:USERPROFILE\LibreOffice"
$logFilePath = "$PSScriptRoot\install_log.txt"

# Function to log messages
function Write-Log {
    param (
        [string]$message,
        [string]$type = 'INFO'
    )
    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    $logMessage = "$timestamp [$type] $message"
    Write-Output $logMessage
    Add-Content -Path $logFilePath -Value $logMessage
}

# Change working directory to the script's directory
Set-Location -Path $PSScriptRoot

Write-Log 'Starting LibreOffice installation process.'

Write-Log 'Downloading LibreOffice installer...'

try {
    # Downloading the LibreOffice installer
    Invoke-WebRequest -Uri $LibreOfficeURL -OutFile $LibreOfficeFILE
    Write-Log 'Download completed successfully.'
} catch {
    Write-Log 'Failed to download the LibreOffice installer.' 'ERROR'
    exit 1
}

Write-Log 'Installing LibreOffice...'

try {
    # Execute the installation file
    Start-Process 'msiexec.exe' -ArgumentList "/i $LibreOfficeFILE /qn INSTALLDIR=`"$installPathLibreOffice`"" -NoNewWindow -Wait
    Write-Log 'Installation completed successfully.'
} catch {
    Write-Log 'Failed to install LibreOffice.' 'ERROR'
    exit 1
}

# Verify the installation
if (Test-Path "$installPathLibreOffice\program\soffice.exe") {
    Write-Log 'LibreOffice installed successfully.'
} else {
    Write-Log 'LibreOffice installation verification failed.' 'ERROR'
    exit 1
}

Write-Log 'Deleting LibreOffice installer...'
try {
    Remove-Item $LibreOfficeFILE -Force
    Write-Log 'Installer deleted successfully. Installation process is complete.'
} catch {
    Write-Log 'Failed to delete the LibreOffice installer.' 'ERROR'
}
