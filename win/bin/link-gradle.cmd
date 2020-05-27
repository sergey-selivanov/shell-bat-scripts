rem echo %~dp0

if "" == "%1" goto warn

pushd %~dp0
rd gradle
mklink /d gradle %1
popd

goto end

:warn

echo Usage: %~nx0 gradle-6.4.1

:end
