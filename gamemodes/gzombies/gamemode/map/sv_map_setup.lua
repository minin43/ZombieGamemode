GM.LootablesMasterTable = {}

if not file.Exists("gz/map_edits", "DATA") then
	file.CreateDir("gz/map_edits")
end

if not file.Exists("gz/map_edits/" .. game.GetMap() .. ".txt", "DATA") then
	file.Write("gz/map_edits/" .. game.GetMap() .. ".txt", util.TableToJSON({playerSpawns = {}, zombieSpawns = {}, propSpawns = {}, propDeletions = {}}))
end

-- Include map files here
GM.MapConfigs = {}
local mapConfigs, _ = file.Find("gzombies/gamemode/map/configs/*", "LUA")
for k, fileName in pairs(mapConfigs) do
    IncludeNewFile(fileName, "gzombies/gamemode/map/configs")
end

-- Spawns in and collects the props used for looting
function GM:SetupMap(doCleanUp)
    if hook.Call("PreSetupMap", self, doCleanUp) then return end

    if doCleanUp then
        local deletedEnts = {}
        game.CleanUpMap(false, {"player", "func_breakable", "prop_dynamic", "weapon_*", "item_*"})
    end

    self.referenceFile = nil
    if self.MapConfigs then
        self.referenceFile = self.MapConfigs[game.GetMap()]
    end

    if self.referenceFile == nil then
        self.referenceFile = file.Read("gz/map_edits/" .. game.GetMap() .. ".txt", "DATA")
        self.referenceFile = util.JSONToTable(self.referenceFile)
    end

    if not self.referenceFile then Error("[gZ] Attempted map setup with invalid save file") return end

    if self.referenceFile.playerSpawns then
        for k, v in pairs(self.referenceFile.playerSpawns) do
            local spawn = ents.Create("gz_player_spawn")
            if !IsValid(spawn) then return end
            spawn:SetPos(v.pos)
            spawn:SetAngles(v.ang)
            spawn:Spawn()
        end
    end

    if self.referenceFile.zombieSpawns then
        for k, v in pairs(self.referenceFile.zombieSpawns) do
            local spawn = ents.Create("gz_zombie_spawn")
            if !IsValid(spawn) then return end
            spawn:SetPos(v.pos)
            spawn:SetAngles(v.ang)
            spawn:Spawn()
        end
    end

    -- Need to include a check for any map-spawn props that share the lootable's model, and add them to any GM tables we store
    if self.referenceFile.propSpawns then
        for k, v in pairs(self.referenceFile.propSpawns) do
            local spawn = ents.Create("gz_lootable")
            if !IsValid(spawn) then return end
            spawn:SetPos(v.pos)
            spawn:SetAngles(v.ang)
            spawn:SetModel(v.model)
            spawn:SetMoveType(MOVETYPE_NONE)
            spawn:SetSolid(SOLID_VPHYSICS)
            spawn:Spawn()

            local physobject = spawn:GetPhysicsObject()
            if physobject and physobject:IsValid() then physobject:EnableMotion(false) end

            if self.PropTable[v.model] then
                table.insert(self.LootablesMasterTable, spawn)
                -- Anything else we need to do here?
                -- Does any of it need to be done before spawning?
            end
        end
    end

    if self.referenceFile.propDeletions then
        for k, v in pairs(self.referenceFile.propDeletions) do
            local entToDelete = ents.GetMapCreatedEntity(k)
            local openSesame = {func_door_rotating = true, func_door = true, prop_door_rotating = true}

            if entToDelete and openSesame[ entToDelete:GetClass() ] then
                entToDelete:Fire("Unlock")
                entToDelete:Fire("Use")
            end
            if entToDelete and entToDelete:IsValid() then
                timer.Simple(0.5, function() entToDelete:Remove() end)
            end
        end
    end

    if self.referenceFile.Walls then
        local vector1
        for k, v in pairs(self.referenceFile.Walls) do
            if k % 2 == 1 then
                vector1 = Vector(v[1], v[2], v[3])
            else
                local vector2 = Vector(v[1], v[2], v[3])

                local wall = ents.Create("gz_invis_wall")
                if wall then
                    wall:SetPos(vector1)
                    --wall:SetMinBound(vector1) -- Just the position for now
                    wall:SetMaxBound(vector2)
                    wall:Spawn()
                    wall:PhysicsInitBox(Vector(0,0,0), vector2 - vector1)

                    local phys = wall:GetPhysicsObject()
                    if IsValid(phys) then
                        phys:EnableMotion(false)
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
            local doSpawn = (math.random(i * 2) == 1) -- Each additional spot has 1/2 the chance of the previous to spawn something in (so: 1/2, 1/4, 1/8, etc)
            if doSpawn then                           -- This averages out so every lootable will at least have 1 thing
                local loot = self:GenerateRandomLoot()
                -- Do we assign the fluff info here? Or later? (i.e. the manufacturer)
                v:AddLoot(loot)
                print("Adding loot to lootable! info:", loot)
            end
        end
    end
end