util.AddNetworkString("UpdateInv")

GM.DefaultPlayerInventorySlots = 20
GM.InventoriesMasterTable = {} -- Is this necessary if it's saved to each individual player?

local PLY = FindMetaTable("Player")
PLY.Inventory = { --Will this need to be expanded to include additional storage options, or do we stick it all under Pack?
    Equipped = {},
    Pack = {},
    PackSlots = GM.DefaultPlayerInventorySlots
}

-- Equip a piece of gear to the player, gets stored in Inventory.Equipped
function PLY:Equip(toEquip, slot)
    if !toEquip.Type != GAMEMODE.LootType.GEAR then return end
    if self.Inventory.Equipped[slot] then
        if self:AddToInventory(self.Inventory.Equipped[slot]) then -- Doesn't work if we're swapping items at max inventory
            self.Inventory.Equipped[slot] = toEquip
        end
    else
        self.Inventory.Equipped[slot] = toEquip
    end
end

-- Remove a piece of equipped gear from the player. Dropping it or placing it in inventory
-- will be done in other functions
function PLY:UnEquip(slot)
    local removed = self.Inventory.Equipped[slot]
    self.Inventory.Equipped[slot] = nil
    return removed
end

-- Would be kind of cool to do an RE4-style inventory system
-- Simply adds the item to inventory, returns true/false if successful or not
function PLY:AddToInventory(toAdd)
    if toAdd.Type == GAMEMODE.LootType.RESOURCE then
        --Check if we can add to a pre-existing stack, otherwise create a new stack if we can, otherwise cancel
    elseif #self.Inventory.Pack > self.Inventory.PackSlots then
        table.insert(self.Inventory.Pack, toAdd)
        return true
    end

    return false
end

function PLY:RemoveFromInventory(toRemove, quantity)
    -- Will need to reduce player weight and adjust movement
end

function PLY:SetInventory(toSet)
    self.Inventory.Pack = toSet
    self:RecalculateWeight()
end

function PLY:ClearInventory()
    self.Inventory.Pack = {}
    self:RecalculateWeight()
end

function PLY:UpdateInventory()
    -- Send a message to the client with inventory
    net.Start("UpdateInv")
        --net.Write -- We don't want to send the ents to the client, just their class names and some extra info
    net.Send(self)
end

function PLY:GetEquipped()
    return self.Inventory.Equipped
end

function PLY:GetPack()
    return self.Inventory.Pack
end

-- Let's say the average person weighs 150 lbs, this puts the average weight a person can "carry" (which is anywhere from 1/4-1/2 their body weight) at ~40 lbs
-- Just for the sake of keeping it a nice number to start with - anything over their weight capacity (which can increase?) has a 1-to-1 debuff to speed
function PLY:RecalculateWeight()
    local toWalk = GAMEMODE.DefaultWalkSpeed
    local toRun = GAMEMODE.DefaultRunSpeed
    local toJump = GAMEMODE.DefaultJumpPower

    for k, v in ipairs(self:GetEquipped()) do

    end
    for k, v in ipairs(self:GetPack()) do

    end
end