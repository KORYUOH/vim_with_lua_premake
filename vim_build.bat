setlocal
set LOCALCALL=1

@rem apply visual studio env
set VSTOOLS=%VS140COMNTOOLS%
rem set VSTOOLS=%VS120COMNTOOLS%
rem set VSTOOLS=%VS100COMNTOOLS%

call "%VSTOOLS%vsvars32.bat"

rem call lua_build.bat build
rem copy lua/lib/lua53.dll vim/src/lua53.dll

cd vim/src

set OPT1=IME=yes MBYTE=YES ICONV=yes DEBUG=no CSCOPE=yes NETBEANS=yes
set OPT2="SDK_INCLUDE_DIR=c:/Program Files (x86)/Microsoft SDKs/Windows/v7.0A/Include"
rem set LUAOPT=LUA=../../_build_premake/Release/Win32 DYNAMIC_LUA=no LUA_VER=53
rem set LUAOPT=LUA=../../lua DYNAMIC_LUA=yes LUA_VER=53
set LUAOPT=LUA=../../lua DYNAMIC_LUA=no LUA_VER=53



nmake -f Make_mvc.mak %OPT1% %OPT2% %LUAOPT% GUI=no
nmake -f Make_mvc.mak %OPT1% %OPT2% %LUAOPT% GUI=yes DIRECTX=yes

call :COPY

nmake clean -f Make_mvc.mak
cd ../..

goto EOF

:COPY
set EXDIR=../../bin/vim80/
if exist bin rmdir /s /q bin
mkdir bin
xcopy "../vim/runtime" "%EXDIR%" /E /C
copy "vim.exe" "%EXDIR%vim.exe"
copy "gvim.exe" "%EXDIR%gvim.exe"
copy "vimrun.exe" "%EXDIR%vimrun.exe"
copy "install.exe" "%EXDIR%install.exe"
copy "uninstal.exe" "%EXDIR%uninstal.exe"
copy "xxd/xxd.exe" "%EXDIR%xxd/xxd.exe"
copy "tee/tee.exe" "%EXDIR%tee/tee.exe"
copy "GvimExt/gvimext.dll" "%EXDIR%GvimExt/gvimext.dll"

exit /b

:EOF
endlocal
