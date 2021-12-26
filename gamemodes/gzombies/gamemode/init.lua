include("shared.lua")
include("sh_loader.lua")

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("sh_loader.lua")

GM.PreventFallDamage = false
GM.DefaultWalkSpeed = 150
GM.DefaultRunSpeed = 220
GM.TimePassed = 0

util.AddNetworkString("SendSingleSound")
util.AddNetworkString("PlayerChatColor")

local _Ply = FindMetaTable("Player")
function _Ply:AddScore(score)
	local num = self:GetNWInt("tdm_score")
	self:SetNWInt("tdm_score", num + score)
end

function _Ply:SendSound(dir)
    net.Start("SendSingleSound")
        net.WriteString(dir)
    net.Send(self)
end

function BroadcastSound(dir)
    net.Start("SendSingleSound")
        net.WriteString(dir)
    net.Broadcast()
end

function _Ply:ChatPrintColor(...)
	local args = { ... }
    local tab = {}
    
    for k, v in pairs(args) do
        --//We can be sent tables
        if istable(v) and !IsColor(v) then
            --//Only numerically-indexed tables
            for k2, v2 in ipairs(v) do
                --//If there are multiple items in the table, add a comma to the end of all except the last
                if k2 == #v then
                    tab[#tab + 1] = v2
                else
                    tab[#tab + 1] = v2 .. ", "
                end
            end
        else
            tab[#tab + 1] = v
        end
    end
    
	net.Start("PlayerChatColor")
		net.WriteTable(tab)
	net.Send(self)
end

function GlobalChatPrintColor(...)
    for k, v in pairs(player.GetAll()) do
        v:ChatPrintColor(...)
    end
end

if not file.Exists("gz", "DATA") then
	file.CreateDir("gz")
end

if not file.Exists("gz/users", "DATA") then
	file.CreateDir("gz/users")
end

-- Relic of a bygone era
--[[if not file.Exists("tdm/users/skins", "DATA") then
	file.CreateDir("tdm/users/skins")
end

if not file.Exists("tdm/users/models", "DATA") then
	file.CreateDir("tdm/users/models")
end

if not file.Exists("tdm/class", "DATA") then
	file.CreateDir("tdm/class")
end

if not file.Exists("tdm/cheaters", "DATA") then
	file.CreateDir("tdm/cheaters")
end

if not file.Exists("tdm/users/extra", "DATA") then
	file.CreateDir("tdm/users/extra")
end]]

function GM:Initialize()
	--[[
		- Set up map (player spawns, zombie spawns, storage locations, anything else)
		- Set up any edited globals
		- Start game timer
	]]
	self:SetupMap()

	timer.Create("GameTimer", 1, 0, function()
		GAMEMODE.TimePassed = GAMEMODE.TimePassed + 1
	end)

	hook.Call("PostGamemodeInit", self)
end

function GM:PlayerConnect(name, ip)
	GlobalChatPrintColor(Color(255, 255, 255), "Player ", Color(76, 175, 80), name, Color(255, 255, 255), " has begun connection to the server.")
end

function GM:PlayerInitialSpawn(ply)
    -- First join
	if not file.Exists("gz/users/" .. id(ply:SteamID()) .. ".txt", "DATA") then
		file.Write("gz/users/" .. id(ply:SteamID()) .. ".txt", util.TableToJSON({ ply:Name(), {} }))
	else -- Second+ join, mark down latest name
		local contents = util.JSONToTable(file.Read("gz/users/" .. id(ply:SteamID()) .. ".txt"))
		if ply:Name() ~= contents[1] then
			file.Write("gz/users/" .. id(ply:SteamID()) .. ".txt", util.TableToJSON({ ply:Name(), contents[2] }))
		end
	end

	--[[if not file.Exists("tdm/users/models/" .. id(ply:SteamID()) .. ".txt", "DATA") then
		file.Write("tdm/users/models/" .. id(ply:SteamID()) .. ".txt", util.TableToJSON({ ply:Name(), {} }))
	else
		local contents = util.JSONToTable(file.Read("tdm/users/models/" .. id(ply:SteamID()) .. ".txt"))
		if ply:Name() ~= contents[1] then
			file.Write("tdm/users/models/" .. id(ply:SteamID()) .. ".txt", util.TableToJSON({ ply:Name(), contents[2] }))
		end
    end]]

	if ply:IsBot() then
		--ply:SetTeam(1)
		self.BaseClass:PlayerSpawn(ply)
		return
	end

	--[[ply:ConCommand("cw_customhud 0")
	ply:ConCommand("cw_customhud_ammo 0")
	ply:ConCommand("cw_crosshair 1")
	ply:ConCommand("cw_blur_reload 0")
	ply:ConCommand("cw_blur_customize 0")
	ply:ConCommand("cw_blur_aim_telescopic 0")
	ply:ConCommand("cw_simple_telescopics 1")
	ply:ConCommand("cw_customhud_ammo 1")
	ply:ConCommand("cw_laser_quality 1")
	ply:ConCommand("cw_alternative_vm_pos 0")]]

	ply:ConCommand("cl_deathview 1")
	ply:SetTeam(0)
	ply:Spectate(OBS_MODE_CHASE)
end

function GM:PlayerDeathSound()
	return true
end

function GM:PlayerDisconnected(ply)
	GlobalChatPrintColor(Color(255, 255, 255), "Player ", Color(76, 175, 80), ply:Nick(), Color(255, 255, 255), " has disconnected (SteamID: ", ply:SteamID(), ").")
	print(ply:Nick(), " disconnected ", ply:SteamID(), ply:SteamID64())
end

function GM:PlayerShouldTakeDamage(ply, attacker)
    -- In the future, if there's joinable teams, may stick no-damage functionality here
	--[[if ply and attacker and ply ~= NULL and attacker ~= NULL then
		if IsValid(attacker) and IsValid(ply) and attacker:IsPlayer() and ply:IsPlayer() then
			if ply and attacker and ply:Team() ~= nil and attacker:Team() ~= nil then
				if(GetConVarNumber("tdm_friendlyfire") == 0 and ply:Team() == attacker:Team()) then
					return false
				end
			end
		end
	end]]
	
	return true
end

function GM:PlayerSpawn(ply)
	if(ply:Team() == 0) then
		ply:Spectate(OBS_MODE_IN_EYE)
		--SetupSpectator(ply)
		return
	end
	
	self.BaseClass:PlayerSpawn(ply)

	ply:SetWalkSpeed(GAMEMODE.DefaultWalkSpeed)
	ply:SetRunSpeed(GAMEMODE.DefaultRunSpeed)
	ply:SetJumpPower(GAMEMODE.DefaultJumpPower)

	ply:AllowFlashlight(false)
	ply:SetNoCollideWithTeammates(true)
    --ply:ConCommand("cw_simple_telescopics 0") --So everyone's on an equal playing field, also because some ACOGs don't work properly with it enabled
    
    GAMEMODE.PlayerLoadouts[ply] = GAMEMODE.PlayerLoadouts[ply] or {}
    if GAMEMODE.PlayerLoadouts[ply].playermodel then
        ply:SetModel(GAMEMODE.PlayerLoadouts[ply].playermodel)
        
        if GAMEMODE.PlayerLoadouts[ply].playermodelskin then
            ply:SetSkin(GAMEMODE.PlayerLoadouts[ply].playermodelskin)
        end
        ply:SetPlayerColor(col[ply:Team()])
        
        if GAMEMODE.PlayerLoadouts[ply].playermodelbodygroups then
            for bodygroup, value in pairs(GAMEMODE.PlayerLoadouts[ply].playermodelbodygroups) do
                ply:SetBodygroup(bodygroup, value)
            end
        end
    else
        local teamName = team.GetName(ply:Team())
        local model = self.DefaultModels[teamName][math.random(#self.DefaultModels[teamName])]
        
        ply:SetModel(model)
        ply:SetSkin(math.random(ply:SkinCount()))
        if #ply:GetBodyGroups() > 1 then
            for _, bgdata in pairs(ply:GetBodyGroups()) do
                ply:SetBodygroup(bgdata.id, math.random(bgdata.num))
            end
        end
        ply:SetPlayerColor(col[ply:Team()])
    end

    ply:RemoveAllAmmo()
    --giveLoadout(ply) -- Perhaps we want a basic loadout of fists?
    
    hook.Call("PostPlayerSpawn", GAMEMODE, ply)
    
	return false
end

function GM:PlayerDeath(vic, inf, att)
    if att:GetClass() == "entityflame" then
        --May want to do something special if the player dies to fire
    end
    
	if(vic:IsValid() and att:IsValid() and att:IsPlayer()) then
		if(vic == att) then
			return
		end
		vic:SetFOV(0, 0)
		--[[net.Start("tdm_deathnotice")
			net.WriteEntity(vic)
			net.WriteString(att.LastUsedWep)
			net.WriteEntity(att)
			net.WriteString(tostring(vic:LastHitGroup() == HITGROUP_HEAD))
		net.Broadcast()]]
	end			
	
end

local HitgroupScaling = { HITGROUP_HEAD = 1.5, HITGROUP_CHEST = 1.0, HITGROUP_STOMACH = 1.0, HITGROUP_LEFTARM = 0.8,
    HITGROUP_RIGHTARM = 0.8, HITGROUP_LEFTLEG = 0.7, HITGROUP_RIGHTLEG = 0.7}
function GM:ScalePlayerDamage(ply, hitgroup, dmginfo)
	if IsValid(ply) then
        dmginfo:ScaleDamage(HitgroupScaling[hitgroup] or 1.0)
    end
end

function GM:GetFallDamage(ply, speed)
	if self.PreventFallDamage then return 0 end
    --[[print("Fall damage calculation")
    print("speed: ", speed)
    print("suggested damage, speed / 8: ", (speed / 8))
    print("optional damage, speed / 12: ", (speed / 12))
    print("optional damage, speed / 16: ", (speed / 16))
    print("optional damage, my custom: ", math.Clamp(speed - 580, 0, 100))]]
	--//old fall damage calculation
	--[[speed = speed - 540
	return (speed * (100 / (1024 - 580)))]]

	--//suggested fall damage calclulation
	return math.Clamp(speed - 580, 0, 200)
end

-- If we need to remove any map-spawned entities
hook.Add("InitPostEntity", "RemoveEntities", function()
	timer.Simple(0, function()
		for k, v in pairs(ents.FindByClass("weapon_*")) do
			SafeRemoveEntity(v)
		end
		for k, v in pairs(ents.FindByClass("item_*")) do
			if v ~= "item_healthcharger" then
				SafeRemoveEntity(v)
			end
		end
	end)
end)