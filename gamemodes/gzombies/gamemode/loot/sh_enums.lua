-- Enumerations

GM.LootType = {
    BASE = 0, -- Nothing found while playing should have this type
    GEAR = 10,
    RESOURCE = 20
}

GM.ArmorLevels = { --Based closely on real-life bullet-resistant armors
    WOOD = 0,
    IIA = 1,
    II = 2,
    IIIA = 3,
    III = 4,
    IV = 5,
    V_X = 6
}

GM.ArmorTypes = {
    VEST = 1,
    CARRIER = 2,
    PLATE = 3,
    HELMET = 4,
    FACE = 5
}

GM.WeaponTypes = {
    GUN = 1,
    ATTACH = 2,
    MELEE = 3
}

GM.ResourceTypes = {
    BULLETS = 1,
    MAGS = 2,
    RAW = 3,
    MEDS = 4
}

GM.ToolTypes = {
    BUILD = 1,
    HARVEST = 2,
    LIGHT = 3
}

GM.Barrels = {
    MINI = 1,
    PISTOL = 2,
    SMG = 3,
    RIFLE = 4,
    LONG_RIFLE = 5
}

-- Distributions

GM.LootDistributionSetup = {
    WEAPONS = 25,
    TOOLS = 10,
    ARMOR = 25,
    RESOURCES = 40
}

GM.WeaponDistributions = {
    [GM.WeaponsTypes.GUNS] = 55,
    [GM.WeaponsTypes.ATTACH] = 15,
    [GM.WeaponsTypes.MELEE] = 30
}

GM.ToolsDistribution = {
    [GM.ToolTypes.BUILD] = 33,
    [GM.ToolTypes.HARVEST] = 33,
    [GM.ToolTypes.LIGHT] = 34
}

GM.ArmorDistribution = {
    [GM.ArmorTypes.VEST] = 20,
    [GM.ArmorTypes.CARRIER] = 20,
    [GM.ArmorTypes.PLATE] = 20,
    [GM.ArmorTypes.HELMET] = 20,
    [GM.ArmorTypes.FACE] = 20
}

GM.ResourceDistribution = {
    [GM.ResourceTypes.BULLETS] = 20,
    [GM.ResourceTypes.MAGS] = 15,
    [GM.ResourceTypes.RAW] = 40,
    [GM.ResourceTypes.MEDS] = 25
}

GM.LootDistribution = {} -- We'll use a distribution table instead of any other method, because I guess I don't know what other method would work
local counter = 0
for k, v in pairs(GM.LootDistributionSetup) do
    for i = 1, v do
        GM.LootDistribution[i + counter] = k
    end
    counter = counter + v
end

-- Non-numeric Enumations

GM.MagazineModels = { -- These models are only included in the mag system addon
    AR = "models/weapons/unloaded/rif_m4a1_mag.mdl",
    BR = "models/weapons/unloaded/snip_g3sg1_mag.mdl",
    PI = "models/weapons/unloaded/pist_fiveseven_mag.mdl",
    SMG = "models/weapons/unloaded/smg_mp5_mag.mdl",
    SR = "models/weapons/unloaded/snip_awp_mag.mdl"
}