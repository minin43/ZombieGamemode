include("shared.lua")
include("sh_loader.lua")

AddCSLuaFile("cl_init.lua")
AddCSLuaFile("shared.lua")
AddCSLuaFile("sh_loader.lua")

util.AddNetworkString("SendSingleSound")

GM.PreventFallDamage = false

if not file.Exists("gz", "DATA") then
	file.CreateDir("gz")
end

if not file.Exists("gz/users", "DATA") then
	file.CreateDir("gz/users")
end

function GM:Initialize()
	--Before the startup work has been done
	hook.Call("PreGamemodeInit", self)
	--[[
		- Set up map (player spawns, zombie spawns, storage locations, anything else)
		- Set up any edited globals
		- Start game timer
	]]
	--self:SetupMap()

	self:GameStart()

	--After the startup and round work has been done
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

	--ply:ConCommand("cl_deathview 1")
	ply:SetTeam(0)
	--ply:Spectate(OBS_MODE_CHASE)

	self:AddNewPlayerToReadyList(ply)
end

function GM:PlayerSpawn(ply, firstSpawn)
	ply:Spectate(OBS_MODE_NONE)
	self.BaseClass:PlayerSpawn( ply )
	ply:SetModel("models/player/odessa.mdl")

	ply:SetWalkSpeed( self.DefaultWalkSpeed )
	ply:SetRunSpeed( self.DefaultRunSpeed )
	ply:SetJumpPower( self.DefaultJumpPower )

	hook.Call( "gZPostPlayerSpawn", GAMEMODE, ply )
	return false
end

function GM:PlayerSetModel( ply )
	ply:SetModel( "models/player/odessa.mdl" )
end

function GM:PlayerDeathSound()
	return true
end

function GM:PlayerDisconnected(ply)
	GlobalChatPrintColor(Color(255, 255, 255), "Player ", Color(76, 175, 80), ply:Nick(), Color(255, 255, 255), " has disconnected (SteamID: ", ply:SteamID(), ").")
	print(ply:Nick(), " disconnected ", ply:SteamID(), ply:SteamID64())
	self:RemovePlayerFromReadyList(ply)
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

function BroadcastSound(dir)
    net.Start("SendSingleSound")
        net.WriteString(dir)
    net.Broadcast()
end

function GlobalChatPrintColor(...)
    for k, v in pairs(player.GetAll()) do
        v:ChatPrintColor(...)
    end
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
