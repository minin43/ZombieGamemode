AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

ENT.Weight = 0
ENT.Bulk = 0

function ENT:Setup(entTable)
    table.Merge(self, entTable)
end

function ENT:GenerateManu()
    if !self.Type then Error("gz_armor attempted manufacturer generation without valid ent table") end
    if self.Type == GAMEMODE.ArmorTypes.VEST then
        self.Manufacturer = GAMEMODE.FictionalManufacturers.Vest[math.random(#GAMEMODE.FictionalManufacturers.Vest)]
    end
end

function ENT:SetManu(newManu)
    self.Manufacturer = newManu
end

function ENT:Initialize()
    -- Send client all necessary info - is there?
end

--[[function ENT:SetupCarrier(entTable)

end

function ENT:SetupPlate(entTable)

end]]