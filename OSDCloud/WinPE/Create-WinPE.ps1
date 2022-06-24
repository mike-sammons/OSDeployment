Set-ExecutionPolicy -ExecutionPolicy RemoteSigned
Install-Module OSD -Force
New-OSDCloudTemplate -Language en-gb -SetAllIntl en-gb -SetInputLocale en-gb -Verbose
New-OSDCloudWorkspace -WorkspacePath C:\OSDCloud -Verbose

#Download
  $WallpaperURL = "https://raw.githubusercontent.com/mike-sammons/OSDeployment/main/OSDCloud/Wallpapers/Wallpaper.jpg"
  $OutFilePath = "$env:ProgramData\OSDCloud\Config\Wallpaper"
  $OutFile = "$OutFilePath\Wallpaper.jpg"
    if (!(Test-Path -Path $OutFilePath)){$NewFolder = New-Item -Path $OutFilePath -ItemType Directory -Force}
    if (Test-Path -Path $OutFile){Remove-Item -Path $OutFile -Force}
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    Invoke-WebRequest -UseBasicParsing -Uri $WallpaperURL -OutFile $OutFile 

$Params = @{
    CloudDriver = 'HP','IntelNet','Surface','USB'
    Wallpaper = "C:\ProgramData\OSDCloud\Config\Wallpaper\Wallpaper.jpg"
}
Edit-OSDCloudWinPE @Params -Verbose
New-OSDCloudIso -Verbose