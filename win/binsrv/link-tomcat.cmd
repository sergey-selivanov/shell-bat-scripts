if "" == "%1" goto warn

rd tomcat
mklink /d tomcat %1
goto end

:warn

echo argument needed

:end
