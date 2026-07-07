Clear-Host

Write-Host "Warning!" -ForegroundColor Red
Write-Host "This script will encrypt or decrypt files/folders using Windows built-in encryption and will not affect opening then." -ForegroundColor Yellow

Write-Host "`nSelect what do you want to do:"
Write-Host "1. Encrypt a File/Folder" -ForegroundColor White
Write-Host "2. Decrypt a File/Folder" -ForegroundColor White
Write-Host "(Ctrl+C to exit)" -ForegroundColor Gray

$itemtype = Read-Host "`nChoose an option (1-2)"
if ($itemtype -eq "1") {
    $itemtype = "Encrypt"
} elseif ($itemtype -eq "2") {
    $itemtype = "Decrypt"
} else {
    Write-Host "Invalid choice. Please run the script again and select a valid option." -ForegroundColor Red
    exit
}


$path = (Read-Host "Enter the path of the file/folder to $itemtype").Trim('"')

if ($itemtype -eq "Encrypt") {
    if (Test-Path $path) {
        # Получаем объект файла или папки и вызываем метод Encrypt()
        (Get-Item $path).Encrypt()
        Write-Host "Successfully encrypted: $path" -ForegroundColor Green
    } else {
        Write-Host "Path not found!" -ForegroundColor Red
    }
}
else {
    if (Test-Path $path) {
        # Вызываем метод Decrypt()
        (Get-Item $path).Decrypt()
        Write-Host "Successfully decrypted: $path" -ForegroundColor Green
    } else {
        Write-Host "Path not found!" -ForegroundColor Red
    }
}


