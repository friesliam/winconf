# Disable JPEG Wallpaper Quality Reduction
# Windows 11 default = true
# Options [true] [false]
$jpegWallpaperQualityReduction = $false
# Not in standard settings

# Enable Dark Mode
# Windows 11 default = false
# Options = [true] [false]
$darkMode = $true
# Settings -> Personalization -> Colors -> Choose your mode

# Taskbar Alignment
# Windows 11 default = 1
# Options = ["left"], ["center"]
$taskbarAlignment = "center"
# Settings -> Personalization -> Taskbar -> Taskbar Behaviors -> Taskbar alignment

# Disable Menu Delay (for example: right clicking and hovering over expandable menu options)
# Windows 11 default = 400
# Options = [0+ ms]
$menuDelay = 0
# Not in standard settings

# Lower Hover Delay (for example: hovering over applications in the taskbar)
# Windows 11 default = 400
# Options = [0+ ms]
$hoverDelay = 80
# Not in standard settings

# Show File Extensions
# Windows 11 default = false
# Options = [true] [false]
$showFileExtensions = $true
# Settings -> System -> Advanced -> File Explorer -> Show file extensions

# Show Hidden Files
# Windows 11 default = false
# Options = [true] [false]
$showHiddenFiles = $true
# Settings -> System -> Advanced -> File Explorer -> Show hidden and system files

# Show Full File Paths
# Windows 11 default = false
# Options = [true] [false]
$showFullFilePaths = $true
# Settings -> System -> Advanced -> File Explorer -> Show full path in title bar

# Show File Icons
# Windows 11 default = ???
# Options = [true] [false]
$showFileIcons = $true
# Settings location: ???

# Allow Powershell Scripts
# Windows 11 default = "Restricted"
# Options: ["Restricted" = None] ["AllSigned" = Signed] ["RemoteSigned" = Unsigned local, Signed remote] ["Unrestricted" = Unrestricted, Warnings] ["Bypass" = Unrestricted, No warnings]
$powershellExecutionPolicy = "Unrestricted"
# Settings -> System -> Advanced -> Powershell -> Change execution policy... (can not set to "Unrestricted")

# Start Menu Advertisiments
# Windows 11 default = true
# Options = [true] [false]
$startMenuAds = $false
# Settings -> Personalization -> Start -> Show recommendations for tips, shortcuts, new apps, and more

# Mobile Device Side Panel in Start Menu
# Windows 11 default = true
# Options = [true] [false]
$mobileDeviceInStart = $false
# Settings -> Personalization -> Start -> Show mobile device in start

# Full Right Click Menu
# Windows 11 default = false
# Options = [true] [false]
$fullRightClickMenu = $false
# Not in standard settings

# System Sounds (example: certain prompt boxes and notifications)
# Windows 11 default = .Default
# Options = ["Default"] ["None"]
$systemSounds = "None"
# Settings -> Personalization -> Themes -> Sounds -> Sound Scheme

# Sticky Keys
# Windows 11 default = true
# Options = [true] [false]
$stickyKeys = $false
# Settings -> Accessibility -> Keyboard -> Sticky Keys

# Mouse Sensitivity
# Windows 11 default = 10
# Options = [1..20]
$mouseSensitivity = 10
# Settings -> Bluetooth & devices -> Mouse -> Mouse pointer speed

# Mouse Acceleration
# Windows 11 default = true
# Options = [true] [false]
$mouseAcceleration = $false
# Settings -> Bluetooth & devices -> Mouse -> Enhance pointer precision

# File Explorer Launch Page
# Windows 11 default = 2
# Options ["Home"] ["This PC"]
$fileExplorerLaunchPage = "This PC"
# File Explorer -> ... -> Options -> Open File Explorer to

# 'End Task' Taskbar Option
# Windows 11 default = false
# Options = [true] [false]
$endTaskTaskbarOption = $true
# Settings -> System -> Advanced -> End Task

# Sloppy Focus & Do Not Change Window Ordering During Focus
# Windows 11 default = false
# Options [true] [false]
$sloppyFocus = $false
# Settings -> accessibility -> Mouse -> Activate on hover
