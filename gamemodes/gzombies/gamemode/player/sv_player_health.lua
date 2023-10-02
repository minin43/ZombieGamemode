GM.BodyParts = {HEAD = 1, BODY = 2, RARM = 3, LARM = 4, RLEG = 5, LLEG = 6}

local Ply = FindMetaTable("Player")
Ply.Health = {}

function Ply:ResetMedical()
    self.Health = {
        [GAMEMODE.BodyParts.HEAD] = {},
        [GAMEMODE.BodyParts.BODY] = {},
        [GAMEMODE.BodyParts.RARM] = {},
        [GAMEMODE.BodyParts.LARM] = {},
        [GAMEMODE.BodyParts.RLEG] = {},
        [GAMEMODE.BodyParts.LLEG] = {},
        Overall = 100
    }
end

function Ply:TakeDamage(bodypart, problem) --?

end

hook.Add("PlayerSpawn", "ResetMedical", function(ply)
    ply:ResetMedical()
end)