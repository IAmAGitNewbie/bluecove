@echo off
rem @version $Revision$ ($Author$)  $Date$

call %~dp0version.cmd
if errorlevel 1 goto errormark

set DEFAULT_BUILD_HOME=%~dp0
for /f %%i in ("%DEFAULT_BUILD_HOME%..") do @set DEFAULT_BUILD_HOME=%%~fi

set BLUECOVE_TESTER_HOME=%DEFAULT_BUILD_HOME%
set BLUECOVE_PROJECT_HOME=%DEFAULT_BUILD_HOME%\..\..\bluecove

set BLUECOVE_TESTER_JAR=%BLUECOVE_TESTER_HOME%\target\bluecove-tester-%BLUECOVE_VERSION%.jar
set BLUECOVE_TESTER_APP_JAR=%BLUECOVE_TESTER_HOME%\target\bluecove-tester-%BLUECOVE_VERSION%-app.jar

set BLUECOVE_3RDPARTY_HOME=%DEFAULT_BUILD_HOME%\..\..\3p

set JVM_ARGS=

rem set JAVA_HOME=D:\jdk1.5.0
rem set JAVA_HOME=D:\harmony-jdk-629320
rem set PATH=%JAVA_HOME%\bin;%PATH%

set MAVEN2_REPO=%HOMEDRIVE%\%HOMEPATH%\.m2\repository
set PATH=%JAVA_HOME%\bin;%PATH%

set WMDPT="%ProgramFiles%\Windows Mobile Developer Power Toys"
if exist %WMDPT%\CECopy\cecopy.exe goto pt_found
echo Windows Mobile Developer Power Toys Not Found
goto :errormark

:pt_found

set _JVM_MYSAIFU=true
set WIN_CE_PHONE=true

set ASSEMBLY_ID=app

set WIN_CE_JVM_ARGS=
rem set WIN_CE_JVM_ARGS=%WIN_CE_JVM_ARGS% -Dbluecove.debug=true

if NOT '%WIN_CE_PHONE%' EQU 'true' (
    set BLUECOVE_INSTALL_DIR=\bluecove
)

if '%WIN_CE_PHONE%' EQU 'true' (
    set BLUECOVE_INSTALL_DIR=\Storage\bluecove
    set ASSEMBLY_ID=phone
)

rem set BLUECOVE_INSTALL_DIR=\Storage Card\bluecove


rem @for /f "tokens=*" %%I in ('CD') do @set CurDir=%%~nI
rem @title %CurDir%

goto endmark
:errormark
    pause
	exit /b 1
:endmark

