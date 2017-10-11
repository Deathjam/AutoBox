$OS = (Get-WmiObject -class Win32_OperatingSystem).Caption

If ($OS -match "Microsoft Windows 10") {
  # Install chocolatey
  Invoke-WebRequest https://chocolatey.org/install.ps1 -UseBasicParsing | Invoke-Expression
} Else {
  # Install Chocolatey for Powershell v2
  Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Refresh the PSEnviroment
refreshenv

# Stop getting prompted
choco feature enable -n=allowGlobalConfirmation

# Show file extensions and such
# choco install win-no-annoy

# Remember Arguments when upgrading programs
choco feature enable -n=useRememberedArgumentsForUpgrades

# Chocolatey GUI
choco install chocolateygui --source https://www.myget.org/F/chocolateygui/ --pre

# Import the system utilites/drivers
Import-Module SystemModule

# Import utilites for Browser/Multimedia
Import-Module MuModule

# Import the utilities I'll use for development
Import-Module DevModule

# I guess this is miscellanous section
 Import-Module OtherToolsModule