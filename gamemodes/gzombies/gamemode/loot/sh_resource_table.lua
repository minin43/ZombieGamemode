GM.LootTable.RESOURCES = {
    -- Bullet calibers
    ["12 Gauge"] = {

    }
    [".338 Lapua"]
    [".44 Magnum"]
    [".45 ACP"]
    ["4.6x30MM"]
    [".50 AE"]
    ["5.45x39MM"]
    ["5.56x45MM"]
    ["5.7x28MM"]
    ["7.62x51MM"]
    ["7.62x54MMR"]
    ["9x17MM"]
    ["9x18MM"]
    ["9x19MM"]
    ["9x39MM"]

    -- Magazines for each weapon
    STANAGmag = {
        Calliber = "5.56x45MM",
        Size = 30
    }
    AKmag
    G3mag
    SCARmag
    G36mag
    M14mag
    DRAGmag
    AWMmag
    MP5mag
    MP7mag
    UMPmag
    MACmag
    MP9mag
    VSSmag
    SAIGAmag
    DEmag
    M1911mag
    P99mag
    MAKmag
    FIVE7mag
    BOX
    INTERNAL

    -- Raw resources - what raw resources would it make sense to even care about?
    Wood
    Cloth
    Currency -- (could be money or something else)


    -- Medical supplies
    Bandage = { -- Stops bleeding, may need multiple
        Rarity = GAMEMODE.Rarities.,
    }
    Splint -- Supports fractured/broken bones
    Tourniquet -- Constricts blood flow to body part
    Morphine -- Reduces pain
    Surgical Kit -- Stitches _ wounds closed (regardless of size)
    Personal Aid Kit -- Splint + morpine + surgical kits (essentially a fix-all, should be pretty rare)

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