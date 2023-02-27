GM.LootTable.RESOURCES = GM.LootTable.RESOURCES or {}

GM.LootTable.RESOURCES.BULLETS = {
    -- Bullet calibers
    ["12 Gauge"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.COMMON
    },
    [".338 Lapua"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.LEGENDARY
    },
    [".44 Magnum"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.RARE
    },
    [".45 ACP"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.COMMON
    },
    ["4.6x30MM"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.RARE
    },
    [".50 AE"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.EPIC
    },
    ["5.45x39MM"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.UNCOMMON
    },
    ["5.56x45MM"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.UNCOMMON
    },
    ["5.7x28MM"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.COMMON
    },
    ["7.62x51MM"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.COMMON
    },
    ["7.62x54MMR"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.RARE
    },
    ["9x17MM"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.RARE
    },
    ["9x18MM"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.EPIC
    },
    ["9x19MM"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.COMMON
    },
    ["9x39MM"] = {
        Type = GM.ResourceTypes.BULLETS,
        Rarity = GM.Rarities.EPIC
    }
}

GM.LootTable.RESOURCES.MAGS = {
    -- Magazines for each weapon
    STANAGmag = {
        Name = "STANAG Magazine",
        Calliber = "5.56x45MM",
        Size = 30,
        Icon = "",
        Model = GM.MagazineModels.AR,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.COMMON
    },
    AKmag = {
        Name = "AK74 Magazine",
        Calliber = "5.45x39MM",
        Size = 30,
        Icon = "",
        Model = GM.MagazineModels.AR,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.COMMON
    },
    G3mag = {
        Name = "G3A3 Magazine",
        Calliber = "7.62x51MM",
        Size = 20,
        Icon = "",
        Model = GM.MagazineModels.BR,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.UNCOMMON
    },
    SCARmag = {
        Name = "SCAR-H Magazine",
        Calliber = "7.62x51MM",
        Size = 20,
        Icon = "",
        Model = GM.MagazineModels.BR,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.RARE
    },
    G36mag = {
        Name = "G36C Magazine",
        Calliber = "5.56x45MM",
        Size = 30,
        Icon = "",
        Model = GM.MagazineModels.AR,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.UNCOMMON
    },
    M14mag = {
        Name = "M14 EBR Magazine",
        Calliber = "7.62x51MM",
        Size = 20,
        Icon = "",
        Model = GM.MagazineModels.BR,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.RARE
    },
    DRAGmag = {
        Name = "Dragunov Magazine",
        Calliber = "7.62x54MMR",
        Size = 10,
        Icon = "",
        Model = GM.MagazineModels.SR,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.EPIC
    },
    AWMmag = {
        Name = "L115 Magazine",
        Calliber = ".338 Lapua",
        Size = 5,
        Icon = "",
        Model = GM.MagazineModels.SR,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.EPIC
    },
    MP5mag = {
        Name = "MP5 Magazine",
        Calliber = "9x19MM",
        Size = 20,
        Icon = "",
        Model = GM.MagazineModels.SMG,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.UNCOMMON
    },
    MP7mag = {
        Name = "MP7 Magazine",
        Calliber = "4.6x30MM",
        Size = 40,
        Icon = "",
        Model = GM.MagazineModels.SMG,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.RARE
    },
    UMPmag = {
        Name = "UMP Magazine",
        Calliber = ".45 ACP",
        Size = 25,
        Icon = "",
        Model = GM.MagazineModels.SMG,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.RARE
    },
    MACmag = {
        Name = "MAC-11 Magazine",
        Calliber = "9x17MM",
        Size = 32,
        Icon = "",
        Model = GM.MagazineModels.SMG,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.EPIC
    },
    MP9mag = {
        Name = "MP9 Magazine",
        Calliber = "9x19MM",
        Size = 30,
        Icon = "",
        Model = GM.MagazineModels.SMG,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.RARE
    },
    VSSmag = {
        Name = "VSS Vintorez Magazine",
        Calliber = "9x39MM",
        Size = 10,
        Icon = "",
        Model = GM.MagazineModels.SMG,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.EPIC
    },
    SAIGAmag = {
        Name = "SAIGA 12K Magazine",
        Calliber = "12 Gauge",
        Size = 5,
        Icon = "",
        Model = GM.MagazineModels.SR,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.EPIC
    },
    DEmag = {
        Name = "Desert Eagle Magazine",
        Calliber = ".50 AE",
        Size = 7,
        Icon = "",
        Model = GM.MagazineModels.PI,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.EPIC
    },
    M1911mag = {
        Name = "M1911 Magazine",
        Calliber = ".45 ACP",
        Size = 7,
        Icon = "",
        Model = GM.MagazineModels.PI,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.UNCOMMON
    },
    P99mag = {
        Name = "P99 Magazine",
        Calliber = "9x19MM",
        Size = 15,
        Icon = "",
        Model = GM.MagazineModels.PI,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.UNCOMMON
    },
    MAKmag = {
        Name = "Makarov Magazine",
        Calliber = "9x18MM",
        Size = 8,
        Icon = "",
        Model = GM.MagazineModels.PI,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.EPIC
    },
    FIVE7mag = {
        Name = "Five-SeveN Magazine",
        Calliber = "5.7x28MM",
        Size = 20,
        Icon = "",
        Model = GM.MagazineModels.PI,
        Type = GM.ResourceTypes.MAGS,
        Rarity = GM.Rarities.RARE
    },
    BOX = {
        Name = "Belt Ammo Box",
        Calliber = "5.56x45MM", --Thankfully there's only 1 LMG to worry about
        Size = 100,
        Icon = "",
        --Model = GM.MagazineModels.
    },
    INTERNAL = {
        Name = "Internal",
        Calliber = "",
        Size = 0,
        Icon = "",
        --Model = GM.MagazineModels.
    }
}

GM.LootTable.RESOURCES.RAW = {
    Wood = {

    },
    Cloth = {

    },
    Metal = {

    }
}

GM.LootTable.RESOURCES.MEDS = {
    Bandage = {
        -- Ends light bleeding
        Name = "Antiseptic Bandage",
        Type = GM.ResourceTypes.MEDS,
        Rarity = GM.Rarities.COMMON,
    },
    Splint = {
        -- Ends fracture
        Name = "Mobilizing Splint",
        Type = GM.ResourceTypes.MEDS,
        Rarity = GM.Rarities.RARE,
    },
    Tourniquet = {
        -- Ends heavy bleeding
        Name = "Hemostatic Tourniquet",
        Type = GM.ResourceTypes.MEDS,
        Rarity = GM.Rarities.UNCOMMON,
    },
    FirstAidKit = {
        -- Ends light bleeding
        -- Ends heavy bleeding
        Name = "First Aid Kit",
        Type = GM.ResourceTypes.MEDS,
        Rarity = GM.Rarities.EPIC,
    },
    SurgicalKit = {
        -- Ends heavy bleeding
        -- Ends fracture
        -- Includes Morphine effects
        Name = "Surgical Kit",
        Type = GM.ResourceTypes.MEDS,
        Rarity = GM.Rarities.LEGENDARY,
    },
    PersonalAidKit = {
        -- Ends light bleeding
        -- Ends heavy bleeding
        -- Ends fracture
        -- Includes Morphine effects
        Name = "Personal Aid Kit",
        Type = GM.ResourceTypes.MEDS,
        Rarity = GM.Rarities.EXOTIC,
    },
    Painkillers = {
        -- Reduces some pain over a long time
        Name = "Painkillers",
        Type = GM.ResourceTypes.MEDS,
        Rarity = GM.Rarities.COMMON,
    },
    Morphine = {
        -- Reduces a lot of pain over a short time
        Name = "Morphine Injector",
        Type = GM.ResourceTypes.MEDS,
        Rarity = GM.Rarities.RARE,
    },
    Epinephrine = { --This is adrenaline
        -- Reduces some pain over a short time
        -- Gives bonuses to physical stats, such as Endurance or Strength
        -- Maybe gives a buff to movement capabilities?
        -- Followed by a debuff?
        Name = "Epinephrine Injector",
        Type = GM.ResourceTypes.MEDS,
        Rarity = GM.Rarities.RARE,
    },
    Adenosine = {
        -- Promotes faster growth of cells in damaged areas IRL - how does that translate mechanically?
        Name = "Adenosine Injector",
        Type = GM.ResourceTypes.MEDS,
        Rarity = GM.Rarities.LEGENDARY,
    },
    RegenStimulant = {
        -- Some funky shit?
        Name = "Regenerative ??? Injector",
        Type = GM.ResourceTypes.MEDS,
        Rarity = GM.Rarities.EXOTIC,
    },
    HydroCoca = {
        -- Injectable Cocaine, strong immediate benefits, but has a chance to cause addictions (which will represent as a longterm debuff)
        Name = "Cocaine Hydrochloride Injector",
        Type = GM.ResourceTypes.MEDS,
        Rarity = GM.Rarities.EPIC,
    }
}