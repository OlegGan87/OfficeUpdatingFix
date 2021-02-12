@echo off
if %1 == stage1 goto :stage1
if %1 == stage2 goto :stage2
exit
:stage1
reg add "HKLM\Software\Microsoft\Windows\CurrentVersion\RunOnce" /v FixOffice /t reg_sz /d "c:\office2019fix.bat stage2"
shutdown -r -f -t 0
exit
:stage2
echo Reparing Microsoft Office...
pause
"C:\Program Files\Microsoft Office 15\ClientX64\OfficeClicktoRun.exe" scenario=Repair platform=x64 culture=ru-ru DisplayLevel=False
exit
