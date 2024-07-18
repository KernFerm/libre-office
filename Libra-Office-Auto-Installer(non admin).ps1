# Define URLs for software installers
$LibreOfficeURL = 'https://tdf.mirror.garr.it/libreoffice/stable/24.2.4/win/x86_64/LibreOffice_24.2.4_Win_x86-64.msi'

# Define installation paths (adjust as needed)
$installPathLibreOffice = "$env:USERPROFILE\LibreOffice"
$logFilePath = "$PSScriptRoot\install_log.txt"

# Function to log messages
function Log-Message {
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

Log-Message 'Starting LibreOffice installation process.'

Log-Message 'Downloading LibreOffice installer...'

try {
    # Downloading the LibreOffice installer
    Invoke-WebRequest -Uri $LibreOfficeURL -OutFile 'LibreOffice_24.2.4_Win_x86-64.msi'
    Log-Message 'Download completed successfully.'
} catch {
    Log-Message 'Failed to download the LibreOffice installer.' 'ERROR'
    exit 1
}

Log-Message 'Installing LibreOffice...'

try {
    # Execute the installation file
    Start-Process 'msiexec.exe' -ArgumentList "/i LibreOffice_24.2.4_Win_x86-64.msi /qn INSTALLDIR=`"$installPathLibreOffice`"" -NoNewWindow -Wait
    Log-Message 'Installation completed successfully.'
} catch {
    Log-Message 'Failed to install LibreOffice.' 'ERROR'
    exit 1
}

# Verify the installation
if (Test-Path "$installPathLibreOffice\program\soffice.exe") {
    Log-Message 'LibreOffice installed successfully.'
} else {
    Log-Message 'LibreOffice installation verification failed.' 'ERROR'
    exit 1
}

Log-Message 'Deleting LibreOffice installer...'
try {
    Remove-Item 'LibreOffice_24.2.4_Win_x86-64.msi' -Force
    Log-Message 'Installer deleted successfully. Installation process is complete.'
} catch {
    Log-Message 'Failed to delete the LibreOffice installer.' 'ERROR'
}
