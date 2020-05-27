if "" == "%1" goto warn

rd jdk
mklink /d jdk %1
goto end

:warn

echo argument needed

:end
