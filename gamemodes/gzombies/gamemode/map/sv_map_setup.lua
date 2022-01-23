GM.LootablesMasterTable = {}

if not file.Exists( "gz/map_edits", "DATA" ) then
	file.CreateDir( "gz/map_edits" )
end

if not file.Exists( "gz/map_edits/" .. game.GetMap() .. ".txt", "DATA" ) then
	file.Write( "gz/map_edits/" .. game.GetMap() .. ".txt", util.TableToJSON( { playerSpawns = {}, zombieSpawns = {}, propSpawns = {}, propDeletions = {} } ) )
end

-- Spawns in and collects the props used for looting
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
            spawn:Spawn()
        end
    end

    if self.cleanedFile.zombieSpawns then
        for k, v in pairs(self.cleanedFile.zombieSpawns) do
            local spawn = ents.Create("gz_zombie_spawn")
            if !IsValid(spawn) then return end
            spawn:SetPos(v.pos)
            spawn:SetAngles(v.ang)
            spawn:Spawn()
        end
    end

    -- Need to include a check for any map-spawn props that share the lootable's model, and add them to any GM tables we store
    if self.cleanedFile.propSpawns then
        for k, v in pairs( self.cleanedFile.propSpawns ) do
            --[[print(k, v)
            PrintTable(v)]]
            local spawn = ents.Create("gz_lootable")
            if !IsValid(spawn) then return end
            spawn:SetPos(v.pos)
            spawn:SetAngles(v.ang)
            spawn:SetModel(v.model)
            spawn:SetMoveType( MOVETYPE_NONE )
            spawn:SetSolid( SOLID_VPHYSICS )
            spawn:Spawn()

            local physobject = spawn:GetPhysicsObject()
            if physobject and physobject:IsValid() then physobject:EnableMotion( false ) end

            if self.PropSizeTable[v.model] then
                table.insert(self.LootablesMasterTable, spawn)
                -- Anything else we need to do here?
                -- Does any of it need to be done before spawning?
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

-- Populates the lootables in the game with a random assortment of gz_loot_base items
function GM:SetupLoot()
    for k, v in ipairs(self.LootablesMasterTable) do
        for i = 1, v.Size do
            local doSpawn = (math.random(i * 2) == 1) -- Each additional spot has 1/2 chance of previous to spawn something in
            if doSpawn then
                local loot = self:GenRandomLoot()
                -- Do we assign the fluff info here? Or later? (i.e. the manufacturer)
                v:AddLoot(loot)
            end
        end
    end
end

hook.Add( "InitPostEntity", "SpawnCustomProps", function()
    timer.Simple( 3, function()
        GAMEMODE:SetupMap()
    end )
end )