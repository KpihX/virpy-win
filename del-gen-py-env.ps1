param (
    [string]$envName
)

if (-not $envName) {
    Write-Error "Error: No environment name provided."
    Write-Output "Usage: .\delete-py-env.ps1 <environment_name>"
    exit 1
}

$pyEnvDir = "$HOME\.py-env"
$envPath = "$pyEnvDir\$envName"

# Check if the environment directory exists
if (-not (Test-Path -Path $envPath)) {
    Write-Output "Error: Environment $envName does not exist."
    exit 1
}

# Remove the virtual environment directory
Write-Output "Deleting virtual environment $envName..."
Remove-Item -Path $envPath -Recurse -Force

Write-Output "Virtual environment $envName deleted successfully."
