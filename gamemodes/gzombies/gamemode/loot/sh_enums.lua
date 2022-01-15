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
    FACE = 5 -- Any more?
}

-- Must all, individually add up to 100
GM.LootDistributionSetup = {
    WEAPONS = 20,
    TOOLS = 25,
    ARMOR = 20,
    RESOURCES = 35
}
GM.WeaponDistributions = {
    GUNS = 45,
    ATTACH = 20,
    MELEE = 35
}
GM.ToolsDistribution = {
    FLASH = 100
}
GM.ArmorDistribution = {
    VESTS = 45,
    CARRIER = 35,
    PLATE = 20
}
GM.ResourceDistribution = {
    BULLETS = 20,
    MAGS = 15,
    RAW = 40,
    MEDS = 25
}
GM.LootDistribution = { -- This is THE TABLE used to determine loot
    WEAPONS = {},
    TOOLS = {},
    ARMOR = {},
    RESOURCES = {}
}
local counter = 0
for k, v in pairs(GM.LootDistributionSetup) do
    for i = 1, v do
        GM.LootDistribution[i + counter] = k
    end
    counter = counter + v
end
counter = 0
for k, v in pairs(GM.WeaponDistributions) do
    for i = 1, v do
        GM.LootDistribution.WEAPONS[i + counter] = k
    end
    counter = counter + k
end
counter = 0
for k, v in pairs(GM.ArmorDistribution) do
    for i = 1, v do
        GM.LootDistribution.ARMOR[i + counter] = k
    end
    counter = counter + k
end
counter = 0
for k, v in pairs(GM.ResourceDistribution) do
    for i = 1, v do
        GM.LootDistribution.RESOURCES[i + counter] = k
    end
    counter = counter + k
end

GM.WeightTable = {
    -- Will literally need to include everything in this table
}