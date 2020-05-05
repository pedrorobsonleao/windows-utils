@echo off
setlocal enableextensions enabledelayedexpansion
set chkfile=drivechk.tmp
if "%1" == "" goto :usage
set drive=%1
set drive=%drive:\=%
set drive=%drive::=%
dir %drive%:>nul 2>%chkfile%
for %%? in (%chkfile%) do (
  set chksize=%%~z?
)
if %chksize% neq 0 (
  more %chkfile%
  del %chkfile%
  goto :eof
)
del %chkfile%
echo list volume | diskpart | find /I " %drive% " >%chkfile%
for /f "tokens=6,7,8,9" %%a in (%chkfile%) do (
	if /I "%%a" == "partition" (
		set dsksz=%%b
		set dskunit=%%c
	) else (
		if /I "%%a" == "ntfs"  (
			set dsksz=%%c
			set dskunit=%%d
		) else (
			set dsksz=%%a
			set dskunit=%%b
		)
	)
)
del %chkfile%
for /f "tokens=3" %%a in ('dir %drive%:\') do (
  set bytesfree=%%a
)
set bytesfree=%bytesfree:,=%
set bytesfree=%bytesfree:.=%

echo volume %drive%: - %dsksz% %dskunit% total space / %bytesfree% byte(s) free
endlocal

goto :eof
:usage
  echo.
  echo   usage: freedisk ^<driveletter^> (eg.: freedisk c)