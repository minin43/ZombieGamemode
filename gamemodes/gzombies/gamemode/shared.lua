GM.Name = "gZombies"
GM.Author = "Logan Christianson"
GM.Email = "lobsterlogan43@yahoo.com"
GM.Website = "N/A"
GM.Version = "0.12.24.21"

GM.LootTable = {}
GM.GameStates = {
	PLAY = 1,
	PAUSE = 2,
	DEVELOP = 3
}
GM.GameState = GM.GameStates.PLAY

if SERVER then
	util.AddNetworkString("RequestGameState")
	util.AddNetworkString("RequestGameStateCallback")
end

function GM:Initialize()
	self.BaseClass.Initialize(self)
end

function GM:GetGameState()
	if SERVER then
		return self.GameState
	else -- if CLIENT then
		net.Start("RequestGameState")
		net.SendToServer()

		net.Receive("RequestGameStateCallback", function()
			GAMEMODE.GameState = net.ReadString()
			return GAMEMODE.GameState
		end)
		--return self.GameState
	end
end

local _PLY = FindMetaTable("Player")

function _PLY:Score()
	return self:GetNWInt("score")
end

function id(steamid)
	return string.gsub(steamid, ":", "x")
end

GM.Rarities = {
	COMMON = 1,
	UNCOMMON = 2,
	RARE = 3,
	EPIC = 4,
	LEGENDARY = 5,
	EXOTIC = 6,
    [1] = {Color = Color(20, 20, 20, 200)}, --Black/dark gray
    [2] = {Color = Color(87, 139, 235)}, --//Light blue
    [3] = {Color = Color(153, 102, 204)}, --//Amethyst purple
    [4] = {Color = Color(255, 215, 0)}, --//Gold
    [5] = {Color = Color(252, 57, 3)}, --//Red-Orange
    [6] = {Color = Color(0, 255, 255)} --//Cyan
}