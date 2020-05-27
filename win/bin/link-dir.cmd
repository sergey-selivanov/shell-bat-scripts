rem Deletes link if already exist and creates link to specified dir
rem note reverse order of args in mklink vs unix ln, this script takes args as: source target


if "" == "%1" goto warn

rd %2

rem spaces in args?
c:\bin\nircmdc.exe elevate cmd /c mklink /d %2 %1


goto end

:warn

echo Usage: %~nx0 c:\path\actual-dir c:\path\link-name
echo use absolute paths

:end
