AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
include("shared.lua")

util.AddNetworkString("OpenLootable")
util.AddNetworkString("OpenLootableSearch")
util.AddNetworkString("AttemptAddLoot")
util.AddNetworkString("AttemptRemoveLoot")
util.AddNetworkString("ClosedLootable")

local ent = ENT
ENT.PerSizeLootTime = 0.5 -- In seconds
ENT.LootTable = {}
ENT.SearchedHistory = {}
ENT.InUse = nil

function ENT:Use(ply, _, type, val)
    print("ENT:Use called", self.InUse)
    --if self.InUse then return end -- Temp disabled

    if !self.SearchedHistory[ply] then
        self.SearchedHistory[ply] = true
        self:SendLootFirstTime(ply)
    else
        self:SendLoot(ply)
    end
end

-- Should be a universal way to get the latest version of the loot table to the specified player
-- If the player already has the loot screen open, should simply update its contents (but that's a note for the client file)
function ENT:SendLoot(ply)
    print("default sendloot method")
    net.Start("OpenLootable")
        net.WriteTable(self.LootTable)
    net.Send(ply)
    self.InUse = ply
    ply.OpenedLootable = self
end

function ENT:SendLootFirstTime(ply)
    print("first-time sendloot method")
    --function self:SendLoot(ply)
        net.Start("OpenLootableSearch")
            net.WriteInt(self.PerSizeLootTime * self.Size, 8) --This may be later altered even further to include a potential search proficiency bonus
            net.WriteTable(self.LootTable)
        net.Send(ply)
        self.InUse = ply
        ply.OpenedLootable = self
    --end
end

-- If a player disconnects while they are searching a lootable
-- It may be worth it to somehow hook into the PlayerDisconnect hook?
function ENT:Think()
    if self.InUse then
        if !self.InUse:IsValid() then
            self.InUse = nil
        end
    end
end

net.Receive("AttemptAddLoot", function(len, ply)

    ent:SendLoot(ply)
end)

net.Receive("AttemptRemoveLoot", function(len, ply)

end)

net.Receive("ClosedLootable", function(len, ply)
    if ply.OpenedLootable == ent then
        ent.InUse = nil
    end
end)