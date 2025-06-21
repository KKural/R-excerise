# PowerShell script to renumber exercises
$basePath = "C:\Users\kukumar\OneDrive - UGent\Desktop\R job dodona\R-excerise\R-excerise"

# Mapping of existing directory names to new directory names
$directoryMappings = @{
    "1. Level of measurement" = "1. Level of measurement"
    "1.1. Creating variables with appropriate types" = "2. Creating variables with appropriate types"
    "1.2. Identifying measurement levels" = "3. Identifying measurement levels"
    "1. Assign number of burglaries" = "4. Assign number of burglaries"
    "2. Load crime dataset" = "5. Load crime dataset"
    "3. Calculate average offenses" = "6. Calculate average offenses"
    "4. Generate frequency tables" = "7. Generate frequency tables"
    "5. Describe offender age" = "8. Describe offender age"
    "6. Filter violent crimes" = "9. Filter violent crimes"
    "7. Crime rate calculation" = "10. Crime rate calculation"
    "8. Crime rates national average" = "11. Crime rates national average"
    "9. Scatterplot unemployment" = "12. Scatterplot unemployment"
}

# Remove the following directories as they're redundant or will be renamed
$directoriesToRemove = @(
    "2. Basic R operations"
    "2.1. Assign number of burglaries"
    "2.2. Load crime dataset"
    "2.3. Calculate average offenses"
)

# Function to rename a directory
function Rename-Directory {
    param (
        [string]$oldName,
        [string]$newName
    )
    
    $oldPath = Join-Path -Path $basePath -ChildPath $oldName
    $newPath = Join-Path -Path $basePath -ChildPath $newName
    
    if (Test-Path -Path $oldPath) {
        # Check if destination directory exists
        if (-not (Test-Path -Path $newPath)) {
            # Create destination directory
            New-Item -Path $newPath -ItemType Directory -Force | Out-Null
            
            # Copy contents from old directory to new directory
            Get-ChildItem -Path $oldPath -Force | ForEach-Object {
                Copy-Item -Path $_.FullName -Destination $newPath -Recurse -Force
            }
            
            Write-Host "Renamed: $oldName -> $newName"
        } else {
            Write-Host "Destination directory already exists: $newName"
        }
    } else {
        Write-Host "Source directory not found: $oldName"
    }
}

# Delete redundant directories
foreach ($dir in $directoriesToRemove) {
    $dirPath = Join-Path -Path $basePath -ChildPath $dir
    if (Test-Path -Path $dirPath) {
        Remove-Item -Path $dirPath -Recurse -Force
        Write-Host "Removed directory: $dir"
    }
}

# Rename directories according to the mapping
foreach ($mapping in $directoryMappings.GetEnumerator()) {
    Rename-Directory -oldName $mapping.Key -newName $mapping.Value
}

Write-Host "Exercise renumbering completed."
