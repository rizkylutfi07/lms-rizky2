@echo off
echo Opening Windows Firewall for LMS ports...
netsh advfirewall firewall add rule name="LMS Frontend Port 3000" dir=in action=allow protocol=TCP localport=3000
netsh advfirewall firewall add rule name="LMS API Port 3001" dir=in action=allow protocol=TCP localport=3001
echo Done! Ports 3000 and 3001 are now open for LAN access.
pause
