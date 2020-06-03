if "" == "%1" goto warn

set TARGETDIR=c:\bin
set CYGWINBINDIR=c:\cygwin\bin

: gradle-6.4.1-bin
set filename=%~n1
: gradle-6.4.1
: see set /? for = substitution
set dirname=%filename:-bin=%

: set env var from result of other command: set env var from 1st line of file
: set tmpfile=%TEMP%\%~n0.temp
: echo blabla > %tmpfile%
: set /p TSTENV=<%tmpfile%
: echo TSTENV=%TSTENV%
: replace string in env var
: echo dirname=%filename:-bin=%

%CYGWINBINDIR%\unzip -u %1 -d %TARGETDIR%
copy %TARGETDIR%\%dirname%\bin\gradle.bat %TARGETDIR%\%dirname%\bin\g.cmd
copy gradle\gupd.cmd %TARGETDIR%\%dirname%\bin

call c:\bin\link-dir.cmd %TARGETDIR%\%dirname% %TARGETDIR%\gradle

goto end

:warn

echo Usage: %~nx0 gradle-xx-bin.zip

:end
