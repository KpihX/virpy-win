$pyEnvDir = "$HOME\.py-env"

# Check if the .py-env directory exists
if (-not (Test-Path -Path $pyEnvDir)) {
    Write-Output "No virtual environments found."
    exit 0
}

# Get the list of virtual environments
$envs = Get-ChildItem -Path $pyEnvDir -Directory

if ($envs.Count -eq 0) {
    Write-Output "No virtual environments found."
    exit 0
}

Write-Output "List of general python virtual environments:"
foreach ($env in $envs) {
    Write-Output $env.Name
}
