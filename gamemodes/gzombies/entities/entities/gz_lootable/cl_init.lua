include("shared.lua")

ENT.LootTable = {}

net.Receive("OpenLootable", function()
    local loot = net.ReadTable()
    ENT.LootTable = loot

    OpenLootScreen()
end)

function OpenLootScreen()
    -- Future work
end