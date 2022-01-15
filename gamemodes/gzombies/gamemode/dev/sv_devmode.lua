concommand.Add("gz_enable_dev", function(ply, cmd, tab, argStr)
    if ply then
        if ply:IsAdmin() then
            GAMEMODE:EnableDevMode()
        end
    else
        GAMEMODE:EnableDevMode()
    end
end)

concommand.Add("gz_disable_dev", function(ply, cmd, tab, argStr)
    if ply then
        if ply:IsAdmin() then
            GAMEMODE:EndDevMode()
        end
    else
        GAMEMODE:EndDevMode()
    end
end)

function GM:EnableDevMode()
    for k, v in pairs(player.GetAll()) do
        if v:IsAdmin() then
            v:SetModel("models/player/group03/male_01.mdl")
            v:Spawn()
            v:GodEnable()
        end
    end
end

function GM:EndDevMode()
    for k, v in pairs(player.GetAll()) do
        v:GodDisable()
        if v:Alive() then
            v:Kill()
        end
    end
end