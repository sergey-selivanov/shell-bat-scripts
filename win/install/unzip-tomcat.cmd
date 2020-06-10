:@echo off

: unzip-tomcat apache-tomcat.zip 7

if "" == "%1" goto warn

set PORT_BASE=%2
if "" == "%PORT_BASE%" set PORT_BASE=7


set TARGETDIR=c:\binsrv

set file=%1
:FOR %%i IN ("%file%") DO (
: set filename=%%~ni
:)

set filename=%~n1

echo %filename%

set PORT_SHUTDOWN=%PORT_BASE%005
set PORT_HTTP=%PORT_BASE%080
set PORT_HTTPS=%PORT_BASE%443
set PORT_AJP=%PORT_BASE%009

echo %PORT_SHUTDOWN%

c:\cygwin\bin\unzip -o %1 -d %TARGETDIR%

set CONF=%TARGETDIR%\%filename%\conf\server.xml
echo "Editing %CONF% ..."

: --in-place=.orig
:move %CONF% %CONF%.orig
:pause

pushd %TARGETDIR%

c:\cygwin\bin\sed ^
 --in-place=.orig ^
 -e s/port="""8005"""/port="""%PORT_SHUTDOWN%"""/ ^
 -e s/port="""8080"""/port="""%PORT_HTTP%"""/ ^
 -e s/port="""8443"""/port="""%PORT_HTTPS%"""/ ^
 -e s/redirectPort="""8443"""/redirectPort="""%PORT_HTTPS%"""/ ^
 -e s/port="""8009"""/port="""%PORT_AJP%"""/ ^
 %CONF%

:	> %CONF%

popd

call c:\bin\link-dir.cmd %TARGETDIR%\%filename% %TARGETDIR%\tomcat

goto end

:warn

echo Usage: %~nx0 apache-tomcat-xx.zip [7]

:end
