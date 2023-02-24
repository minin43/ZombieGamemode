GM.LootTable.WEAPONS = GM.LootTable.WEAPONS or {}

GM.LootTable.WEAPONS.Guns = {
    -- Weapons
    gz_ar15 = {
        Base = "cw_ar15",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.RARE,
        Caliber = "5.56x45MM",              -- Bullet penetration is calculated using bullet caliber + barrel length
        Barrel = GM.Barrels.RIFLE,    -- We'll calculated dynamically to allow for future impementation of additional bullet types (FMJ, for example)
        Mag = GM.LootTable.RESOURCES.STANAGmag,
    },
    gz_ak74 = {
        Base = "cw_ak74",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.RARE,
        Caliber = "5.45x39MM",
        Barrel = GM.Barrels.RIFLE,
        Mag = GM.LootTable.RESOURCES.AKmag,
    },
    gz_g3a3 = {
        Base = "cw_g3a3",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.EPIC,
        Caliber = "7.62x51MM",
        Barrel = GM.Barrels.RIFLE,
        Mag = GM.LootTable.RESOURCES.G3mag,
    },
    gz_famas = {
        Base = "cw_famasg2_official",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.RARE,
        Caliber = "5.56x45MM",
        Barrel = GM.Barrels.RIFLE,
        Mag = GM.LootTable.RESOURCES.STANAGmag,
    },
    gz_scar = {
        Base = "cw_scarh",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.EPIC,
        Caliber = "7.62x51MM",
        Barrel = GM.Barrels.RIFLE,
        Mag = GM.LootTable.RESOURCES.SCARmag,
    },
    gz_g36c = {
        Base = "cw_g36c",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.RARE,
        Caliber = "5.56x45MM",
        Barrel = GM.Barrels.RIFLE,
        Mag = GM.LootTable.RESOURCES.G36mag,
    },
    gz_l85a2 = {
        Base = "cw_l85a2",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.RARE,
        Caliber = "5.56x45MM",
        Barrel = GM.Barrels.RIFLE,
        Mag = GM.LootTable.RESOURCES.STANAGmag,
    },
    gz_m14 = {
        Base = "cw_m14",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.LEGENDARY,
        Caliber = "7.62x51MM",
        Barrel = GM.Barrels.RIFLE,
        Mag = GM.LootTable.RESOURCES.M14mag,
    },
    gz_svd = {
        Base = "cw_svd_official",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.LEGENDARY,
        Caliber = "7.62x54MMR",
        Barrel = GM.Barrels.LONG_RIFLE,
        Mag = GM.LootTable.RESOURCES.DRAGmag,
    },
    gz_l115 = {
        Base = "cw_l115",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.LEGENDARY,
        Caliber = ".338 Lapua",
        Barrel = GM.Barrels.LONG_RIFLE,
        Mag = GM.LootTable.RESOURCES.AWMmag,
    },
    gz_mp5 = {
        Base = "cw_mp5",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.UNCOMMON,
        Caliber = "9x19MM",
        Barrel = GM.Barrels.SMG,
        Mag = GM.LootTable.RESOURCES.MP5mag,
    },
    gz_mp7 = {
        Base = "cw_mp7_official",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.EPIC,
        Caliber = "4.6x30MM",
        Barrel = GM.Barrels.SMG,
        Mag = GM.LootTable.RESOURCES.MP7mag,
    },
    gz_ump = {
        Base = "cw_ump45",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.UNCOMMON,
        Caliber = ".45 ACP",
        Barrel = GM.Barrels.SMG,
        Mag = GM.LootTable.RESOURCES.UMPmag,
    },
    gz_mac = {
        Base = "cw_mac11",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.COMMON,
        Caliber = "9x17MM",
        Barrel = GM.Barrels.PISTOL,
        Mag = GM.LootTable.RESOURCES.MACmag,
    },
    gz_mp9 = {
        Base = "cw_mp9_official",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.UNCOMMON,
        Caliber = "9x19MM",
        Barrel = GM.Barrels.PISTOL,
        Mag = GM.LootTable.RESOURCES.MP9mag,
    },
    gz_vss = {
        Base = "cw_vss",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.RARE,
        Caliber = "9x39MM",
        Barrel = GM.Barrels.RIFLE, --It's actually between an SMG and a rifle but I don't want to make a category for just this gun
        Mag = GM.LootTable.RESOURCES.VSSmag,
    },
    gz_m249 = {
        Base = "cw_m249",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.EPIC,
        Caliber = "5.56x45MM",
        Barrel = GM.Barrels.RIFLE,
        Mag = GM.LootTable.RESOURCES.BOX,
    },
    gz_m3s90 = {
        Base = "cw_m3super90",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.UNCOMMON,
        Caliber = "12 Gauge",
        Barrel = GM.Barrels.RIFLE,
        Mag = "Internal",
    },
    gz_m4s90 = {
        Base = "cw_xm1014_official",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.RARE,
        Caliber = "12 Gauge",
        Barrel = GM.Barrels.RIFLE,
        Mag = "Internal",
    },
    gz_saiga = {
        Base = "cw_saiga12k_official",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.EPIC,
        Caliber = "12 Gauge",
        Barrel = GM.Barrels.SMG,
        Mag = GM.LootTable.RESOURCES.SAIGAmag,
    },
    gz_shorty = {
        Base = "cw_shorty",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.UNCOMMON,
        Caliber = "12 Gauge",
        Barrel = GM.Barrels.PISTOL,
        Mag = "Internal",
    },
    gz_deagle = {
        Base = "cw_deagle",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.RARE,
        Caliber = ".50 AE",
        Barrel = GM.Barrels.PISTOL,
        Mag = GM.LootTable.RESOURCES.DEmag,
    },
    gz_mr96 = {
        Base = "cw_mr96",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.UNCOMMON,
        Caliber = ".44 Magnum",
        Barrel = GM.Barrels.PISTOL,
        Mag = "Internal",
    },
    gz_m1911 = {
        Base = "cw_m1911",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.COMMON,
        Caliber = ".45 ACP",
        Barrel = GM.Barrels.PISTOL,
        Mag = GM.LootTable.RESOURCES.M1911mag,
    },
    gz_p99 = {
        Base = "cw_p99",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.COMMON,
        Caliber = "9x19MM",
        Barrel = GM.Barrels.MINI,
        Mag = GM.LootTable.RESOURCES.P99mag,
    },
    gz_pm = {
        Base = "cw_makarov",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.COMMON,
        Caliber = "9x18MM",
        Barrel = GM.Barrels.MINI,
        Mag = GM.LootTable.RESOURCES.MAKmag,
    },
    gz_57 = {
        Base = "cw_fiveseven",
        Type = GM.WeaponTypes.GUN,
        Rarity = GM.Rarities.UNCOMMON,
        Caliber = "5.7x28MM",
        Barrel = GM.Barrels.PISTOL,
        Mag = GM.LootTable.RESOURCES.FIVE7mag,
    }
}

GM.LootTable.WEAPONS.Attachments = {
    -- General Attachments, can be hot-swapped
    --[[gz_kobra = {
        Base = "",
        Spawnable = true,
    }
    gz_eotech
    gz_aimpoint
    gz_schmidt_shortdot
    gz_pso1
    gz_acog
    gz_nightforce_nxs
    gz_microt1
    gz_sg1scope -- only bg_ attach here
    gz_pbs1
    gz_saker
    gz_tundra9mm
    gz_foregrip
    gz_bipod
    gz_m203
    gz_anpeq15
    gz_insight_x2]]
    

    -- Weapon-specific, these can only be changed outside of a game instance
    --[[gz_foldsight
    gz_deagle_compensator
    gz_deagle_extendedbarrel
    gz_regularbarrel
    gz_longbarrelmr96
    gz_mac11_extended_barrel
    gz_ak74_rpkbarrel
    gz_ak74_ubarrel
    gz_magpulhandguard
    gz_longbarrel
    gz_ris
    gz_longris
    gz_mp5_kbarrel
    gz_mp5_sdbarrel
    gz_ak74foldablestock
    gz_ak74heavystock
    gz_ar15sturdystock
    gz_ar15heavystock
    gz_vss_foldable_stock
    gz_makarov_pb6p9
    gz_asval
    gz_sr3m]]
    --[[
        To be disabled:, for potential future utilization
        bg_ak74rpkmag
        am_magnum
        am_matchgrade
        am_reducedpowderload
        bg_ar1560rndmag
        md_cmag_556_official
        md_cmag_556_official
        bg_mp530rndmag
        bg_retractablestock
        bg_nostock
        am_slugrounds
        am_flechetterounds
        bg_mac11_unfolded_stock
        bg_makarov_pm_suppressor
        bg_makarov_pb_suppressor
        bg_makarov_extmag
        am_sp7
        bg_mp7_unsuppressed
        am_ultramegamatchammo
        bg_asval_20rnd
        bg_asval_30rnd
    ]]
}

GM.LootTable.WEAPONS.Melee = {
    -- Melee
    --gz_knife -- Probably the only one?
}