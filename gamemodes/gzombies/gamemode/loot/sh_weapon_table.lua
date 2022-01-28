GM.LootTable.WEAPONS = {
    -- Weapons
    gz_ar15 = {
        Base = "cw_",
        Type = GAMEMODE.WeaponTypes.,
        Rarity = GAMEMODE.Rarities.,
        Caliber = , -- Bullet penetration is calculated using bullet caliber + barrel length
        Barrel = ,  -- We'll calculated dynamically to allow for future impementation of additional bullet types (FMJ, for example)
        Mag = ,
    }
    gz_ak74
    gz_g3a3
    gz_famas
    gz_scar
    gz_g36c
    gz_l85a2
    gz_m14
    gz_svd
    gz_l115
    gz_mp5
    gz_mp7
    gz_ump
    gz_mac
    gz_mp9
    gz_vss
    gz_m249
    gz_m3s90
    gz_m4s90
    gz_saiga
    gz_shorty
    gz_deagle
    gz_mr96
    gz_m1911
    gz_p99
    gz_makarov --?
    gz_57

    -- Attachments
    gz_eotech
    gz_microt1
    gz_acog
    -- etc

    -- Melee
    gz_knife -- Probably the only one?

    GenerateLootTable = function()

    end

    GenerateRandomLoot = function()
        -- If we pull a gun, should be a small chance it already has attachments
        -- If we pull a gun, do we need to change its ammo type on the fly? OR should be done in weapons/sh_balancing?
    end
}