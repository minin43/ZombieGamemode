AddCSLuaFile()
DEFINE_BASECLASS("gz_generic_spawn")

ENT.Type 		= "anim"
ENT.Base 		= "gz_generic_spawn"
ENT.PrintName   = "gz_player_spawn"
ENT.Author      = "Logan"

function ENT:Initialize()
    BaseClass.Initialize(self)
    self:SetModel("models/player/odessa.mdl")
	self:SetColor(Color(50, 255, 50))
end

-- Is this necessary?
if CLIENT then
    function ENT:Draw()
        BaseClass.Draw(self)
    end
end