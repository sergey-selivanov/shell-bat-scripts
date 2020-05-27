if "" == "%1" goto warn

set JDK_HOME=c:\bin\%1
set JAVA_HOME=%JDK_HOME%
set PATH=%JDK_HOME%\bin;%PATH%

goto end

:warn

echo argument needed, jdk dir name

:end
