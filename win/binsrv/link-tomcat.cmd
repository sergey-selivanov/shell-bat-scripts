if "" == "%1" goto warn

set TARGETDIR=c:\binsrv

call c:\bin\link-dir.cmd %TARGETDIR%\%1 %TARGETDIR%\tomcat

goto end

:warn

echo Usage: %~nx0 apache-tomcat-x.x.x-dir

:end
