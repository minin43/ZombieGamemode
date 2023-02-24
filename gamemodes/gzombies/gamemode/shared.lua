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

function GM:ConsolePrint(text)
	print("[gZ] " .. text)
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

GM.Rarities.GenerateRandomRarity = function()
	GM.Rarities.RarityTable = GM.Rarities.RarityTable or {}

	if table.IsEmpty(GM.Rarities.RarityTable) then
		for i = 1, 64 do
			if i < 34 then
				GM.Rarities.RarityTable[i] = GM.Rarities[1]
			else if i < 50 then
				GM.Rarities.RarityTable[i] = GM.Rarities[2]
			else if i < 58 then
				GM.Rarities.RarityTable[i] = GM.Rarities[3]
			else if i < 62 then
				GM.Rarities.RarityTable[i] = GM.Rarities[4]
			else if i < 64 then
				GM.Rarities.RarityTable[i] = GM.Rarities[5]
			else if i < 65 then
				GM.Rarities.RarityTable[i] = GM.Rarities[6]
			end
		end
	end

	return GM.Rarities.RarityTable[math.random(#GM.Rarities.RarityTable)]
end