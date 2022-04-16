GM.LootTable.WEAPONS = {
    -- Weapons
    gz_ar15 = {
        Base = "cw_ar15",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.RARE,
        Caliber = "5.56x45MM",              -- Bullet penetration is calculated using bullet caliber + barrel length
        Barrel = GAMEMODE.Barrels.RIFLE,    -- We'll calculated dynamically to allow for future impementation of additional bullet types (FMJ, for example)
        Mag = GAMEMODE.LootTable.RESOURCES.STANAGmag,
    }
    gz_ak74 = {
        Base = "cw_ak74",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.RARE,
        Caliber = "5.45x39MM",
        Barrel = GAMEMODE.Barrels.RIFLE,
        Mag = GAMEMODE.LootTable.RESOURCES.AKmag,
    }
    gz_g3a3 = {
        Base = "cw_g3a3",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.EPIC,
        Caliber = "7.62x51MM",
        Barrel = GAMEMODE.Barrels.RIFLE,
        Mag = GAMEMODE.LootTable.RESOURCES.G3mag,
    }
    gz_famas = {
        Base = "cw_famasg2_official",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.RARE,
        Caliber = "5.56x45MM",
        Barrel = GAMEMODE.Barrels.RIFLE,
        Mag = GAMEMODE.LootTable.RESOURCES.STANAGmag,
    }
    gz_scar = {
        Base = "cw_scarh",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.EPIC,
        Caliber = "7.62x51MM",
        Barrel = GAMEMODE.Barrels.RIFLE,
        Mag = GAMEMODE.LootTable.RESOURCES.SCARmag,
    }
    gz_g36c = {
        Base = "cw_g36c",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.RARE,
        Caliber = "5.56x45MM",
        Barrel = GAMEMODE.Barrels.RIFLE,
        Mag = GAMEMODE.LootTable.RESOURCES.G36mag,
    }
    gz_l85a2 = {
        Base = "cw_l85a2",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.RARE,
        Caliber = "5.56x45MM",
        Barrel = GAMEMODE.Barrels.RIFLE,
        Mag = GAMEMODE.LootTable.RESOURCES.STANAGmag,
    }
    gz_m14 = {
        Base = "cw_m14",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.LEGENDARY,
        Caliber = "7.62x51MM",
        Barrel = GAMEMODE.Barrels.RIFLE,
        Mag = GAMEMODE.LootTable.RESOURCES.M14mag,
    }
    gz_svd = {
        Base = "cw_svd_official",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.LEGENDARY,
        Caliber = "7.62x54MMR",
        Barrel = GAMEMODE.Barrels.LONG_RIFLE,
        Mag = GAMEMODE.LootTable.RESOURCES.DRAGmag,
    }
    gz_l115 = {
        Base = "cw_l115",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.LEGENDARY,
        Caliber = ".338 Lapua",
        Barrel = GAMEMODE.Barrels.LONG_RIFLE,
        Mag = GAMEMODE.LootTable.RESOURCES.AWMmag,
    }
    gz_mp5 = {
        Base = "cw_mp5",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.UNCOMMON,
        Caliber = "9x19MM",
        Barrel = GAMEMODE.Barrels.SMG,
        Mag = GAMEMODE.LootTable.RESOURCES.MP5mag,
    }
    gz_mp7 = {
        Base = "cw_mp7_official",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.EPIC,
        Caliber = "4.6x30MM",
        Barrel = GAMEMODE.Barrels.SMG,
        Mag = GAMEMODE.LootTable.RESOURCES.MP7mag,
    }
    gz_ump = {
        Base = "cw_ump45",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.UNCOMMON,
        Caliber = ".45 ACP",
        Barrel = GAMEMODE.Barrels.SMG,
        Mag = GAMEMODE.LootTable.RESOURCES.UMPmag,
    }
    gz_mac = {
        Base = "cw_mac11",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.COMMON,
        Caliber = "9x17MM",
        Barrel = GAMEMODE.Barrels.PISTOL,
        Mag = GAMEMODE.LootTable.RESOURCES.MACmag,
    }
    gz_mp9 = {
        Base = "cw_mp9_official",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.UNCOMMON,
        Caliber = "9x19MM",
        Barrel = GAMEMODE.Barrels.PISTOL,
        Mag = GAMEMODE.LootTable.RESOURCES.MP9mag,
    }
    gz_vss = {
        Base = "cw_vss",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.RARE,
        Caliber = "9x39MM",
        Barrel = GAMEMODE.Barrels.RIFLE, --It's actually between an SMG and a rifle but I don't want to make a category for just this gun
        Mag = GAMEMODE.LootTable.RESOURCES.VSSmag,
    }
    gz_m249 = {
        Base = "cw_m249",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.EPIC,
        Caliber = "5.56x45MM",
        Barrel = GAMEMODE.Barrels.RIFLE,
        Mag = GAMEMODE.LootTable.RESOURCES.BOX,
    }
    gz_m3s90 = {
        Base = "cw_m3super90",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.UNCOMMON,
        Caliber = "12 Gauge",
        Barrel = GAMEMODE.Barrels.RIFLE,
        Mag = "Internal",
    }
    gz_m4s90 = {
        Base = "cw_xm1014_official",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.RARE,
        Caliber = "12 Gauge",
        Barrel = GAMEMODE.Barrels.RIFLE,
        Mag = "Internal",
    }
    gz_saiga = {
        Base = "cw_saiga12k_official",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.EPIC,
        Caliber = "12 Gauge",
        Barrel = GAMEMODE.Barrels.SMG,
        Mag = GAMEMODE.LootTable.RESOURCES.SAIGAmag,
    }
    gz_shorty = {
        Base = "cw_shorty",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.UNCOMMON,
        Caliber = "12 Gauge",
        Barrel = GAMEMODE.Barrels.PISTOL,
        Mag = "Internal",
    }
    gz_deagle = {
        Base = "cw_deagle",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.RARE,
        Caliber = ".50 AE",
        Barrel = GAMEMODE.Barrels.PISTOL,
        Mag = GAMEMODE.LootTable.RESOURCES.DEmag,
    }
    gz_mr96 = {
        Base = "cw_mr96",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.UNCOMMON,
        Caliber = ".44 Magnum",
        Barrel = GAMEMODE.Barrels.PISTOL,
        Mag = "Internal",
    }
    gz_m1911 = {
        Base = "cw_m1911",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.COMMON,
        Caliber = ".45 ACP",
        Barrel = GAMEMODE.Barrels.PISTOL,
        Mag = GAMEMODE.LootTable.RESOURCES.M1911mag,
    }
    gz_p99 = {
        Base = "cw_p99",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.COMMON,
        Caliber = "9x19MM",
        Barrel = GAMEMODE.Barrels.MINI,
        Mag = GAMEMODE.LootTable.RESOURCES.P99mag,
    }
    gz_pm = {
        Base = "cw_makarov",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.COMMON,
        Caliber = "9x18MM",
        Barrel = GAMEMODE.Barrels.MINI,
        Mag = GAMEMODE.LootTable.RESOURCES.MAKmag,
    }
    gz_57 = {
        Base = "cw_fiveseven",
        Type = GAMEMODE.WeaponTypes.GUN,
        Rarity = GAMEMODE.Rarities.UNCOMMON,
        Caliber = "5.7x28MM",
        Barrel = GAMEMODE.Barrels.PISTOL,
        Mag = GAMEMODE.LootTable.RESOURCES.FIVE7mag,
    }

    -- General Attachments, can be hot-swapped
    gz_kobra = {
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
    gz_insight_x2
    

    -- Weapon-specific, these can only be changed outside of a game instance
    gz_foldsight
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
    gz_sr3m
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

    -- Melee
    gz_knife -- Probably the only one?
}