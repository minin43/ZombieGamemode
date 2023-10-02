GM.PlayerReadyStatus = {}

function GM:ClearAllPlayerReadiness()
    for ply, isReady in pairs(self.PlayerReadyStatus) do
        self.PlayerReadyStatus[ply] = false
    end
end

function GM:AddNewPlayerToReadyList(ply)
    self.PlayerReadyStatus[ply] = false
end

function GM:RemovePlayerFromReadyList(ply)
    self:ValidateUserExistsInTable(ply)

    self.PlayerReadyStatus[ply] = nil
end

function GM:MarkPlayerReady(ply)
    self:ValidateUserExistsInTable(ply)

    if self:GetGameState() == self.GameStates.INACTIVE then
        self:StartPreRound()
        self.PlayerReadyStatus[ply] = true
    elseif self:GetGameState() == self.GameStates.PREGAME then
        self.PlayerReadyStatus[ply] = true
    else
        self:ConsolePrint("Tried to call MarkPlayerReady during an invalid game state:" .. ply)
    end
end

function GM:UnmarkPlayerReady(ply)
    self:ValidateUserExistsInTable(ply)

    self.PlayerReadyStatus[ply] = false
end

function GM:EnoughReadiedPlayersToStart()
    local numReadied = 0

    for ply, isReady in pairs(self.PlayerReadyStatus) do
        if isReady then
            numReadied = numReadied + 1
        end
    end

    return numReadied + #player.GetBots() > 1
end

function GM:GetReadiedPlayers()
    local readiedPlayers = []

    for ply, isReady, in pairs(self.PlayerReadyStatus) do
        if isReady then
            readiedPlayers[#readiedPlayers + 1] = ply
        end
    end

    return readiedPlayers
end

--Is this gonna work, local but part of GM?
local function GM:ValidateUserExistsInTable(ply)
    if self.PlayerReadyStatus[ply] == nil then
        error("Failed to validate user existing in GAMEMODE:PlayerReadyStatus table")
    end
end