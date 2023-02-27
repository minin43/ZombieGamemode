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
    --Backpacks???
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

GM.WeaponDistribution = {
    GUN = 55,
    ATTACH = 15,
    MELEE = 30
}

GM.ToolsDistribution = {
    BUILD = 33,
    HARVEST = 33,
    LIGHT = 34
}

GM.ArmorDistribution = {
    VEST = 20,
    CARRIER = 20,
    PLATE = 20,
    HELMET = 20,
    FACE = 20
}

GM.ResourceDistribution = {
    BULLETS = 20,
    MAGS = 15,
    RAW = 40,
    MEDS = 25
}

-- Non-numeric Enumerations

GM.MagazineModels = { -- These models are only included in the mag system addon
    AR = "models/weapons/unloaded/rif_m4a1_mag.mdl",
    BR = "models/weapons/unloaded/snip_g3sg1_mag.mdl",
    PI = "models/weapons/unloaded/pist_fiveseven_mag.mdl",
    SMG = "models/weapons/unloaded/smg_mp5_mag.mdl",
    SR = "models/weapons/unloaded/snip_awp_mag.mdl"
}