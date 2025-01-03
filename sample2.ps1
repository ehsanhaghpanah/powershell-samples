function Get-FilesInFolder
{
    param
    (
        [Parameter(Mandatory = $true)]
        [string] $SearchPath
    )

    # checks if search path exists
    if (-not (Test-Path -Path $SearchPath))
    {
        Write-Error "The folder path '$SearchPath' does not exist."
        return
    }

    # gets all files in search path and its subfolders
    $files = Get-ChildItem -Path $SearchPath -File -Recurse

    # returns only files' names
    return $files.Name
}

$list = Get-FilesInFolder -SearchPath "G:\"
$list | ForEach-Object { Write-Host $_ }