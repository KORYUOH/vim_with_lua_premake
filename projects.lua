
workspace "Lua"
solution "Lua"

project "Lua"

do
	-- kind "ConsoleApp"
	-- kind "WindowedApp"
	kind "StaticLib"
	-- kind "SharedLib"
	
	language "C++"

	objdir "%{prj.name}"

	flags{
		-- "WinMain" -- with WindowedApp
		"StaticRuntime"
	}

	files
	{
		"lua/**.cpp",
		"lua/**.h",
		"lua/**.hpp",
		"lua/**.c",
		"lua/**.inc"
	}

	includedirs
	{
	}

	defines{
	}

	buildoptions {
	}

	libdirs {
	}
	
	links {
	}
end

project "Lua_dyn"

do
	kind "SharedLib"

	language "C++"

	objdir "%{prj.name}"

	files
	{
		"lua/**.cpp",
		"lua/**.h",
		"lua/**.hpp",
		"lua/**.c",
		"lua/**.inc"
	}

end

