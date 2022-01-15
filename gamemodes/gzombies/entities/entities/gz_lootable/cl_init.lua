include("shared.lua")

local ent = ENT
ENT.LootTable = {}

net.Receive("OpenLootable", function()
    print("received OpenLootable net message from server")
    local loot = net.ReadTable()
    ent.loot = loot
    --ENT.LootTable = loot

    ent:OpenLootScreen(loot)
end)

net.Receive("OpenLootableSearch", function()
    print("received OpenLootableSearch net message from server")
    local search = net.ReadInt(8)
    local loot = net.ReadTable()
    ent:OpenWaitScreen()
end)

function ENT:OpenWaitScreen()
    print("waitscreen atempt open")

    -- do stuff

    self:OpenLootScreen()
end

function ENT:OpenLootScreen()
    if GAMEMODE.InteractScreen then return end

    surface.PlaySound(self.OpenAudio)

    print("lootable attempt open screen")
    -- Future work
    local frame = vgui.Create("DFrame")
    GAMEMODE.InteractScreen = frame
    frame:SetSize(400, 400)
    frame:Center()
    frame:SetTitle("Loot")
    frame:SetVisible(true)
    frame:ShowCloseButton(true)
    frame:SetDraggable(false)
    frame:MakePopup()
    function frame:OnClose()
        GAMEMODE.InteractScreen = nil
    end
end
