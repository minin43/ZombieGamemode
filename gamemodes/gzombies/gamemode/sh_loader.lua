-- Aspects of the gamemode will be loaded as "modules" which can be individually disabled by adding its folder name to the table below

local SkipLoad = {
    demoFolder = true,
    nonExistantFolder = true
}

function IncludeNewFile( fileName, directory )
    local sepFileName = string.Explode( "_", fileName )
    local toUse = directory .. "/" .. fileName

    print("[gZ] Including new file: " .. fileName)

    if sepFileName[1] == "sv" then
        if SERVER then include( toUse ) end
    elseif sepFileName[1] == "sh" then
        if SERVER then 
            include( toUse )
            AddCSLuaFile( toUse )
        else
            include( toUse )
        end
    elseif sepFileName[1] == "cl" then
        if SERVER then
            AddCSLuaFile( toUse )
        else
            include( toUse )
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
for k, v in pairs( gamemodeDirectories ) do
    if !SkipLoad[ v ] then
        local files, _ = file.Find( "gzombies/gamemode/" .. v .. "/*", "LUA" )
        for _, fileName in pairs( files ) do
            IncludeNewFile( fileName, v )
        end
    end
end