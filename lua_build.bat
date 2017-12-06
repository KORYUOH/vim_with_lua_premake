setlocal

if "%LOCALCALL%" NEQ "" goto BUILD_LUA

:SetEnv
@rem apply visual studio env
set VSTOOLS=%VS140COMNTOOLS%
rem set VSTOOLS=%VS120COMNTOOLS%
rem set VSTOOLS=%VS100COMNTOOLS%

call "%VSTOOLS%vsvars32.bat"

:BUILD_LUA

set BUILD_CONFIG=Release
rem set BUILD_CONFIG=Debug
if "%1" EQU "build" set PARAM=/build %BUILD_CONFIG%
if "%1" EQU "clean" set PARAM=/clean
if "%1" EQU "rebuild" set PARAM=/rebuild %BUILD_CONFIG%

cd _build_premake
devenv.exe Lua.sln %PARAM%

cd ..

if "%LOCALCALL%" NEQ "" exit /b

:EOF
endlocal
