# 🖥️ LibreOffice Auto-Installer Script

This **PowerShell script** automates the process of downloading and installing **LibreOffice** on Windows machines. It ensures that the script is run with administrator privileges, downloads the LibreOffice installer from the official mirror, and installs it to the specified directory.

---

## 📥 How to Download the Repo (First-Time Users)

Click the link to read [**Instructions**](https://www.gitprojects.fnbubbles420.org/how-to-download-repos) 📄.

---

## ⚙️ Prerequisites

- **PowerShell 5.1 or higher**
- **Windows 7 or higher**
- **Internet connection** required to download the installer 🌐
- You need to have PowerShell installed on your system to run the script.

### 🛠️ PowerShell Installation

- **Windows 64-bit systems**: [Download 64-Bit Installer](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-x64.msi)
- **Windows 32-bit systems**: [Download 32-Bit Installer](https://github.com/PowerShell/PowerShell/releases/download/v7.4.5/PowerShell-7.4.5-win-x86.msi)

---

## 🛠️ PowerShell Script for LibreOffice Installation with Logging

This **PowerShell script** downloads and installs LibreOffice, with robust **error handling** and **logging** functionalities.

### 📝 Logging Functionality

The script includes a **logging function** that logs messages to both the console and a log file, which helps in tracking progress and errors during execution.

### Log File Location

All log messages are appended to a log file named `install_log.txt` located in the same directory as the script.

---

## 🔧 Logging Examples

Here are some example log entries:

- **Information Logs**:

```
2024-07-18 12:00:00 [INFO] Starting LibreOffice installation process. 
2024-07-18 12:01:00 [INFO] Downloading LibreOffice installer... 
2024-07-18 12:02:00 [INFO] Download completed successfully. 
2024-07-18 12:03:00 [INFO] Installing LibreOffice...
```
- **Error Logs**:
```
2024-07-18 12:01:00 [ERROR] Failed to download the LibreOffice installer. 
2024-07-18 12:04:00 [ERROR] Failed to install LibreOffice.
```

---

## 🚀 How to Use

1. **Run PowerShell as Administrator**: Right-click on PowerShell and select **"Run as administrator"** 🔒.
2. **Navigate to Script Directory**: Use `cd` to navigate to the directory containing the script.
3. **Run the Script**:
 ```
 .\LibreOffice-Auto-Installer.ps1
 ```
- If the script doesn't run, change the execution policy:
```
Set-ExecutionPolicy Bypass -Scope Process
```
- if a message pops up `red` type `Y` then click enter.

- Then run the script again without closing PowerShell.
 ```
 .\LibreOffice-Auto-Installer.ps1
 ```

### 🛠️ Features

- **Administrator Check**: Ensures the script is run with administrator privileges 🔒.
- **Automatic Download**: Downloads the latest version of **LibreOffice** from the official mirror 🌐.
- **Silent Installation**: Installs LibreOffice silently without user interaction 🛠️.
- **Custom Installation Path**: Allows specifying a custom installation path for LibreOffice.
- **Clean Up**: Deletes the installer file after the installation is complete 🧹.

---

### 📝 Customization

You can customize the installation by modifying the following variables in the script:

- `$LibreOfficeURL`: URL to the LibreOffice installer. Update this to change the version being installed.
- `$installPathLibreOffice`: Path where LibreOffice will be installed. Modify this to change the installation directory.

---

### 📜 License

This script is released under the **MIT License**. See the [LICENSE](https://github.com/KernFerm/libre-office/blob/main/LICENSE) for more details 📄.
