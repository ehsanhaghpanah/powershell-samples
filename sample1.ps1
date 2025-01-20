
# define the target folder and output file
$target = "F:\.mega.io\"
$output = "I:\books.txt"

# get files in target folder and its subfolders
$files = Get-ChildItem -Path $target -File -Recurse

# Save the list of files to the output file
$files.FullName | Out-File -FilePath $output -Encoding UTF8

Write-Host "list saved to $output"