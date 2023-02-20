GM.WeaponStats = {
    ["cw_ar15"] = {
        Slot = 0,
        Damage = 0,
        FireDelay = 0.075,
        Recoil = 1.0,
        HipSpread = 0.10,
        AimSpread = 0.01,
        VelocitySensitivity = 2.0,
        MaxSpreadInc = 0.05,
        SpreadPerShot = 0.0,
        ClumpSpread = 0,
        Shots = 1,
        Primary = {
            ClipSize = 30,
            DefaultClip	= 30
        },
        SpreadCooldown = 0.2,
        SpeedDec = 50,
        ReloadSpeed = 1.1
    }
}

-- What to do about attachment restrictions? Will this same loop setup still work?

hook.Add("InitPostEntity", "Weapon Balance Changes", function()
    for class, statTable in pairs(GAMEMODE.WeaponStats) do
        if weapons.GetStored(class) then
            for stat, val in pairs(statTable) do
                if istable(val) then
                    for subStat, subVal in pairs(val) do
                        print(subStat, subVal, val, statTable)
                        statTable[val][subStat] = subVal
                    end
                else
                    statTable[stat] = val
                end
            end
        end
    end
end)