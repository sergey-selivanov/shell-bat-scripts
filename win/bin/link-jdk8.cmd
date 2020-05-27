if "" == "%1" goto warn

rd jdk8
mklink /d jdk8 %1
goto end

:warn

echo argument needed

:end
