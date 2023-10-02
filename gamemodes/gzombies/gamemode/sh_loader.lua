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

local _, gamemodeDirectories = file.Find( "gzombies/gamemode/*", "LUA" )
for k, directoryName in pairs( gamemodeDirectories ) do
    if !SkipLoad[ directoryName ] then
        local loadOrderFile = "gzombies/gamemode/" .. directoryName .. "/sh_load_order.lua"
        local svInitFile = "gzombies/gamemode/" .. directoryName .. "/sv" .. directoryName .. "_init.lua"
        local clInitFile = "gzombies/gamemode/" .. directoryName .. "/cl" .. directoryName .. "_init.lua"
        local shInitFile = "gzombies/gamemode/" .. directoryName .. "/sh" .. directoryName .. "_init.lua"

        if file.Exists(shInitFile, "LUA") then
            IncludeNewFile("/sh" .. directoryName .. "_init.lua", "gzombies/gamemode/" .. directoryName)
        end

        if file.Exists(svInitFile, "LUA") then
            IncludeNewFile("/sv" .. directoryName .. "_init.lua", "gzombies/gamemode/" .. directoryName)
        end

        if file.Exists(clInitFile, "LUA") then
            IncludeNewFile("/cl" .. directoryName .. "_init.lua", "gzombies/gamemode/" .. directoryName)
        end

        if file.Exists(loadOrderFile, "LUA") then
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