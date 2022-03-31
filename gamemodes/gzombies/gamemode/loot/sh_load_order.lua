local LoadOrder = {
    "sh_enums.lua",
    ...
    ""
}

for k, v in pairs(LoadOrder) do
    IncludeNewFile(v, "loot")
end