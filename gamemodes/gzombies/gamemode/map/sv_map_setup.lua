if not file.Exists( "gz/map_edits", "DATA" ) then
	file.CreateDir( "gz/map_edits" )
end

if not file.Exists( "gz/map_edits/" .. game.GetMap() .. ".txt", "DATA" ) then
	file.Write( "gz/map_edits/" .. game.GetMap() .. ".txt", util.TableToJSON( { playerSpawns = {}, zombieSpawns = {}, lootableSpawns = {}, propSpawns = {}, propDeletions = {} } ) )
end

function GM:SetupMap( doCleanUp )
    if hook.Call( "PreSetupMap", self, doCleanUp ) then return end

    if doCleanUp then
        local deletedEnts = {}
        game.CleanUpMap( false, { "player", "func_breakable", "prop_dynamic", "weapon_*", "item_*" } )
    end

    self.referenceFile = file.Read( "gz/map_edits/" .. game.GetMap() .. ".txt", "DATA" )
    self.cleanedFile = util.JSONToTable( self.referenceFile )
    if not self.cleanedFile then Error("[gZ] Attempted map setup with invalid save file") return end

    if self.cleanedFile.playerSpawns then
        for k, v in pairs(self.cleanedFile.playerSpawns) do
            local spawn = ents.Create("gz_player_spawn")
            if !IsValid(spawn) then return end
            spawn:SetPos(v.pos)
            spawn:SetAngles(v.ang)
        end
    end

    if self.cleanedFile.zombieSpawns then
        for k, v in pairs(self.cleanedFile.zombieSpawns) do
            local spawn = ents.Create("gz_zombie_spawn")
            if !IsValid(spawn) then return end
            spawn:SetPos(v.pos)
            spawn:SetAngles(v.ang)
        end
    end

    if self.cleanedFile.lootableSpawns then
        for k, v in pairs(self.cleanedFile.lootableSpawns) do
        local spawn = ents.Create(v.class)
        if !IsValid(spawn) then return end
        spawn:SetPos(v.pos)
        spawn:SetAngles(v.ang)
    end

    if self.cleanedFile.propSpawns then
        for k, v in pairs( self.cleanedFile.propSpawns ) do
            local prop = ents.Create( "prop_physics" )
            if !IsValid( prop ) then return end
            prop:SetModel( v.model )
            prop:SetPos( v.pos )
            prop:SetAngles( v.ang )
            prop:Spawn()
            if v.locked then
                prop:SetMoveType( MOVETYPE_NONE )
                prop:SetUseType( SIMPLE_USE )
                prop:SetSolid( SOLID_VPHYSICS )

                local physobject = prop:GetPhysicsObject()
                if physobject and physobject:IsValid() then physobject:EnableMotion( false ) end
            end
        end
    end

    if self.cleanedFile.propDeletions then
        for k, v in pairs( self.cleanedFile.Deletions ) do
            local entToDelete = ents.GetMapCreatedEntity( k )
            local openSesame = { func_door_rotating = true, func_door = true, prop_door_rotating = true }

            if entToDelete and openSesame[ entToDelete:GetClass() ] then
                entToDelete:Fire( "Unlock" )
                entToDelete:Fire( "Use" )
            end
            if entToDelete and entToDelete:IsValid() then
                timer.Simple( 0.5, function() entToDelete:Remove() end )
            end
        end
    end

    if self.cleanedFile.Walls then
        local vector1
        for k, v in pairs( self.cleanedFile.Walls ) do
            if k % 2 == 1 then
                vector1 = Vector( v[1], v[2], v[3] )
            else
                local vector2 = Vector( v[1], v[2], v[3] )

                local wall = ents.Create( "gz_invis_wall" )
                if wall then
                    wall:SetPos( vector1 )
                    --wall:SetMinBound( vector1 ) -- Just the position for now
                    wall:SetMaxBound( vector2 )
                    wall:Spawn()
                    wall:PhysicsInitBox( Vector(0,0,0), vector2 - vector1 )

                    local phys = wall:GetPhysicsObject()
                    if IsValid( phys ) then
                        phys:EnableMotion( false )
                    end
                end
            end
        end
    end

    hook.Call("PostSetupMap", self)
end

--[[hook.Add( "InitPostEntity", "SpawnCustomProps", function()
    timer.Simple( 3, function()
        GAMEMODE:RefreshCustomProps() 
    end )
end )]]