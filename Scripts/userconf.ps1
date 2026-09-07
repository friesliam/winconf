# Do not run this script as administrator or certain settings may become admin settings
# Change this to the correct file
. "$PSScriptRoot\User\spaceorcas\user.ps1"



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



# Disable JPEG Wallpaper Quality Reduction
# Test: Set a JPEG wallpaper and note its file size, the size of "%AppData%\Roaming\Microsoft\Windows\Themes\TranscodedWallpaper" will be significantly smaller
# https://www.elevenforum.com/t/disable-desktop-wallpaper-jpeg-quality-reduction-in-windows-11.10782/
# Requires reboot, wallpaper will need to be reapplied
if ($jpegWallpaperQualityReduction) {
    Remove-ItemProperty -Path "HKCU:\Control Panel\Desktop" -Name "JPEGImportQuality" -ErrorAction SilentlyContinue
} else {
    Set-Reg "HKCU:\Control Panel\Desktop" "JPEGImportQuality" 100
}


# Enable Dark Mode
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" "AppsUseLightTheme" ([int](-not $darkMode))
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" "SystemUsesLightTheme" ([int](-not $darkMode))


# Taskbar Alignment
$taskbarAlignment = switch ($taskbarAlignment) { "left" { 0 } "center" { 1 } default { 1 } }
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "TaskbarAl" $taskbarAlignment


# Disable Menu Delay
# Example: right clicking and hovering over expandable menu options
Set-Reg "HKCU:\Control Panel\Desktop" "MenuShowDelay" ([string]$menuDelay)


# Lower Hover Delay (for example: hovering over applications in the taskbar)
Set-Reg "HKCU:\Control Panel\Mouse" "MouseHoverTime" ([string]$menuDelay)


# Show File Extensions
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideFileExt" ([int](-not $showFileExtensions))


# Show Hidden Files
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Hidden" ([int]$showHiddenFiles)


# Show Full File Paths
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\CabinetState" "FullPath" ([int]$showFullFilePaths)


# Show File Icons
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "HideIcons" ([int](-not $showFileIcons))


# Allow Powershell Scripts
# https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/about/about_execution_policies
Set-Reg "HKCU:\Software\Microsoft\PowerShell\1\ShellIds\Microsoft.PowerShell" "ExecutionPolicy" $powershellExecutionPolicy


# Start Menu Advertisiments
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "Start_IrisRecommendations" ([int]$startMenuAds)


# Mobile Device Side Panel in Start Menu
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Start\Companions\Microsoft.YourPhone_8wekyb3d8bbwe" "IsEnabled" ([int]$mobileDeviceInStart)


# Full Right Click Menu
if ($fullRightClickMenu) {
    Set-Reg "HKCU:\Software\Classes\CLSID\{86ca1a34-a4e8-4baa-a149-14a50919bc8b}" "InprocServer32" ""
} else {
    Remove-Item -Path "HKCU:\Software\Classes\CLSID\{86ca1a34-a4e8-4baa-a149-14a50919bc8b}" -Recurse -Force
}


# System Sounds (example: certain prompt boxes and notifications)
# Effective after running 'rundll32.exe user32.dll,UpdatePerUserSystemParameters'
$systemSounds = ".$systemSounds"
Set-Reg "HKCU:\AppEvents\Schemes" "(Default)" $systemSounds


# Sticky Keys
$stickyKeys = switch ($stickyKeys) { true { 511 } false { 510 } }
Set-Reg "HKCU:\Control Panel\Accessibility\StickyKeys" "Flags" $stickyKeys


# Mouse Sensitivity
Set-Reg "HKCU:\Control Panel\Mouse" "MouseSensitivity" ([string]$mouseSensitivity)


# Mouse Acceleration
& {
    $mouseThreshold1 = "0"
    $mouseThreshold2 = "0"
    $mouseSpeed = "0"
    if ($mouseAcceleration) {
        $mouseThreshold1 = "6"
        $mouseThreshold2 = "10"
        $mouseSpeed = "1"
    }
    Set-Reg "HKCU:\Control Panel\Mouse" "MouseThreshold1" $mouseThreshold1
    Set-Reg "HKCU:\Control Panel\Mouse" "MouseThreshold2" $mouseThreshold2
    Set-Reg "HKCU:\Control Panel\Mouse" "MouseSpeed" $mouseSpeed
}


# File Explorer Launch Page
$fileExplorerLaunchPage = switch ($fileExplorerLaunchPage) { "This PC" { 1 } "Home" { 2 } default { 2 } }
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" "LaunchTo" $fileExplorerLaunchPage


# 'End Task' Taskbar Option
Set-Reg "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\TaskbarDeveloperSettings" "TaskbarEndTask" ([int]$endTaskTaskbarOption)


# Sloppy Focus & Do Not Change Window Ordering During Focus
if ($sloppyFocus) {
    Set-Reg "HKCU:\Control Panel\Desktop" "UserPreferencesMask" ([byte[]](0x9F,0x1E,0x07,0x80,0x12,0x00,0x00,0x00))
    Set-Reg "HKCU:\Control Panel\Desktop" "ActiveWndTrkTimeout" 0
} else {
    Set-Reg "HKCU:\Control Panel\Desktop" "UserPreferencesMask" ([byte[]](0x9E,0x1E,0x07,0x80,0x12,0x00,0x00,0x00))
}
