@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Server 2019 By Rizka" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Run" /f /v Wallpaper /t REG_SZ /d D:\a\wallpaper.bat
net user RizkaPC @Rizka /add >nul
net localgroup administrators RizkaPC /add >nul
net user RizkaPC /active:yes >nul
net user installer /delete
diskperf -Y >nul
sc config Audiosrv start= auto >nul
sc start audiosrv >nul
ICACLS C:\Windows\Temp /grant RizkaPC:F >nul
ICACLS C:\Windows\installer /grant RizkaPC:F >nul
echo  Successfully Installed !, If the RDP is Dead, Please Re Run Job Again! 
echo IP:
tasklist | find /i "ngrok.exe" >Nul && curl -s localhost:4040/api/tunnels | jq -r .tunnels[0].public_url || echo "Unable to get the NGROK tunnel, make sure the NGROK_AUTH_TOKEN is correct in Settings> Secrets> Repository secret. Maybe your previous VM is still running: https://dashboard.ngrok.com/status/tunnels"
echo Username: RizkaPC
echo Password: @Rizka
echo .
echo  RDP by Rizka
echo   Please Login to Your RDP !
ping -n 10 127.0.0.1 >nul
