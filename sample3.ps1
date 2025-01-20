# Define the root directory
$rootPath = "F:\.mega.io\"

# Hashtable to group files by size
$fileGroups = @{}

# Step 1: Group files by size
Get-ChildItem -Path $rootPath -Recurse -File | ForEach-Object {
    $size = $_.Length
    if (-not $fileGroups.ContainsKey($size)) {
        $fileGroups[$size] = @()
    }
    $fileGroups[$size] += $_.FullName
}

Write-Output $fileGroups.Count

# # Hashtable to group files by hash
# $hashGroups = @{}

# # Step 2: Compute hashes for files with the same size
# foreach ($size in $fileGroups.Keys) {
#     if ($fileGroups[$size].Count -gt 1) {
#         foreach ($file in $fileGroups[$size]) {
#             # Compute SHA256 hash
#             $hash = Get-FileHash -Algorithm SHA256 -Path $file | Select-Object -ExpandProperty Hash
#             if (-not $hashGroups.ContainsKey($hash)) {
#                 $hashGroups[$hash] = @()
#             }
#             $hashGroups[$hash] += $file
#         }
#     }
# }

# # Step 3: Output duplicate files
# foreach ($hash in $hashGroups.Keys) {
#     if ($hashGroups[$hash].Count -gt 1) {
#         Write-Output "Duplicate files with hash $hash:"
#         $hashGroups[$hash] | ForEach-Object { Write-Output "  $_" }
#         Write-Output ""
#     }
# }
