if "" == "%1" goto warn

set TARGETDIR=c:\bin
set CYGWINBINDIR=c:\cygwin\bin

: gradle-6.4.1-bin
set filename=%~n1
: gradle-6.4.1
: see set /? for = substitution
set dirname=%filename:-bin=%


%CYGWINBINDIR%\unzip -u %1 -d %TARGETDIR%

call c:\bin\link-dir.cmd %TARGETDIR%\%dirname% %TARGETDIR%\maven

goto end

:warn

echo Usage: %~nx0 apache-maven-xx-bin.zip

:end
