# LibreOffice Auto-Installer Script

This PowerShell script automates the process of downloading and installing LibreOffice on Windows machines. It ensures that the script is run with administrator privileges, downloads the LibreOffice installer from the official mirror, and installs it to the specified directory.

## Prerequisites

- PowerShell 5.1 or higher
- Windows 7 or higher
- Internet connection
- You need to have PowerShell installed on your system. This is used to run the script.
- `Both` MSI are from the official github page of [Official-PowerShell-Github](https://github.com/PowerShell)

# v7.4.3 Release of PowerShell - Latest (recommended)
      choose your recommended pc specs either 32bit or 64bit 

- [64-Bit-Installer](https://github.com/PowerShell/PowerShell/releases/download/v7.4.3/PowerShell-7.4.3-win-x64.msi)
- [32-Bit-Installer](https://github.com/PowerShell/PowerShell/releases/download/v7.4.3/PowerShell-7.4.3-win-x86.msi)

## How to Use

1. **Run PowerShell as Administrator**: Right-click on PowerShell and select "Run as administrator".
2. **Execute the Script**: Navigate to the directory containing the script and run it by typing `.\Libra-Office-Auto-Installer.ps1`.

## Features

- **Administrator Check**: Ensures the script is run with administrator privileges.
- **Automatic Download**: Downloads the latest version of LibreOffice from the official mirror.
- **Silent Installation**: Installs LibreOffice silently without user interaction.
- **Custom Installation Path**: Allows specifying a custom installation path for LibreOffice.
- **Clean Up**: Deletes the installer file after the installation is complete.

## Customization

You can customize the installation by modifying the following variables in the script:

- `$LibreOfficeURL`: URL to the LibreOffice installer. Update this to change the version being installed.
- `$installPathLibreOffice`: Path where LibreOffice will be installed. Modify this to change the installation directory.

## Disclaimer

This script is provided "as is", without warranty of any kind. Use it at your own risk.

## License

This script is released under the MIT License. See the LICENSE file for more details.
