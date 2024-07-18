# LibreOffice Auto-Installer Script

This PowerShell script automates the process of downloading and installing LibreOffice on Windows machines. It ensures that the script is run with administrator privileges, downloads the LibreOffice installer from the official mirror, and installs it to the specified directory.

## how to download the repo first time users

  - click link to read [**Instructions**](https://www.fnbubbles420.org/Instructions-On-How-To-Download-Repo)

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


# PowerShell Script for LibreOffice Installation with Logging **FOR NON ADMIN**

This PowerShell script downloads and installs LibreOffice, with robust error handling and logging functionalities.

## Logging Functionality

The script includes a logging function that logs messages to both the console and a log file. This helps in tracking the progress and any errors during the script execution.

### Log-Message Function

The `Log-Message` function is used to log informational and error messages. It takes two parameters:
- `message`: The message to log.
- `type`: The type of message (`INFO` or `ERROR`). Default is `INFO`.

### Log File

All log messages are appended to a log file named `install_log.txt` located in the same directory as the script.

### Example Log Entries

Below are examples of log entries that might appear in `install_log.txt`:

```
2024-07-18 12:00:00 [INFO] Starting LibreOffice installation process.
2024-07-18 12:01:00 [INFO] Downloading LibreOffice installer...
2024-07-18 12:02:00 [INFO] Download completed successfully.
2024-07-18 12:03:00 [INFO] Installing LibreOffice...
2024-07-18 12:04:00 [INFO] Installation completed successfully.
2024-07-18 12:05:00 [INFO] LibreOffice installed successfully.
2024-07-18 12:06:00 [INFO] Deleting LibreOffice installer...
2024-07-18 12:07:00 [INFO] Installer deleted successfully. Installation process is complete.
```

### Error Handling and Logging

If any step in the script fails, an error message is logged with the `[ERROR]` type, and the script exits with a non-zero status code. Example error log entries:

```
2024-07-18 12:01:00 [ERROR] Failed to download the LibreOffice installer.
2024-07-18 12:04:00 [ERROR] Failed to install LibreOffice.
2024-07-18 12:05:00 [ERROR] LibreOffice installation verification failed.
2024-07-18 12:07:00 [ERROR] Failed to delete the LibreOffice installer.
```


### Usage

To use the logging functionality in your PowerShell script, include the `Log-Message` function and call it at appropriate points in your script:

```powershell
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
```

# Example usage
Log-Message 'This is an informational message.'
Log-Message 'This is an error message.' 'ERROR'



# Logging Functionality in PowerShell Script

Overview of the logging functionality integrated into the PowerShell script for downloading and installing LibreOffice. The script is designed to ensure all activities are logged for better traceability and error handling.

## Features

- **Logging to Console and File**: The script logs messages to both the console and a log file.
- **Timestamped Entries**: Each log entry includes a timestamp.
- **Log Levels**: Different log levels (INFO, WARNING, ERROR) are used to categorize log messages.
- **Error Handling**: Critical sections of the script are wrapped in `try-catch` blocks to handle and log errors appropriately.

## Logging Function

The `Write-Log` function is the core of the logging functionality. It logs messages to both the console and a file.

### Function Definition

```powershell
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
```

Parameters
- `$Message:` The log message to be recorded.
- `$LogLevel:` The log level of the message. Default is "INFO".

## How It Works

1. `Timestamp Generation:` The current date and time are formatted as yyyy-MM-dd HH:mm:ss
2. `Log Message Formatting:` The log message is prefixed with the timestamp and log level.
3. `Output to Console:` The formatted log message is written to the console.
4. `Write to File:` The formatted log message is appended to the log file located at `$PSScriptRoot\installation_log.txt`.


## Usage Examples

- Logging an Information Message
```
Write-Log "Downloading LibreOffice installer..."
```

- Logging a Warning Message
```
Write-Log "You need to run this script as an administrator." "WARNING"
```

- Logging an Error Message
```
Write-Log "Error downloading LibreOffice installer: $_" "ERROR"
```

## Error Handling with Logging
- Critical sections of the script, such as downloading and installing LibreOffice, are wrapped in `try-catch` blocks to log any errors that occur.

Example:
```
try {
    Write-Log 'Downloading LibreOffice installer...'
    Invoke-WebRequest -Uri $LibreOfficeURL -OutFile 'LibreOffice_24.2.4_Win_x86-64.msi' -ErrorAction Stop
    Write-Log 'LibreOffice installer downloaded successfully.'
} catch {
    Write-Log "Error downloading LibreOffice installer: $_" "ERROR"
    Exit 1
}
```

## Log File Location
- The log file, `installation_log.txt`, is created in the same directory as the script. All log entries are appended to this file.


## How to Use

1. **Run PowerShell as Administrator**: Right-click on PowerShell and select "Run as administrator".
2. **Execute the Script**: Navigate to the directory containing the script and run it by typing `.\Libra-Office-Auto-Installer.ps1`.

### if usage doesnt work use this first run it then select `Y` thats it click enter then run the script again 
```
Set-ExecutionPolicy Bypass -Scope Process
```
then repeat the process you can leave powershell open in admin mode to do this you dont have to close it

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
