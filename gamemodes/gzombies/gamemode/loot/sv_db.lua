-- Set up or verify the loot tables, if we run into new items, add them to sql db, if we've deleted them, relfect that too
for k, v in pairs(GAMEMODE.LootTable) do
    if istable(v) then
        local name = "gz_" .. k

        if !sql.TableExists(name) then
            -- Since the table doesn't exist, we're setting up for the first time, no need to verify
            GM:SetupDBTable(name, v)
        else
            GM:VerifyDBTable(name, v)
        end
    end
end

function GM:SetupDBTable(tableName, toFill)
    sql.Query("CREATE TABLE IF NOT EXISTS " .. name .. " ( LootID INTEGER NOT NULL AUTO_INCREMENT, Name VARCHAR(255), PRIMARY KEY LootID );")
    
    sql.Begin()
    for k, v in pairs(toFill) do
        sql.Query("INSERT INTO " .. name .. " (Name) VALUES ( " .. k .. ");")
    end
    sql.Commit()
end

function GM:VerifyDBTable(tableName, toVerify)
    local returnTable = sql.Query("SELECT * FROM " .. tableName .. ";")
    for k, v in pairs(returnTable) do
        if IsValid(toVerify[v]) then
            -- Delete from both tables? Since they're just copies   toVerify[v] = nil, returnTable[k] = nil
        end
    end
    -- If anything went unverified in our file table, add them to the db
    -- If anything went unverified in the db table, remove them and all instances in other tables from the db
end