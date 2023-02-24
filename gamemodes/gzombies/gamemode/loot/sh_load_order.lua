local LoadOrder = {
    "sh_enums.lua",
    "sh_armor_table.lua",
    "sh_resource_table.lua",
    "sh_tools_table.lua",
    "sh_weapon_table.lua",
    "sh_lootables.lua",
    "sv_db.lua"
}

for k, v in pairs(LoadOrder) do
    IncludeNewFile(v, "gzombies/gamemode/loot")
end