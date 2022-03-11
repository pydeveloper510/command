@echo off
title RDP LOG CLEAR 
mode con cols=60 lines=10
color 1F


goto INIT


:INIT
cls
echo.
echo		
echo		               RDP LOG CLEAR              
echo		                                          
echo		  Delete Registry	                   
echo		  Delete Default.RDP                      
echo		
echo.
echo 원격 데스크탑의 모든 연결 기록이 지워집니다.
goto INPUT

:INPUT
set /p YN=기록을 지우시겠습니까(Y/N)?

if /i "%YN%" == "y" goto DELETE
if /i "%YN%" == "n" goto EXIT

goto :INIT


:DELETE
cls
REG DELETE "\\.\HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Default" /va /f
REG DELETE "\\.\HKEY_CURRENT_USER\Software\Microsoft\Terminal Server Client\Servers" /f
:: Win XP
del "%userprofile%\My Documents\Default.rdp" /A:h 
del "%userprofile%\My Documents\Default.rdp"
:: Win 7
del "%userprofile%\Documents\Default.rdp" /Q /A:h 
del "%userprofile%\Documents\Default.rdp" /Q 
goto END



:END
cls
echo.
echo		
echo		               RDP LOG CLEAR              
echo		                                          
echo		  Delete Registry	...   success      
echo		  Delete Default.RDP   ...   success      
echo		
echo.
echo 기록이 제거되었습니다. 아무키나 누르세요.
pause > nul

:EXIT
cls
