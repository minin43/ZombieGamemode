--//Called by the above loop when there's a new type of loot to create a table for
--//Should only run on fresh .db SQLite databases (i.e. on a fresh server) or if a new update
--//Adds new content
function GM:SetupDBTable(tableName, toFill)
    sql.Query("CREATE TABLE IF NOT EXISTS " .. tableName .. " (LootID INTEGER NOT NULL AUTO_INCREMENT, Name VARCHAR(255), PRIMARY KEY LootID);")
    
    sql.Begin()
    for k, v in pairs(toFill) do
        sql.Query("INSERT INTO " .. tableName .. " (Name) VALUES (" .. k .. ");")
    end
    sql.Commit()
end

--//Called by the above loop when we need to verify that no new items exist, or if new items have been added
--//Whatever exists in the code is what the database should mirror, new entry in the code tables need to be added
--//to the DB. Anything missing in the code tables needs to be removed from the DB, probably recurisvely
function GM:VerifyDBTable(tableName, codeCopy)
    local dbCopy = sql.Query("SELECT * FROM " .. tableName .. ";")
    for class, tab in pairs(codeCopy) do
        if !IsValid(dbCopy[class]) then
            --Add to database
        end
    end
    for k, v in pairs(dbCopy) do
        if !IsValid(codeCopy[v]) then
            --Remove from database
            --Do we need to remove recursively? If we save player's loot tables, their gear may point to this
        end
    end
end

--//Set up or verify the loot tables (armor, weapons, resources, etc)
--//If we run into new items, add them to sql db, if we've deleted them, relfect that too
--[[for k, v in pairs(GM.LootTable) do
    if istable(v) then
        local name = "gz_" .. k

        if !sql.TableExists(name) then
            -- Since the table doesn't exist, we're setting up for the first time, no need to verify
            GM:SetupDBTable(name, v)
        else
            GM:VerifyDBTable(name, v)
        end
    end
end]]