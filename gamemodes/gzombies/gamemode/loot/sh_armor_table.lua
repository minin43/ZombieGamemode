GM.LootTable.ARMOR = {
    --[[
        -- Level = Protection level, higher better, mirrors real-life ballistic protection
        -- Dispersal = Energy absorption, 1 transfering 90% damage, 10 transfering 0% damage, higher better
        -- FSDurability = First-Shot Durability, how many shots of at-level fire before integrity begins decreasing
        -- ContDurability = Continuous Durability, how much integrity decreases per at-level shot after FSDurability
        -- Integrity = Armor health, active %, chance of at-level fire deflecting on armor
        -- Weight = How much carrying/equipping armor influences stamina
        -- Rarity = Cost (1-6, 1 being "common")
        -- ExpResist = Explosion Resistance, 0-100%
        -- Bulk = Armor Size, ?-?, how much it affects mouse sensitivity, cw2 weapons have a value baked in
        -- PenResist = Penetration, 0-20%, how much energy is absorbed on a shot that penetrates, armor degredation amount on pen is ContDurability * 2 - PenResist
    ]]
    -- Vests
    IIA_KEV = {
        Name = "Level IIA Kevlar Vest",
        Type = GAMEMODE.ArmorTypes.VEST,
        Level = GAMEMODE.ArmorLevels.IIA,
        Dispersal = 1,
        FSDurability = 0,
        ContDurability = 0,
        Integrity = 0,
        Weight = 0,
        Rarity = 1,
        ExpResist = 0,
        Bulk = 0,
        PenResist = 0
    },
    II_KEV = {
        Name = "Level II Kevlar Vest",
        Type = GAMEMODE.ArmorTypes.VEST,
        Level = GAMEMODE.ArmorLevels.II,
        Dispersal = 2,
        FSDurability = 0,
        ContDurability = 0,
        Integrity = 0,
        Weight = 0,
        Rarity = 2,
        ExpResist = 0,
        Bulk = 0,
        PenResist = 0
    },
    IIIA_KEV = {
        Name = "Level IIIA Kevlar Vest",
        Type = GAMEMODE.ArmorTypes.VEST,
        Level = GAMEMODE.ArmorLevels.IIIA,
        Dispersal = 2,
        FSDurability = 0,
        ContDurability = 0,
        Integrity = 0,
        Weight = 0,
        Rarity = 2,
        ExpResist = 0,
        Bulk = 0,
        PenResist = 0
    },
    III_AMY = {
        Name = "Level III Polymeric Amyloid Vest",
        Type = GAMEMODE.ArmorTypes.VEST,
        Level = GAMEMODE.ArmorLevels.III,
        Dispersal = 2,
        FSDurability = 0,
        ContDurability = 0,
        Integrity = 0,
        Weight = 0,
        Rarity = 5,
        ExpResist = 0,
        Bulk = 0,
        PenResist = 0
    },
    --[[
        -- Level = Protection level, higher better, mirrors real-life ballistic protection
        -- Dispersal = Energy absorption, 1 transfering 90% damage, 10 transfering 0% damage, higher better
        -- FSDurability = First-Shot Durability, how many shots of at-level fire before integrity begins decreasing
        -- ContDurability = Continuous Durability, how much integrity decreases per at-level shot after FSDurability
        -- Integrity = Armor health, active %, chance of at-level fire deflecting on armor
        -- Weight = How much carrying/equipping armor influences stamina
        -- Rarity = Cost (1-6, 1 being "common")
        -- ExpResist = Explosion Resistance, 0-100%
        -- Bulk = Armor Size, ?-?, how much it affects mouse sensitivity, cw2 weapons have a value baked in
        -- PenResist = Penetration, 0-20%, how much energy is absorbed on a shot that penetrates, armor degredation amount on pen is ContDurability * 2 - PenResist
    ]]
    -- Plates
    WOOD = {
        Name = "Wood Block",
        Type = GAMEMODE.ArmorTypes.PLATE,
        Level = GAMEMODE.ArmorLevels.WOOD,
        Dispersal = 1,
        FSDurability = 8,
        ContDurability = 12,
        Integrity = 100,
        Weight = 0,
        Rarity = GAMEMODE.Rarities.COMMON,
        ExpResist = 15,
        Bulk = 0,
        PenResist = 5
    },
    III_ST = {
        Name = "Level III Steel Armor Plate",
        Type = GAMEMODE.ArmorTypes.PLATE,
        Level = GAMEMODE.ArmorLevels.III,
        Dispersal = 8,
        FSDurability = 0,
        ContDurability = 0,
        Integrity = 0,
        Weight = 0,
        Rarity = GAMEMODE.Rarities.COMMON,
        ExpResist = 0,
        Bulk = 0,
        PenResist = 0
    },
    IV_ST = {
        Name = "Level IV Steel Armor Plate",
        Type = GAMEMODE.ArmorTypes.PLATE,
        Level = GAMEMODE.ArmorLevels.IV,
        Dispersal = 8,
        FSDurability = 0,
        ContDurability = 0,
        Integrity = 0,
        Weight = 0,
        Rarity = GAMEMODE.Rarities.RARE,
        ExpResist = 0,
        Bulk = 0,
        PenResist = 0
    },
    III_POLY = {
        Name = "Level III Polythylene Armor Plate",
        Type = GAMEMODE.ArmorTypes.PLATE,
        Level = GAMEMODE.ArmorLevels.III,
        Dispersal = 6,
        FSDurability = 0,
        ContDurability = 0,
        Integrity = 0,
        Weight = 0,
        Rarity = GAMEMODE.Rarities.UNCOMMON,
        ExpResist = 0,
        Bulk = 0,
        PenResist = 0
    },
    III_TIT = {
        Name = "Level III Titanium Armor Plate",
        Type = GAMEMODE.ArmorTypes.PLATE,
        Level = GAMEMODE.ArmorLevels.III,
        Dispersal = 5,
        FSDurability = 0,
        ContDurability = 0,
        Integrity = 0,
        Weight = 0,
        Rarity = GAMEMODE.Rarities.RARE,
        ExpResist = 0,
        Bulk = 0,
        PenResist = 0
    },
    IV_TIT = {
        Name = "Level IV Titanium Armor Plate",
        Type = GAMEMODE.ArmorTypes.PLATE,
        Level = GAMEMODE.ArmorLevels.IV,
        Dispersal = 5,
        FSDurability = 0,
        ContDurability = 0,
        Integrity = 0,
        Weight = 0,
        Rarity = GAMEMODE.Rarities.EPIC,
        ExpResist = 0,
        Bulk = 0,
        PenResist = 0
    },
    VX_TPA = {
        Name = "Level V Titanium-Polythylene Armor Plate",
        Type = GAMEMODE.ArmorTypes.PLATE,
        Level = GAMEMODE.ArmorLevels.V_X,
        Dispersal = 0,
        FSDurability = 0,
        ContDurability = 0,
        Integrity = 0,
        Weight = 0,
        Rarity = GAMEMODE.Rarities.EXOTIC,
        ExpResist = 0,
        Bulk = 0,
        PenResist = 0
    },
    III_CER = {
        Name = "Level III Ceramic Armor Plate",
        Type = GAMEMODE.ArmorTypes.PLATE,
        Level = GAMEMODE.ArmorLevels.III,
        Dispersal = 0,
        FSDurability = 0,
        ContDurability = 0,
        Integrity = 0,
        Weight = 0,
        Rarity = GAMEMODE.Rarities.UNCOMMON,
        ExpResist = 0,
        Bulk = 0,
        PenResist = 0
    },
    IV_CER = {
        Name = "Level IV Ceramic Armor Plate",
        Type = GAMEMODE.ArmorTypes.PLATE,
        Level = GAMEMODE.ArmorLevels.IV,
        Dispersal = 0,
        FSDurability = 0,
        ContDurability = 0,
        Integrity = 0,
        Weight = 0,
        Rarity = GAMEMODE.Rarities.RARE,
        ExpResist = 0,
        Bulk = 0,
        PenResist = 0
    }
    -- Returns the name of the loot
    GenerateRandomLoot = function()
        -- If the armor loot table has yet to be generated, do so now
        if !GAMEMODE.LootTable.ARMOR.Generated then
            GAMEMODE.LootTable.ARMOR.GenerateRandomLootTable()
        end

        -- Pull a random piece of armor from the table, return it
        local type = GAMEMODE.LootTable.Armor.DistributionTable[math.random(100)]
        local toReturn = GAMEMODE.LootTable.ARMOR.Generated[type][math.random(#GAMEMODE.LootTable.ARMOR.Generated[type])].Class
        --[[if toReturn.Type != GAMEMODE.ArmorTypes.PLATE then -- Should this be a separate function?
            if toReturn.Rarity == GAMEMODE.Rarities.EXOTIC then
                toReturn.Manufacturer = GAMEMODE.FictionalArmorManufacturers.Exotic[1]
            else
                toReturn.Manufacturer = GAMEMODE.FictionalArmorManufacturers[toReturn.Type][math.random(#GAMEMODE.FictionalManufacturers[toReturn.Type])]
            end
        end]]
        return toReturn
    end
    GenerateLootTable = function()
        --[[How the loot table is generated:
            Any "common" rarity item appears in the table 6 times. As the item becomes more rare, it appears 1 fewer times.
            A random number between 1 and the size of the table is generated to pull from it]]
        GAMEMODE.LootTable.ARMOR.DistributionTable = {}
        local counter = 0
        for k, v in pairs(GAMEMODE.ArmorDistribution) do
            for i = 1, v do
                GAMEMODE.LootTable.ARMOR.DistributionTable[i + counter] = k
            end
            counter = counter + v
        end
        
        GAMEMODE.LootTable.ARMOR.Generated = {[GAMEMODE.ArmorTypes.VEST] = {}, [GAMEMODE.ArmorTypes.CARRIER] = {},
            [GAMEMODE.ArmorTypes.PLATE] = {}, [GAMEMODE.ArmorTypes.HELMET] = {}, [GAMEMODE.ArmorTypes.FACE] = {}}
        for k, v in pairs(GAMEMODE.LootTable.ARMOR) do
            if istable(v) then -- Ignore functions in our search
                local subtable = GAMEMODE.LootTable.ARMOR.Generated[v.Type]
                local tabCount = #subtable
                for i = 1, 7 - v.Rarity do -- 7 could be replaced with the count of our rarity table + 1, but maybe any more rare and it shouldn't randomly spawn in?
                    v.Class = k
                    subtable[tabCount + i] = v
                end
            end
        end
    end
}

GM.FictionalArmorManufacturers = {
    Vest = {"Backtrack", "Altai Tactical Wear", "Spartan Armament", "Tread Gear"},
    Carrier = {"Citizen Armory", "Leatherpack Gear", "Talos Tactical", "Guardian Ballistics"},
    Exotic = {"Olympus Tactical"}
}

--[[
    Armor:
    Head
        Ballistic Helmets
        Cap
        Tuque
    Face
        Ballistic Mask
        Gas Masks
        Sunglasses
    Chest
        Bullet-resistant vests
        Plate carriers
        Chest Rigs

    Shot Profiles:
        9mm out of pistol barrel: level 1
        45 acp/12-gauge out of pistol barrel, 9mm out of small smg barrel: level 2
        45 acp/9mm out of smg barrel, 44 magnum out of pistol barrel, all 12-gauge: level 3
        5.56/7.62/5.45 out of rifle barrel, all 4.6/5.7, all .50 ae: level 4
        5.56/7.62 out of long rifle barrel: level 5
        .338 Lapua out of long rifle barrel: level 6
    Barrel Types:
        * Pistol
        * Short SMG
        * SMG
        * Rifle
        * Long Rifle
    Firearm Tiers:
        1 - P99, MAC-11, & PMM
        2 - M1911, MP9, Super Shorty
        3 - UMP .45, MP5, MR96, M3 Super 90, M4 Super 90, Saiga-12k
        4 - AK-74, AR-15, FAMAS G2, G36C, L85A2, M249, Five-Seven, MP7 A1, SCAR, G3A3, Desert Eagle
        5 - M14, Dragunov, VSS Vintorez
        6 - L115
    
    Steel: very protective, degrades slowly, and is cheap, but is very heavy, and passes a lot of the kinetic energy onto the user
    Ceramic: Lightweight (2/3 weight of steel), absorbs more kinetic energy, and does better against penetrating rounds, but is more expensive and degrades faster
    Polyethylene: Lightest of all and degrades slower than ceramic, but somewhat expensive and extremely weak to penetrating rounds
    Titanium: 1/2 the weight of steel, but is more expensive, deforms quicker, and is weaker to penetrating rounds
    (not a plate) Kevlar: Average durability across its designated caliber protections

    Carriers:
        * (Generic) Plate Carrier (front & back pouch for plates)
        * Light Carrier (generic, but lighter)
        * 

    Auto-generating ballistic profiles vs. hard-coding them (per gun/caliber combo)
        Problem with auto-generating: rather complex, difficult to take into account all the interesting one-off mechanics of certain calibers+guns
        Benefit with auto-generating: Front loads the work, makes adding new guns easier in the future
        Problem with hard-coding: time consuming, a lot of work to add new guns
        Benefit with hard-coding: spend less time bug-fixing problems with the auto-generation, easy to balance specific firearms

    Potential Ammo additions:
    Lead Round Nose (LRN)
    Wad Cutter (WC)
    Semi Wad Cutter (SWC)
    Semi-Jacketed (SJ)
    Full Metal Jacket (FMJ)
    Semi-Jacketed Hollow Point (SJHP)
    Jacketed Hollow Point (JHP)
    Special (RCBD)

    Soft Point (SP): The tip of this bullet is exposed lead.
    Armor Piercing (AP): The core is composed of alloy instead of lead.
    Boat Tail (BT): The rear end of the cartridge is tapered to stabilize the projectile in flight.
    Boat Tail Hollow Point (BTHP): This is a combination of the boat tail and hollow point features.

    https://bulletproofzone.com/collections/bulletproof-vests
    https://bulletproofzone.com/
    https://bulletproofzone.com/collections/pouches-holsters
]]