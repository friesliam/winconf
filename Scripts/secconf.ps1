# Change this to the correct file
. "$PSScriptRoot\..\User\spaceorcas\sec.ps1"



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


# https://learn.microsoft.com/en-us/powershell/module/defender/set-mppreference
Set-MpPreference -SubmitSamplesConsent $autoSampleSubmission


# Cloud-based Protection & Malicious Software Reporting
# https://learn.microsoft.com/en-us/powershell/module/defender/set-mppreference
Set-MpPreference -MAPSReporting $cloudBasedProtection
