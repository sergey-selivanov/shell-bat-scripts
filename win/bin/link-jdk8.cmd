if "" == "%1" goto warn

set TARGETDIR=c:\bin

call c:\bin\link-dir.cmd %TARGETDIR%\%1 %TARGETDIR%\jdk8

goto end

:warn

echo Usage: %~nx0 jdk8-x.x.x-dir

:end
