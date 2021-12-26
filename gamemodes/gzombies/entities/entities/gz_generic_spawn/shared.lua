AddCSLuaFile()

ENT.Type 		= "anim"
ENT.Base 		= "base_entity"
ENT.PrintName   = "gz_generic_spawn"
ENT.Author      = "Logan"
ENT.Spawnable 	= false

function ENT:Initialize()
    self:SetModel( "models/player/odessa.mdl" )
	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetCollisionGroup( COLLISION_GROUP_WEAPON )
	self:SetColor(Color(50, 50, 50))
	self:DrawShadow( false )
end

function ENT:SetupDataTables()
	--self:NetworkVar( "String", 0, "Link" )
end

function ENT:IsSuitable()
	local tr = util.TraceHull( {
		start = self:GetPos(),
		endpos = self:GetPos(),
		filter = self,
		mins = Vector( -20, -20, 0 ),
		maxs = Vector( 20, 20, 70 ),
		ignoreworld = true,
		mask = MASK_NPCSOLID
	} )

	return not tr.Hit
end

if SERVER then
	function ENT:Think()

	end
end

if CLIENT then
	function ENT:Draw()
		if GAMEMODE:GetGameState() == GAMEMODE.GameStates.DEVELOP then
			self:DrawModel()
		end
	end
end