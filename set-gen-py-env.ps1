param (
    [string]$envName
)

if (-not $envName) {
    Write-Error "Error: No environment name provided."
    Write-Output "Usage: .\set-gen-py-env.ps1 <environment_name>"
    exit 1
}

$pyEnvDir = "$HOME\.py-env"

# Create the .py-env directory if it doesn't exist
if (-not (Test-Path -Path $pyEnvDir)) {
    Write-Output "Creating directory $pyEnvDir..."
    New-Item -ItemType Directory -Path $pyEnvDir
    if (-not $?) {
        Write-Output "Error: Failed to create directory $pyEnvDir."
        exit 1
    }
}

# Create the virtual environment
Write-Output "Creating virtual environment $envName..."
python -m venv "$pyEnvDir\$envName"
if ($LASTEXITCODE -ne 0) {
    Write-Output "Error: Failed to create virtual environment $envName."
    exit 1
}

# Activate the virtual environment
Write-Output "Activating virtual environment $envName..."
& "$pyEnvDir\$envName\Scripts\Activate.ps1"
if ($LASTEXITCODE -ne 0) {
    Write-Output "Error: Failed to activate virtual environment $envName."
    exit 1
}

# Install Jupyter
Write-Output "Installing Jupyter..."
pip install jupyter
if ($LASTEXITCODE -ne 0) {
    Write-Output "Error: Failed to install Jupyter."
    exit 1
}

# Install ipykernel
Write-Output "Installing ipykernel..."
pip install ipykernel
if ($LASTEXITCODE -ne 0) {
    Write-Output "Error: Failed to install ipykernel."
    exit 1
}

# Install the Jupyter kernel
Write-Output "Installing Jupyter kernel for environment $envName..."
python -m ipykernel install --user --name=$envName --display-name "Python ($envName)"
if ($LASTEXITCODE -ne 0) {
    Write-Output "Error: Failed to install Jupyter kernel for environment $envName."
    exit 1
}

# Deactivate the virtual environment
Write-Output "Deactivating virtual environment $envName..."
Deactivate

Write-Output "Virtual environment $envName and Jupyter kernel installed successfully."
