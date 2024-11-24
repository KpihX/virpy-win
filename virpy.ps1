param (
    [string]$action,
    [string]$envName
)

# Define the path to the scripts
$scriptDir = "C:\Users\kapoi\.scripts\py-env-scripts"

# Function to display usage
function Show-Usage {
    Write-Output "Usage: virpy [create|c] [list|l] [delete|d] [help|h] <environment_name>"
    Write-Output ""
    Write-Output "Commands:"
    Write-Output "  create, c <environment_name>  Create a new virtual environment with the specified name."
    Write-Output "  list, l                       List all virtual environments."
    Write-Output "  delete, -d <environment_name> Delete the specified virtual environment."
    Write-Output "  help, h                       Display this help message."
    Write-Output ""
    Write-Output "Examples:"
    Write-Output "  virpy c env      Create a new virtual environment named 'env'."
    Write-Output "  virpy l          List all virtual environments."
    Write-Output "  virpy d env      Delete the virtual environment named 'env'."
    Write-Output "  virpy h          Display this help message."
}

# Check if action is provided
if (-not $action) {
    Write-Error "Error: No action provided."
    Show-Usage
    exit 0
}

# Perform the action based on the provided parameter
switch ($action) {
    "create" {
        if (-not $envName) {
            Write-Error "Error: No environment name provided for --create action."
            Show-Usage
            exit 1
        }
        & "$scriptDir\set-gen-py-env.ps1" $envName
    }
    "c" {
        if (-not $envName) {
            Write-Error "Error: No environment name provided for -c action."
            Show-Usage
            exit 1
        }
        & "$scriptDir\set-gen-py-env.ps1" $envName
    }
    "list" {
        & "$scriptDir\list-gen-py-env.ps1"
    }
    "l" {
        & "$scriptDir\list-gen-py-env.ps1"
    }
    "delete" {
        if (-not $envName) {
            Write-Error "Error: No environment name provided for --delete action."
            Show-Usage
            exit 1
        }
        & "$scriptDir\del-gen-py-env.ps1" $envName
    }
    "d" {
        if (-not $envName) {
            Write-Error "Error: No environment name provided for -d action."
            Show-Usage
            exit 1
        }
        & "$scriptDir\del-gen-py-env.ps1" $envName
    }
    "help" {
        Show-Usage
    }
    "h" {
        Show-Usage
    }
    default {
        Write-Error "Error: Invalid action provided."
        Show-Usage
        exit 1
    }
}
