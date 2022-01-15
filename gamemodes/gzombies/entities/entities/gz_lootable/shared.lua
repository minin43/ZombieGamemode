ENT.Type            = "anim"
ENT.Base            = "base_anim"
ENT.PrintName       = "gz_lootable"
ENT.Spawnable       = false
ENT.Size            = 1
ENT.DefaultSize     = 1
ENT.DefaultModel    = "models/props_junk/cardboard_box004a.mdl"

-- This is called after ENTITY:SetupDataTables() and GM:OnEntityCreated(), and when you Entity:Spawn() the custom entity.
function ENT:Initialize()
    local mdl = self:GetModel()
    if !mdl then
        self:SetModel(self.DefaultModel)
    end

	self:SetMoveType( MOVETYPE_NONE )
	self:SetSolid( SOLID_VPHYSICS )
	self:SetCollisionGroup( COLLISION_GROUP_INTERACTIVE )
    if SERVER then
        self:SetUseType(SIMPLE_USE)

        self.Size = GAMEMODE.PropSizeTable[mdl or ""] or self.DefaultSize
    else
        local mdlTbl = GAMEMODE.PropTable[self:GetModel()]
        self.OpenAudio = mdlTbl.snd or GAMEMODE.OpenSounds.DEFAULT
    end
	--self:SetColor(Color(50, 50, 50))
	--self:DrawShadow(true)
end

-- Occurs when loot is stored inside the lootable (such as moving useless junk from your inventory to the lootable)
function ENT:AddLoot(toAdd)
    table.insert(self.LootTable, toAdd)
    self:ResetLootedStatus()
end

-- Occurs when loot is taken from the lootable
function ENT:RemoveLoot(toRemove)
    for k, v in ipairs(self.LootTable) do
        if v == self then -- TO UPDATE - this is not an adequate way of determining whether the items are the same
            table.remove(self.LootTable, k)
            break
        end
    end
    self:ResetLootedStatus()
end

-- If we want to force-set the contents of the table
function ENT:SetLootTable(toSet)
    self.LootTable = toSet
    self:ResetLootedStatus()
end

-- If we want to *JUST* clear the loot table
function ENT:EmptyLoot()
    self.LootTable = {}
    self:ResetLootedStatus()
end

-- This might get annoying, but then again, this feature can remain for lootables and not be added for player-owned storage
function ENT:ResetLootedStatus()
    if SERVER then
        self.SearchedHistory = {}
    end
end

--[[
    List of unused lootable props:
    Shop
        - models/props_c17/display_cooler01a.mdl, an empty display shelf/cooler
    Vehicles
        - models/props_vehicles/generatortrailer01.mdl, Gas generator
    Misc
        - models/props_interiors/VendingMachineSoda01a.mdl, Dr. Breen's Private Reserve
        - models/Items/ammocrate_smg1.mdl, SMG ammo crate
]]