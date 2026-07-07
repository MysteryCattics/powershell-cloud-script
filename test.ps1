[Console]::OutputEncoding = [System.Text.Encoding]::UTF8
[Console]::InputEncoding = [System.Text.Encoding]::UTF8
Clear-Host

Write-Host "Welcome to the PowerShell Utility Menu!`n" -ForegroundColor Cyan

Write-Host "`nWarning! This is a cloud tool, so you cannot run it without downloading anything. If you use any of the utilities below, the actions will be preformed ON YOUR COMPUTER.`n" -ForegroundColor Yellow

# Выводим красивое меню белым цветом (или любым другим)
Write-Host "Choose a utility`n" -ForegroundColor White
Write-Host "1. File encryptor" -ForegroundColor White
Write-Host "2. FFmpeg CLI" -ForegroundColor White
Write-Host "3. СОВА НА СКАКАЛКЕ" -ForegroundColor Red  # Сову можно и выделить :)
Write-Host "(Ctrl+C to exit)`n" -ForegroundColor DarkGray

# utf8 pls
$choice = Read-Host "Enter your choice (1-3)"

# Логика условий
if ($choice -eq "1") {
    Write-Host "You chose File encryptor. Rediecting you to File encryptor..." -ForegroundColor Cyan
    Write-Host "Press any key to continue..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Clear-Host
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MysteryCattics/powershell-cloud-script/refs/heads/main/encryptor.ps1" | Invoke-Expression

} elseif ($choice -eq "2") {
    Write-Host "You chose FFmpeg CLI." -ForegroundColor Green
    Write-Host "Press any key to continue..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Clear-Host
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MysteryCattics/powershell-cloud-script/refs/heads/main/ffmpegConverter.ps1" | Invoke-Expression
} elseif ($choice -eq "3") {
    Write-Host "You chose СОВА НА СКАКАЛКЕ. Прыг-скок!" -ForegroundColor Cyan
    Write-Host "Press any key to continue..." -ForegroundColor Yellow
    $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
    Clear-Host
    Invoke-WebRequest -Uri "https://raw.githubusercontent.com/MysteryCattics/powershell-cloud-script/refs/heads/main/sova.ps1" | Invoke-Expression
} else {
    Write-Host "Invalid choice. Please run the script again and select a valid option." -ForegroundColor Red
}