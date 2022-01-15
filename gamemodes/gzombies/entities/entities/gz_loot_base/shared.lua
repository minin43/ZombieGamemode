AddCSLuaFile()

ENT.Type            = "anim"
ENT.Base            = "base_anim"
ENT.PrintName       = "gz_loot_base"
ENT.IconDir         = ""
ENT.Icon            = Material(ENT.IconDir)
ENT.Size            = 1 -- For potential future functionality
ENT.Type            = GAMEMODE.LootType.Base

function ENT:Initialize()
    -- Do anything?
end

if CLIENT then
    function ENT:SetIcon(iconDir)
        self.IconDir = iconDir
        self.Icon = Material(self.IconDir)
    end
end

if SERVER then
    function ENT:Use(ply, _, type, val)
        --[[if self.Type == GAMEMODE.LootType.GEAR then
            --Attempt to auto-equip the gear
            --If slot filled, add to inventory
            --otherwise, fail to equip
        else if self.Type == GAMEMODE.LootType.RESOURCE then
            if ply:AddToInventory(self) then
                -- Delete self from world
            else
                -- Do something on fail pickup? Noise?
            end
        end]]
        return false -- Cannot be added to inventory
    end
end