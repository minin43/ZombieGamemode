AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

util.AddNetworkString("OpenLootable")

ENT:SetUseType(CONTINUOUS_USE)
ENT:SetNWBool("InUse", false)
ENT.IsInUse = false
ENT.LootTable = {}

function ENT:Use(ply, _, type, val)
    if self:GetNWBool("InUse") then return end
    self:SetNWBool("InUse", true)

    net.Start("OpenLootable")
        --net.WriteEntity(self)
        -- Send loot table
    net.Send(ply)
    --ply:OpenLootable(self)
end