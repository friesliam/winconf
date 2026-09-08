# Change this to the correct file
. "$PSScriptRoot\..\User\spaceorcas\root.ps1"



# Tamper Protection may need to be turned off for certain settings
# Settings -> Privacy & Security -> Windows Security -> Virus & threat protection -> Virus & threat protection settings -> Manage settings -> Tamper Protection -> Off



function Set-Reg {
    param (
        [string]$Path,
        [string]$Name,
        $Value
    )
    if (-not (Test-Path $Path)) {
        New-Item -Path $Path -Force | Out-Null
    }
    Set-ItemProperty -Path $Path -Name $Name -Value $Value
}



# Web Search Results in Start Menu
# WARNING: May display an indexing error if disabled despite working normally
Set-Reg "HKCU:\Software\Policies\Microsoft\Windows" "DisableSearchBoxSuggestions" ([int](-not $webSearchResults))


# Send Diagnostic Data
# Setting 0 on non-enterprise Windows editions may default to 1
Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" "AllowTelemetry" $sendDiagnosticData
Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" "MaxTelemetryAllowed" $sendDiagnosticData


# File Paths Longer than 260 Chars
Set-Reg "HKLM:\System\CurrentControlSet\Control\FileSystem" "LongPathsEnabled" ([int]$allowLongPaths)


# Read Hardware Clock as UTC (allows windows to determine the correct local time when dual-booting with linux)
Set-Reg "HKLM:\SYSTEM\CurrentControlSet\Control\TimeZoneInformation" "RealTimeIsUniversal" ([int]$hardwareClockIsUTC)


# Settings Launch Page
# $settingsHomeTab = switch {  }
#Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Explorer" "SettingsPageVisibility" "hide:home"


# Enable Developer Mode
Set-Reg "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\AppModelUnlock" "AllowDevelopmentWithoutDevLicense" ([int]$developerMode)





# Remove warnings after turning off settings under security like "automatic sample submission"
# HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender\Reporting    DisableEnhancedNotifications     1

# Remove the small link icon from desktop links
#Reg-Set -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Shell Icons" -Name 29 -Value "%windir%\System32\shell32.dll,-50" -Type "String"
