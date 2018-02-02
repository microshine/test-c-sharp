@setlocal

set "curpath=%cd%"

@rem Initialize Visual Studio build environment:
@rem - Visual Studio 2017 Community/Professional/Enterprise is the preferred option
@rem - Visual Studio 2015 is the fallback option (which might or might not work)
@set tools=
@set tmptools="c:\Program Files (x86)\Microsoft Visual Studio 14.0\Common7\Tools\vsvars32.bat"
@if exist %tmptools% set tools=%tmptools%
@set tmptools="c:\Program Files (x86)\Microsoft Visual Studio\2017\Community\Common7\Tools\VsMSBuildCmd.bat"
@if exist %tmptools% set tools=%tmptools%
@set tmptools="c:\Program Files (x86)\Microsoft Visual Studio\2017\Professional\Common7\Tools\VsMSBuildCmd.bat"
@if exist %tmptools% set tools=%tmptools%
@set tmptools="c:\Program Files (x86)\Microsoft Visual Studio\2017\Enterprise\Common7\Tools\VsMSBuildCmd.bat"
@if exist %tmptools% set tools=%tmptools%
@if not defined tools goto :error
call %tools%
@echo on

cd %curpath%
@rem Delete output directory
rmdir /S /Q net45

@rem Clean solution
msbuild ..\Test.sln ^
	/p:Configuration=Debug /p:Platform="Any CPU" ^
	/target:Clean || goto :error

@rem Build Pkcs11Interop project
msbuild ..\Test.sln ^
	/p:Configuration=Debug /p:Platform="Any CPU" ^
	/target:Build || goto :error

@echo *** BUILD NET45 SUCCESSFUL ***
@endlocal
@exit /b 0

:error
@echo *** BUILD NET45 FAILED ***
@endlocal
@exit /b 1