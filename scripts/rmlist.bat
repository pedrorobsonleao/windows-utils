@echo off

rem validate empty first parameter
if "%1" == "" goto :usage

set period=%1

rem validate first parameter is numeric
SET "var="&for /f "delims=0123456789" %%i in ("%1") do set var=%%i
if defined var (
	set message=needs number in period [%1]
	goto :usage
)

set file=%2

rem validate file exists
if not exist %file% (
	set message=can't found file [%file%]
	goto :usage
)

rem get date
for /F %%d in ('date /T') do set date=%%d

rem read file lines
for /F %%F in ('type %file%') do (

	rem get time
	for /F %%t in ('time /T') do set time=%%t

 	if "%%~F" NEQ "" (
		if EXIST "%%~F" (
			echo %date%-%time% find files in directory "%%~F" with a period longer than "%period%" days
			forfiles /s /p "%%~F" /d -%period% /c "cmd /c if @isdir==FALSE (echo %date%-%time% remove @path && del /f /q @path)"
		)
	)
)

goto :eof

:usage
	echo.
	echo usage: rmlist ^<period^> ^<file_list^> (eg.: rmlist 10 c:\file_list.txt)
	
	if not "%message%" == "" (
		echo.
		echo error: %message%
	)