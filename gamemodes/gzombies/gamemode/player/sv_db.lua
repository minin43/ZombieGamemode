-- Saving player data to local database
-- Only occurs on exraction

--[[
    Design notes:
        When a player extracts from the map, their inventory needs to be stored on the server db. This probably
    shouldn't include literally every kind of item in the game, so we need to restrict them to certain ones: medical
    supplies, weapons, tools, attachments, magazines, armor, ammo, and currencies. This is preferably stored in the sql db
    and not as a json file. This means these types of items will need to be dynamically added/removed from a global
    list of items within the db by check against the table we have stored in the loot files.
]]

