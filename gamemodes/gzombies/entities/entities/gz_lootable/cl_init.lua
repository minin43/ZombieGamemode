include("shared.lua")

ENT.LootTable = {}

net.Receive("OpenLootable", function()
    local ent = net.ReadEntity()
    local loot = net.ReadTable()
    ent.loot = loot
    
    ent:OpenLootScreen(loot)
end)

net.Receive("OpenLootableSearch", function()
    local ent = net.ReadEntity()
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

    GAMEMODE:OpenInventory()
    surface.PlaySound(self.OpenAudio)

    local frameWidth = ScrW() / 2
    local frameHeight = ScrH()
    -- Future work
    local frame = vgui.Create("DFrame")
    GAMEMODE.InteractScreen = frame
    frame:SetSize(frameWidth, frameHeight)
    frame:SetPos(frameWidth, 0)
    frame:SetTitle("Loot")
    frame:SetVisible(true)
    frame:ShowCloseButton(true)
    frame:SetDraggable(false)
    frame:MakePopup()
    function frame:OnClose()
        GAMEMODE.InteractScreen = nil
    end
end
