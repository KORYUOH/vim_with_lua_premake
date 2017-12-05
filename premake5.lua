local build_dir="_build_premake"

-- premake5.lua
location( build_dir )

do
	configurations { "Debug" , "Release" }
	platforms { "Win32" , "Win64" }
end

filter "configurations:Debug"
do
	defines { "DEBUG" , "_DEBUG" }
	flags { "Symbols" }
end

filter "configurations:Release"
do
	defines{ "NDEBUG" }
	optimize "On"
end

filter { "platforms:Win32" }
	architecture "x86"
filter { "platforms:Win32" , "configurations:Debug" }
	targetdir(build_dir.."/Debug/Win32")
filter{ "platforms:Win32" , "configurations:Release" }
	targetdir(build_dir.."/Release/Win32" )


filter { "platforms:Win64" }
	architecture "x64"
filter { "platforms:Win64" , "configurations:Debug" }
	targetdir(build_dir.."/Debug/Win64")
filter { "platforms:Win64" , "configurations:Release" }
	targetdir(build_dir.."/Release/Win64" )

filter { "action:vs*" }
	buildoptions{
		"/wd4996",
	}
	defines{
		"_CRT_SECURE_NO_DEPRECATE",
		"NOMINMAX"
	}
	characterset "MBCS"
filter{}

dofile "projects.lua"

