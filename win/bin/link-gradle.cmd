if "" == "%1" goto warn

set TARGETDIR=c:\bin

call c:\bin\link-dir.cmd %TARGETDIR%\%1 %TARGETDIR%\gradle

goto end

:warn

echo Usage: %~nx0 gradle-x.x.x-dir

:end
