setlocal
set LOCALCALL=1

@rem apply visual studio env
set VSTOOLS=%VS140COMNTOOLS%
rem set VSTOOLS=%VS120COMNTOOLS%
rem set VSTOOLS=%VS100COMNTOOLS%

call "%VSTOOLS%vsvars32.bat"

@rem call lua_build.bat build

cd vim/src

set OPT1=IME=yes MBYTE=YES ICONV=yes DEBUG=no CSCOPE=yes NETBEANS=yes DIRECTX=yes
set OPT2="SDK_INCLUDE_DIR=c:/Program Files (x86)/Microsoft SDKs/Windows/v7.0A/Include"
rem set LUAOPT=LUA=../../_build_premake/Release/Win32 DYNAMIC_LUA=no LUA_VER=53
rem set LUAOPT=LUA=../../lua DYNAMIC_LUA=yes LUA_VER=53
set LUAOPT=LUA=../../lua DYNAMIC_LUA=yes LUA_VER=53


nmake -f Make_mvc.mak %OPT1% %OPT2% %LUAOPT% GUI=no
rem nmake -f Make_mvc.mak %OPT1% %OPT2% %LUAOPT% GUI=yes

pause

endlocal
