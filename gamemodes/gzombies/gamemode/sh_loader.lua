-- Aspects of the gamemode will be loaded as "modules" which can be individually disabled by adding its folder name to the table below

local SkipLoad = {
    demoFolder = true,
    nonExistantFolder = true
}

function IncludeNewFile( fileName, directory )
    local sepFileName = string.Explode( "_", fileName )
    local toUse = directory .. "/" .. fileName
    
    if sepFileName[1] == "sv" then
        if SERVER then 
            include( toUse )
            GM:ConsolePrint("Including new file: " .. fileName, directory)
        end
    elseif sepFileName[1] == "sh" then
        if SERVER then 
            include( toUse )
            AddCSLuaFile( toUse )
            GM:ConsolePrint("Including new file: " .. fileName, directory)
        else
            include( toUse )
            GM:ConsolePrint("Including new file: " .. fileName, directory)
        end
    elseif sepFileName[1] == "cl" then
        if SERVER then
            AddCSLuaFile( toUse )
            GM:ConsolePrint("Sending file to client: " .. fileName, directory)
        else
            include( toUse )
            GM:ConsolePrint("Including new file: " .. fileName, directory)
        end
    end
end

--//Custom hooks
--[[if SERVER then
    include( "gzombies/gamemode/custom/sv_custom.lua" )
    include( "gzombies/gamemode/custom/sh_custom.lua" )

    AddCSLuaFile( "gzombies/gamemode/custom/sh_custom.lua" )
    AddCSLuaFile( "gzombies/gamemode/custom/cl_custom.lua" )
else
    include( "gzombies/gamemode/custom/sh_custom.lua" )
    include( "gzombies/gamemode/custom/cl_custom.lua" )
end]]

local _, gamemodeDirectories = file.Find( "gzombies/gamemode/*", "LUA" )
for k, directoryName in pairs( gamemodeDirectories ) do
    if !SkipLoad[ directoryName ] then
        local str = "gzombies/gamemode/" .. directoryName .. "/sh_load_order.lua"
        if file.Exists(str, "LUA") then
            IncludeNewFile("sh_load_order.lua", "gzombies/gamemode/" .. directoryName)
        else
            local files, _ = file.Find( "gzombies/gamemode/" .. directoryName .. "/*", "LUA" )
            for _, fileName in pairs( files ) do
                IncludeNewFile( fileName, directoryName )
            end
        end
    end
end

GM:ConsolePrint("Done loading files")