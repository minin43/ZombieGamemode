GM.Name = "gZombies"
GM.Author = "Logan Christianson"
GM.Email = "lobsterlogan43@yahoo.com"
GM.Website = "N/A"
GM.Version = "0.12.24.21"

GM.GameStates = {
	PLAY = 1,
	PAUSE = 2,
	DEVELOP = 3
}
GM.GameState = GM.GameState.PLAY

util.AddNetworkString("RequestGameState")
util.AddNetworkString("RequestGameStateCallback")

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
