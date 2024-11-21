# ```powershell
# This script will:
# - Attempt to close Microsoft Teams by:
#   - Finding the process ID of Teams
#   - Terminating the process

$teamsProcess = Get-Process -Name "Teams" -ErrorAction SilentlyContinue
if ($teamsProcess) {
    Stop-Process -Id $teamsProcess.Id -Force
    Write-Output "Microsoft Teams has been closed."
} else {
    Write-Output "Microsoft Teams is not running."
}
# ```