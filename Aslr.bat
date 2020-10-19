@ECHO OFF
SETLOCAL

ECHO ASLR Enable or Diable Bat script 
ECHO Run as Administrator
ECHO Once Disabled , binaries will be prone to Stack smashing and buffer overflow exploits
ECHO Regards TheEyeOfCyber
 
set /p Choice=Want to Enable or Disable ASLR? (en or di):%=%

if "%Choice%"=="en" goto :ENABLE
if "%Choice%"=="di" goto :DISABLE

:ENABLE
	reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MoveImages" /t REG_DWORD /d 1 /f
	goto :EOF
:DISABLE
	reg delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "MoveImages"
	goto :EOF
