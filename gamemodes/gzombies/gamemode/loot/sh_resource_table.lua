GM.LootTable.RESOURCES = {
    -- Bullet calibers
    ["12 Gauge"] = {

    },
    [".338 Lapua"] = {

    },
    [".44 Magnum"] = {

    },
    [".45 ACP"] = {

    },
    ["4.6x30MM"] = {

    },
    [".50 AE"] = {

    },
    ["5.45x39MM"] = {

    },
    ["5.56x45MM"] = {

    },
    ["5.7x28MM"] = {

    },
    ["7.62x51MM"] = {

    },
    ["7.62x54MMR"] = {

    },
    ["9x17MM"] = {

    },
    ["9x18MM"] = {

    },
    ["9x19MM"] = {

    },
    ["9x39MM"] = {

    },

    -- Magazines for each weapon
    STANAGmag = {
        Name = "STANAG Magazine",
        Calliber = "5.56x45MM",
        Size = 30,
        Icon = "",
        Model = GM.MagazineModels.AR
    },
    AKmag = {
        Name = "AK74 Magazine",
        Calliber = "5.45x39mm",
        Size = 30,
        Icon = "",
        Model = GM.MagazineModels.AR
    },
    G3mag = {
        Name = "G3A3 Magazine",
        Calliber = "7.62x51MM",
        Size = 20,
        Icon = "",
        Model = GM.MagazineModels.BR
    },
    SCARmag = {
        Name = "SCAR-H Magazine",
        Calliber = "7.62x51MM",
        Size = 20,
        Icon = "",
        Model = GM.MagazineModels.BR
    },
    G36mag = {
        Name = "G36C Magazine",
        Calliber = "5.56x45MM",
        Size = 30,
        Icon = "",
        Model = GM.MagazineModels.AR
    },
    M14mag = {
        Name = "M14 EBR Magazine",
        Calliber = "7.62x51MM",
        Size = 20,
        Icon = "",
        Model = GM.MagazineModels.BR
    },
    DRAGmag = {
        Name = "Dragunov Magazine",
        Calliber = "7.62x54MMR",
        Size = 10,
        Icon = "",
        Model = GM.MagazineModels.SR
    },
    AWMmag = {
        Name = "L115 Magazine",
        Calliber = ".338 Lapua",
        Size = 5,
        Icon = "",
        Model = GM.MagazineModels.SR
    },
    MP5mag = {
        Name = "MP5 Magazine",
        Calliber = "9x19MM",
        Size = 20,
        Icon = "",
        Model = GM.MagazineModels.SMG
    },
    MP7mag = {
        Name = "MP7 Magazine",
        Calliber = "4.6x30MM",
        Size = 40,
        Icon = "",
        Model = GM.MagazineModels.SMG
    },
    UMPmag = {
        Name = "UMP Magazine",
        Calliber = ".45 ACP",
        Size = 25,
        Icon = "",
        Model = GM.MagazineModels.SMG
    },
    MACmag = {
        Name = "MAC-11 Magazine",
        Calliber = "9x17MM",
        Size = 32,
        Icon = "",
        Model = GM.MagazineModels.SMG
    },
    MP9mag = {
        Name = "MP9 Magazine",
        Calliber = "9x19MM",
        Size = 30,
        Icon = "",
        Model = GM.MagazineModels.SMG
    },
    VSSmag = {
        Name = "VSS Vintorez Magazine",
        Calliber = "9x39MM",
        Size = 10,
        Icon = "",
        Model = GM.MagazineModels.SMG
    },
    SAIGAmag = {
        Name = "SAIGA 12K Magazine",
        Calliber = "12 Gauge",
        Size = 5,
        Icon = "",
        Model = GM.MagazineModels.SR
    },
    DEmag = {
        Name = "Desert Eagle Magazine",
        Calliber = ".50 AE",
        Size = 7,
        Icon = "",
        Model = GM.MagazineModels.PI
    },
    M1911mag = {
        Name = "M1911 Magazine",
        Calliber = ".45 ACP",
        Size = 7,
        Icon = "",
        Model = GM.MagazineModels.PI
    },
    P99mag = {
        Name = "P99 Magazine",
        Calliber = "9x19MM",
        Size = 15,
        Icon = "",
        Model = GM.MagazineModels.PI
    },
    MAKmag = {
        Name = "Makarov Magazine",
        Calliber = "9x18MM",
        Size = 8,
        Icon = "",
        Model = GM.MagazineModels.PI
    },
    FIVE7mag = {
        Name = "Five-SeveN Magazine",
        Calliber = "5.7x28MM",
        Size = 20,
        Icon = "",
        Model = GM.MagazineModels.PI
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
    },

    -- Raw resources - what raw resources would it make sense to even care about?
    --[[Wood
    Cloth
    Currency -- (could be money or something else)


    -- Medical supplies
    Bandage = { -- Stops bleeding, may need multiple
        Rarity = GM.Rarities.,
    }
    Splint -- Supports fractured/broken bones
    Tourniquet -- Constricts blood flow to body part
    Morphine -- Reduces pain
    Surgical Kit -- Stitches _ wounds closed (regardless of size)
    Personal Aid Kit -- Splint + morpine + surgical kits (essentially a fix-all, should be pretty rare)
    ]]

    --[[
        Types of wounds:
            Abrasians/Scrapes - pain + light pain
            Contusion/Bruise - light pain (gunshots blocked by plates should probably be heavy pain)
            Crush - 
            Cut - 
            Velocity - 
        Ways players will actually end up getting damaged:
            - Falling                       Crush
            - Fire                          Burn/abrasian(?)
            - Explosion                     Contusion + cut
            - Explosion through armor       Contusion
            - Gunshot                       Velocity
            - Gunshot blocked by armor      Contusion
            - Cut                           Cut
            - Bludgeon                      Crush + Contusion
    ]]
}