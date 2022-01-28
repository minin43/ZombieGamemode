GM.LootTable.RESOURCES = {
    -- Bullet calibers
    5x56
    7x62

    -- Magazines for each weapon (need further research on shared magazines between guns)
    Ar15mag = {

    }


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