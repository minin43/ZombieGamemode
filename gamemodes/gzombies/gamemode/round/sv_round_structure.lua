util.AddNetworkString("UpdateTimer")

--Called only once on gamemode load
function GM:GameStart()
    self:ResetRound()
end

--Before a game or a start countdown has begun
function GM:ResetRound()
    --Do any work
    GM.TimePassed = 0

    self:SetGameState(self.GameStates.INACTIVE)
    timer.Remove(self.TimerNames.PostGameTimer)
end

--The countdown to start the game
function GM:StartPreRound()
    self:SetGameState(self.GameStates.PREGAME)

    local preGameTimer = 0
    timer.Create(self.TimerNames.PreGameTimer, 0, 1, function()
        preGameTimer = preGameTimer + 1
        GAMEMODE:BroadcastTimerStatus(self.TimerNames.PreGameTimer, preGameTimer)
    
        if preGameTimer == self.PreRoundDelay then
            timer.Remove(self.TimerNames.PreGameTimer)

            if GAMEMODE:EnoughReadiedPlayersToStart() then
                GAMEMODE:Startround()
            else
                GAMEMODE:ResetRound()
                GAMEMODE:GlobalChatPrintColor("Not enough ready players to start a round!")
            end
        end
    end)
end

--Begins the round (locks in all players)
function GM:StartRound()
    --Do any work
    self:SetGameState(self.GameStates.ACTIVE)
    timer.Remove(self.TimerNames.PreGameTimer)
    self:SetupMap(true) --Probably a bad idea to do this right at round start
    self:SetupLoot() --Same with this
    self:ClearAllPlayerReadiness()

    timer.Create(self.TimerNames.GameTimer, 1, 0, function()
		GAMEMODE.TimePassed = GAMEMODE.TimePassed + 1

        GAMEMODE:BroadcastTimerStatus(self.TimerNames.GameTimer, GAMEMODE.TimePassed)

        --Should NEVER get hit, but just in case a game happens to last ~18.2 hours, kill the timer to prevent a number being sent in BroadcastTimerStatus exceeding 16 bits in size
        if GAMEMODE.TimePassed == 65534 then
            timer.Remove(self.TimerNames.GameTimer)
        end
	end)
end

--Called after the end conditions for the round have been met
function GM:StartEndRound()
    --Do any work
    self:SetGameState(self.GameStates.POSTGAME)
    timer.Remove(self.TimerNames.GameTimer)

    local postGameTimer = 0
    timer.Create(self.TimerNames.PostGameTimer, 0, 1, function()
        postGameTimer = postGameTimer + 1
        GAMEMODE:BroadcastTimerStatus(self.TimerNames.PostGameTimer, postGameTimer)
    
        if postGameTimer == self.PostRoundDelay then
            self:ResetRound()
            timer.Remove(self.TimerNames.PostGameTimer)
        end
    end)
end

function GM:BroadcastTimerStatus(timerName, newTime)
    net.Start("UpdateTimer")
        net.WriteString(timerName)
        net.WriteInt(newTime, 16)
    net.Broadcast()
end