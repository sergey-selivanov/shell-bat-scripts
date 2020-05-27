:@echo off

: unzip-tomcat apache-tomcat.zip 7

set TARGETDIR=c:\binsrv

set file=%1
:FOR %%i IN ("%file%") DO (
: set filename=%%~ni
:)

set filename=%~n1

echo %filename%

set PORT_SHUTDOWN=%2005
set PORT_HTTP=%2080
set PORT_HTTPS=%2443
set PORT_AJP=%2009
		
echo %PORT_SHUTDOWN%
		
c:\cygwin\bin\unzip -o %1 -d %TARGETDIR%

echo "Editing %CONF% ..."

set CONF=%TARGETDIR%\%filename%\conf\server.xml

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
