@echo off
echo Create a keystore with keystore_name and key_alias as parameters.
set keystorename=%1
set keyalias=%2
if not defined keystorename set keystorename=my-release-key
if not defined keyalias set keyalias=my-alias
call :getjavapath
set keytool=%javapath%\keytool.exe
if not exist "%keytool%" echo The keytool.exe was not found. This program will exit. & exit
echo "%keytool%" -genkey -v -keystore %keystorename%.keystore -alias %keyalias% -keyalg RSA -keysize 2048 -validity 10000
"%keytool%" -genkey -v -keystore %keystorename%.keystore -alias %keyalias% -keyalg RSA -keysize 2048 -validity 10000
goto :eof

:getjavapath
set KEY="HKLM\SOFTWARE\JavaSoft\Java Development Kit\1.8"
FOR /F "usebackq skip=2 tokens=3,4" %%A IN (`REG QUERY %KEY% /v JavaHome`) DO set javapath=%%A %%B
set javapath=%javapath%\bin
goto :eof