# Windows 11 Config

Edit a key-value file with your preferences to create a portable configuration script for Windows 11.

# Features

### Highlights
A few of the included configurable/optional features:
 - Dark/Light mode
 - Remove web results from Start menu search
 - Remove or set menu appearance delay
 - Show file extensions
 - Stop Windows from compressing JPEG wallpapers
 - Disable system sounds
 - Read the hardware clock at UTC (used so Windows gets the correct local time when dual-booting with a UNIX-based OS)
 - Disable automatic file sample submission
 - ...
 
### All Settings
Each setting is documented in its own default configuration file.
Read [user.md](), [root.md](), and [sec.md]() for more info on the settings in `user.ps1`, `root.ps1`, and `sec.ps1` accordingly.


# Usage

### 1. Download
Clone or download the repository to any location on your computer.

### 2. Configure Preferences
Navigate to `./User/default/` and edit the values in any `user.ps1`, `root.ps1`, or `sec.ps1` to your liking.
The values are set as the Windows defaults before configuration.

### 3. Apply User Configuration
Open a non-elevated terminal window and run:
```ps1
# Do not run with elevated privileges
powershell -ExecutionPolicy Bypass -File ./Scripts/userconf.ps1
```

### 4. Apply Elevated Configuration (optional)
Open an elevated terminal window and run:
```ps1
powershell -ExecutionPolicy Bypass -File ./Scripts/rootconf.ps1
```

### 5. Apply Security Configuration (optional)
Disable [tamper protection](https://learn.microsoft.com/en-us/defender-endpoint/manage-tamper-protection-individual-device) under Virus & threat protection settings.
Open an elevated terminal window and run:
```ps1
powershell -ExecutionPolicy Bypass -File ./Scripts/secconf.ps1
```

### 6. Reboot
Many of the changes require a reboot or shell restart to take full effect.
