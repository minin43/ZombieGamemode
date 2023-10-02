GM.CurrentGameState = ""

function GM:GetGameState()
    return self.CurrentGameState
end

function GM:SetGameState(newGameState)
    if !self.GameStates[newGameState] then
        self.CurrentGameState = self.GameStates.INACTIVE
        error("Failed to set invalid GAME STATE: " .. newGameState)
    end

    self.CurrentGameState = self.GameStates[newGameState]
end

if SERVER then
    util.AddNetworkString("GetGameState")
    util.AddNetworkString("GetGameStateCallback")
    
    net.Receive("GetGameState", function(len, ply)
        net.Start("GetGameStateCallback")
            net.WriteInt(GAMEMODE:GetGameState(), 3)
        net.Send(ply)
    end)
else
    function GM:GetGameState()
        net.Start("GetGameState")
        net.SendToServer()
    end

    net.Receive("GetGameStateCallback", function(len, ply)
        GAMEMODE:SetGameState(net.ReadInt(3))
    end)
end