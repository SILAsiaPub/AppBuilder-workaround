@echo off
echo Starting to collect information about your system.
call :check_Permissions
call :detectdateformat
call :date
call :time
call :backupreg
call :getjavaw
call :writereg
goto :eof

:getjavaw
echo Checking where the Java JDK is installed.
set KEY="HKLM\SOFTWARE\JavaSoft\Java Development Kit\1.8"
FOR /F "usebackq skip=2 tokens=3,4" %%A IN (`REG QUERY %KEY% /v JavaHome`) DO set javapath=%%A %%B
set javaw=%javapath%\jre\bin\javaw.exe
echo Found at: %javapath%
goto :eof

:writereg
:: reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Uninstall\Server" /v DisplayName /t REG_SZ /d Server
echo Writing new values to registry. Old values have been backed up.
echo Should you need to restore old values, then right click on the dated file then select Merge.
reg add "HKLM\SOFTWARE\Classes\.jar" /ve /t REG_SZ /d jarfile
reg add "HKLM\SOFTWARE\Classes\jarfile\shell\open\command" /ve /t REG_SZ /d "\"%javaw%\" -jar \"%%1\" %%*"
goto :eof

:backupreg
echo Backing up .jar reg entries to jar-%curisodate%-%curhhmm%.reg
echo Backing up jarfile reg entries to and jarfile-%curisodate%-%curhhmm%.reg
REG export "HKLM\SOFTWARE\Classes\.jar" jar-%curisodate%-%curhhmm%.reg
REG export "HKLM\SOFTWARE\Classes\jarfile\shell\open\command" jarfile-%curisodate%-%curhhmm%.reg
goto :eof

:detectdateformat
:: Description: Get the date format from the Registery: 0=US 1=AU 2=iso
set KEY_DATE="HKCU\Control Panel\International"
FOR /F "usebackq skip=2 tokens=3" %%A IN (`REG QUERY %KEY_DATE% /v iDate`) DO set dateformat=%%A
rem get the date separator: / or -
FOR /F "usebackq skip=2 tokens=3" %%A IN (`REG QUERY %KEY_DATE% /v sDate`) DO set dateseparator=%%A
rem get the time separator: : or ?
FOR /F "usebackq skip=2 tokens=3" %%A IN (`REG QUERY %KEY_DATE% /v sTime`) DO set timeseparator=%%A
rem set project log file name by date
goto :eof

:date
:: Description: Returns multiple variables with date in three formats, the year in wo formats, month and day date.
:: Revised: 2016-05-04
:: Classs: command - internal - date -time
:: Required preset variables:
:: dateformat
:: dateseparator
rem got this from: http://www.robvanderwoude.com/datetiment.php#IDate
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
FOR /F "tokens=1-4 delims=%dateseparator% " %%A IN ("%date%") DO (
    IF "%dateformat%"=="0" (
        SET fdd=%%C
        SET fmm=%%B
        SET fyyyy=%%D
    )
    IF "%dateformat%"=="1" (
        SET fdd=%%B
        SET fmm=%%C
        SET fyyyy=%%D
    )
    IF "%dateformat%"=="2" (
        SET fdd=%%D
        SET fmm=%%C
        SET fyyyy=%%B
    )
)
set curdate=%fyyyy%-%fmm%-%fdd%
set curisodate=%fyyyy%-%fmm%-%fdd%
set curyyyymmdd=%fyyyy%%fmm%%fdd%
set curyymmdd=%fyyyy:~2%%fmm%%fdd%
set curUSdate=%fmm%/%fdd%/%fyyyy%
set curAUdate=%fdd%/%fmm%/%fyyyy%
set curyyyy=%fyyyy%
set curyy=%fyyyy:~2%
set curmm=%fmm%
set curdd=%fdd%
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof

:time
:: Description: Retrieve time in several shorter formats than %time% provides
:: Created: 2016-05-05
if defined debugdefinefunc echo %beginfuncstring% %0 %debugstack% %beginfuncstringtail%
FOR /F "tokens=1-4 delims=:%timeseparator%." %%A IN ("%time%") DO (
  set curhhmm=%%A%%B
  set curhhmmss=%%A%%B%%C
  set curhh_mm=%%A:%%B
  set curhh_mm_ss=%%A:%%B:%%C
)
if defined debugdefinefunc echo %endfuncstring% %0 %debugstack%
goto :eof

:writereg1
:: unused
echo Windows Registry Editor Version 5.00> java.reg
echo.>> java.reg
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Classes\jarfile\shell\open\command]>> java.reg
echo ^@="\"%javaw:\=\\%\" -jar \"%%1\" %%*">> java.reg
echo.>> java.reg
goto :eof

:check_Permissions
    echo Administrative permissions required. 
    echo Detecting permissions...

    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo.
        echo Success: Administrative permissions confirmed.
        echo.
    ) else (
        echo.
        echo Failure: You need to run this file as Administrator.
        echo.
        echo Start this file by Right clicking and choose: Run as administrator
        pause
        exit
    )
goto :eof