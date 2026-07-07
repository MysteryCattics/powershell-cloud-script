Clear-Host

Write-Host "Warning!" -ForegroundColor Red
Write-Host "This script will convert video/audio files using FFmpeg. Make sure you have FFmpeg installed and added to your system PATH." -ForegroundColor Yellow
Write-Host "If you don't have FFmpeg, please download it from https://ffmpeg.org/download.html and follow the installation instructions or just select 'download' on the menu." -ForegroundColor Gray

Write-Host "`nSelect what do you want to do:"
Write-Host "1. Convert a Video/Audio File" -ForegroundColor White
Write-Host "2. Download FFmpeg" -ForegroundColor Yellow
Write-Host "(Ctrl+C to exit)" -ForegroundColor Gray

$convertChoice = Read-Host "`nChoose an option (1-2)"
if ($convertChoice -eq "1") {
    $inputPath = (Read-Host "Enter the path of the video/audio file to convert").Trim('"')
    if (-not (Test-Path $inputPath)) {
        Write-Host "Input file not found!" -ForegroundColor Red
        exit
    }

    $outputPath = (Read-Host "Enter the output path for the converted file").Trim('"')
    $format = (Read-Host "Enter the desired output format (e.g., mp4, mp3, avi)").Trim()

    # Construct the FFmpeg command
    $ffmpegCommand = "ffmpeg -i `"$inputPath`" `"$outputPath.$format`""

    Write-Host "`nExecuting: $ffmpegCommand" -ForegroundColor Cyan
    Invoke-Expression $ffmpegCommand

    Write-Host "`nConversion completed. Output file: $outputPath.$format" -ForegroundColor Green
}
elseif ($convertChoice -eq "2") {
    Write-Host "Choose the installation type:" -ForegroundColor Yellow
    Write-Host "1. WinGet" -ForegroundColor White
    Write-Host "2. Chocolatey" -ForegroundColor White
    Write-Host "3. Manual Download" -ForegroundColor White
    Write-Host "4. Return to the menu" -ForegroundColor Gray

    $installChoice = Read-Host "`nChoose an option (1-3)"
    if ($installChoice -eq "1") {
        Write-Host "Installing FFmpeg using WinGet..." -ForegroundColor Cyan
        winget install ffmpeg
        Invoke-WebRequest -Uri "https://example.com/ffmpegConverter.ps1" | Invoke-Expression
    }
    elseif ($installChoice -eq "2") {
        Write-Host "Installing FFmpeg using Chocolatey..." -ForegroundColor Cyan
        choco install ffmpeg
        Invoke-WebRequest -Uri "https://example.com/ffmpegConverter.ps1" | Invoke-Expression
    }
    elseif ($installChoice -eq "3") {
        if (Test-Path "$env:USERPROFILE\TempDLFFMP" -eq $false) {
            
            $insDir = Read-Host "Enter the directory where you want to install FFmpeg (Default: C:\FFmpeg)"

            if ([string]::IsNullOrWhiteSpace($insDir)) {
                $insDir = "C:\FFmpeg"
            }

            New-Item -Path "$env:USERPROFILE" -Name "TempDLFFMP" -ItemType Directory
            $tempDir = "$insDir\TempDLFFMP"
            Write-Host "Downloading FFmpeg from Gyan.dev..." -ForegroundColor Cyan
            Invoke-WebRequest -Uri "https://download1655.mediafire.com/g98xjtu2newg4RdV212i78MLeCFHyOQB9EbDAAentAfkbkQSiYQQiEoEMmaM2azrAAnUAvtIQv0xjywegzdva1tEycDSGZHNIs1b3j1drcYyuu-eE1rfdAfR9Tl9BycpxTefsUXJQ8eNjUIyvhzrdWyLlsoBcdXvwgYyHVxhGw42MAE/ikws8ibq1gkqti5/ffmpeg-2026-07-06-git-c6498178bb-full_build.zip" -OutFile "$tempDir\ffmpeg.zip"
            Expand-Archive -Path "$tempDir\ffmpeg.zip" -DestinationPath "$tempDir"
            Set-Location "$tempDir\ffmpeg-2026-07-06-git-c6498178bb-full_build\bin"
            Copy-Item -Path * -Destination "$insDir" -Force
            Remove-Item -Path "$tempDir" -Recurse -Force
            Write-Host "FFmpeg installed successfully!" -ForegroundColor Green
            Write-Host "Press any key to restart the script... (or Ctrl+C to exit)" -ForegroundColor Yellow
            $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
            Invoke-WebRequest -Uri "https://example.com/ffmpegConverter.ps1" | Invoke-Expression
            }
        elseif (Test-Path "$env:USERPROFILE\TempDLFFMP") {
            Write-Host "Temporary directory already exists. Do you want to delete it?" -ForegroundColor Red
            $deleteChoice = Read-Host "Enter 'y' to delete or 'n' to cancel"
            if ($deleteChoice -eq "y") {
                Remove-Item -Path "$env:USERPROFILE\TempDLFFMP" -Recurse -Force
                Write-Host "Temporary directory deleted." -ForegroundColor Yellow
                Write-Host "Press any key to restart the script... (or Ctrl+C to exit)" -ForegroundColor Yellow
                $null = $Host.UI.RawUI.ReadKey("NoEcho,IncludeKeyDown")
                Invoke-WebRequest -Uri "https://example.com/ffmpegConverter.ps1" | Invoke-Expression
            }
        }

    
    
    }
    elseif ($installChoice -eq "4") {
        Write-Host "Returning to the main menu..." -ForegroundColor Yellow
        Invoke-WebRequest -Uri "https://example.com/test.ps1" | Invoke-Expression
    }
}
else {
    Write-Host "Invalid choice. Please run the script again and select a valid option." -ForegroundColor Red
}