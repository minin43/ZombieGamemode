GM.OpenSounds = {
    DEFAULT = "gzombies/lootables/default.wav",
    WoodLight = "gzombies/lootables/wood1light.wav",
    WoodHeavy = "gzombies/lootables/wood1heavy.wav",
    Plastic = "gzombies/lootables/plastic1.wav",
    MetalHeavy = "gzombies/lootables/metal1heavy.wav",
    MetalLight = "gzombies/lootables/metal1light.wav",
    MetalMed = "gzombies/lootables/metal1med.wav",
    MetalHeavy2 = "gzombies/lootables/metal2heavy.wav",
    OPENclose = "gzombies/lootables/container_open.wav",
    openCLOSE = "gzombies/lootables/container_close.wav" --To be utilized at some point in the future, for when you shut the lootable
}

GM.PropTable = {
    [""] = {size = 0, snd = GM.OpenSounds.DEFAULT},
    ["models/props_junk/trashbin01a.mdl"] = {size = 3, snd = GM.OpenSounds.Plastic},
    ["models/props_junk/trashdumpster01a.mdl"] = {size = 12, snd = GM.OpenSounds.MetalHeavy},
    ["models/props_wasteland/kitchen_fridge001a.mdl"] = {size = 8, snd = GM.OpenSounds.MetalHeavy2},
    ["models/props_wasteland/kitchen_stove001a.mdl"] = {size = 5, snd = GM.OpenSounds.MetalMed},
    ["models/props_wasteland/kitchen_stove002a.mdl"] = {size = 3, snd = GM.OpenSounds.MetalMed},
    ["models/props_c17/cashregister01a.mdl"] = {size = 2, snd = GM.OpenSounds.MetalLight},
    ["models/props_c17/furniturecupboard001a.mdl"] = {size = 2, snd = GM.OpenSounds.WoodLight},
    ["models/props_c17/furnituredrawer001a.mdl"] = {size = 4, snd = GM.OpenSounds.WoodLight},
    ["models/props_c17/furnituredrawer002a.mdl"] = {size = 1, snd = GM.OpenSounds.WoodLight},
    ["models/props_c17/furnituredrawer003a.mdl"] = {size = 4, snd = GM.OpenSounds.WoodLight},
    ["models/props_c17/furnituredresser001a.mdl"] = {size = 7, snd = GM.OpenSounds.WoodHeavy},
    ["models/props_c17/furniturefridge001a.mdl"] = {size = 5, snd = GM.OpenSounds.MetalMed},
    ["models/props_c17/furnitureStove001a.mdl"] = {size = 3, snd = GM.OpenSounds.MetalLight},
    ["models/props_c17/furniturewashingmachine001a.mdl"] = {size = 2, snd = GM.OpenSounds.MetalMed},
    ["models/props_interiors/furniture_desk01a.mdl"] = {size = 3, snd = GM.OpenSounds.WoodLight},
    ["models/props_interiors/furniture_Vanity01a.mdl"] = {size = 1, snd = GM.OpenSounds.WoodLight},
    ["models/props_c17/Lockers001a.mdl"] = {size = 6, snd = GM.OpenSounds.MetalHeavy},
    ["models/props_combine/breendesk.mdl"] = {size = 5, snd = GM.OpenSounds.WoodHeavy},
    ["models/props_wasteland/laundry_dryer002.mdl"] = {size = 3, snd = GM.OpenSounds.MetalHeavy},
    ["models/props_wasteland/laundry_washer003.mdl"] = {size = 3, snd = GM.OpenSounds.MetalLight},
    ["models/props_wasteland/controlroom_filecabinet001a.mdl"] = {size = 2, snd = GM.OpenSounds.MetalLight},
    ["models/props_wasteland/controlroom_filecabinet002a.mdl"] = {size = 6, snd = GM.OpenSounds.MetalMed},
    ["models/props_wasteland/controlroom_storagecloset001a.mdl"] = {size = 7, snd = GM.OpenSounds.MetalMed},
    ["models/props_wasteland/controlroom_storagecloset001b.mdl"] = {size = 7, snd = GM.OpenSounds.MetalHeavy},
    ["models/props_vehicles/car002a_physics.mdl"] = {size = 6, snd = GM.OpenSounds.OPENclose},
    ["models/props_vehicles/car004a_physics.mdl"] = {size = 6, snd = GM.OpenSounds.OPENclose},
    ["models/props_vehicles/car005a_physics.mdl"] = {size = 6, snd = GM.OpenSounds.OPENclose}
}

if SERVER then
    -- Generate a completely random piece of loot, used to populate lootables
    function GM:GenRandomLoot()
        --[[local randNum = math.random(100)
        local lootType = self.LootDistribution[randNum]
        return self.LootTable[lootType].GenerateRandomLoot()]]
        -- Works by pulling a loot type from the general loot table distribution table, then pulls a random item from its table
        return self.LootTable[self.LootDistribution[math.random(100)]].GenerateRandomLoot()
    end
end