GM.InventoryColorTable = {
    Background = Color(60, 60, 60, 170)
}

function AttemptEquip(toEquip)

end

function AttemptPickup(toPickup)

end

function AttemptDeEquip(equip)

end

function AttemptDrop(toDrop)

end

function GM:OpenInventory()
    -- If the screen is already open, remove it and re-open
    -- Alternatively, just return (how it's normally done)
    if self.InventoryMain and self.InventoryMain:IsValid() then 
        self.InventoryMain:Remove()
        self.InventoryMain = nil
        self:OpenInventory()
    end

    self.InventoryMain = vgui.Create( "DFrame" )
    self.InventoryMain:SetSize( 960, 1080 )
    self.InventoryMain:SetPos(1920 / 2, 0)
	self.InventoryMain:SetTitle( "" )
	self.InventoryMain:SetVisible( true )
	self.InventoryMain:SetDraggable( false )
	self.InventoryMain:ShowCloseButton( false )
	self.InventoryMain:MakePopup()
    self.InventoryMain.Paint = function()
        surface.SetDrawColor(self.InventoryColorTable.Background)
        surface.DrawRect(0, 0, self.InventoryMain:GetWide(), self.InventoryMain:GetTall())
		/*surface.SetDrawColor( self.TeamColor )
		surface.DrawRect( 0, 0, self.InventoryMain:GetWide(), self.HelpMainTitleBar )

        surface.SetFont( "Exo 2" )
		surface.SetTextColor( Color( 255, 255, 255 ) )
		surface.SetTextPos( self.InventoryMain:GetWide() / 2 - surface.GetTextSize("Help Menu") / 2, 16 )
		surface.DrawText( "Help Menu" )

		surface.SetDrawColor( Color( 255, 255, 255 ) )
		surface.DrawRect( 0, self.HelpMainTitleBar, self.InventoryMain:GetWide(), self.InventoryMain:GetTall() )

		surface.SetTexture( GAMEMODE.GradientTexture )
        surface.SetDrawColor( 0, 0, 0, 164 )
        surface.DrawTexturedRectRotated( self.InventoryMain:GetWide() / 2, self.HelpMainTitleBar + 4, 8, self.InventoryMain:GetWide(), 270 )*/
    end
end