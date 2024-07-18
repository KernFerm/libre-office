# Define URLs for software installers
$LibreOfficeURL = 'https://tdf.mirror.garr.it/libreoffice/stable/24.2.4/win/x86_64/LibreOffice_24.2.4_Win_x86-64.msi'

# Define installation paths (adjust as needed)
$installPathLibreOffice = "$env:USERPROFILE\LibreOffice"

# Change working directory to the script's directory
Set-Location -Path $PSScriptRoot

Write-Output 'Downloading LibreOffice installer...'

try {
    # Downloading the LibreOffice installer
    Invoke-WebRequest -Uri $LibreOfficeURL -OutFile 'LibreOffice_24.2.4_Win_x86-64.msi'
    Write-Output 'Download completed successfully.'
} catch {
    Write-Error 'Failed to download the LibreOffice installer.'
    exit 1
}

Write-Output 'Installing LibreOffice...'

try {
    # Execute the installation file
    Start-Process 'msiexec.exe' -ArgumentList "/i LibreOffice_24.2.4_Win_x86-64.msi /qn INSTALLDIR=`"$installPathLibreOffice`"" -NoNewWindow -Wait
    Write-Output 'Installation completed successfully.'
} catch {
    Write-Error 'Failed to install LibreOffice.'
    exit 1
}

# Verify the installation
if (Test-Path "$installPathLibreOffice\program\soffice.exe") {
    Write-Output 'LibreOffice installed successfully.'
} else {
    Write-Error 'LibreOffice installation verification failed.'
    exit 1
}

# Delete the downloaded installer after installation
Write-Output 'Deleting LibreOffice installer...'
try {
    Remove-Item 'LibreOffice_24.2.4_Win_x86-64.msi' -Force
    Write-Output 'Installer deleted successfully. Installation process is complete.'
} catch {
    Write-Error 'Failed to delete the LibreOffice installer.'
}
