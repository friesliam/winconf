# Web Search Results in Start Menu
# Windows 11 default = true
# Options = [true] [false]
$webSearchResults = $false
# Not in standard settings
# WARNING: May display an indexing error if disabled despite working normally

# Send Diagnostic Data
# Windows 11 default = ???
# Options = [0 = None (only enterprise editions, defaults to 1 otherwise)] [1 = Required] [3 = Full]
$sendDiagnosticData = 0
# Settings -> Privacy & Security -> Diagnostics & feedback -> Send optional diagnostic data

# File Paths Longer than 260 Chars
# Windows 11 default = false
# Options = [true] [false]
$allowLongFilePaths = $true
# Settings -> System -> Advanced -> File Explorer -> Enable long Paths

# Read Hardware Clock as UTC (allows windows to determine the correct local time when dual-booting with linux)
# Windows 11 default = false
# Options [true] [false]
$hardwareClockIsUTC = $false
# Not in standard settings

# Settings Launch Page
# Windows 11 default = "Home"
# Options = ["Home"] ["System"]
$settingsHomeTab = "System"
# Not in standard settings

# Developer Mode
# Windows 11 default = false
# Options = [true] [false]
$developerMode = $false
# Settings -> System -> Advanced -> Developer Mode
