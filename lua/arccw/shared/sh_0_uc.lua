hook.Add("Initialize", "ArcCW_Plinking", function()
    game.AddAmmoType({
        name = "plinking",
    })
    if CLIENT then
        language.Add("plinking_ammo", "Plinking Ammo")
    end
end)

sound.Add( {
    name = "DB_ADD",
    channel = CHAN_AUTO,
    volume = 1.0,
    level = 100,
    sound = {"^arccw_uc/common/db_add_1.ogg", "^arccw_uc/common/db_add_2.ogg", "^arccw_uc/common/db_add_3.ogg"}
} )

game.AddParticles("particles/muzzleflash_dragonsbreath.pcf")
PrecacheParticleSystem("muzzleflash_dragonbreath")

ArcCW.UC = {}

ArcCW.UC.BodyDamageMults = {
    [HITGROUP_HEAD] = 3.5,

    [HITGROUP_CHEST] = 1.15,
    [HITGROUP_STOMACH] = 1,

    [HITGROUP_LEFTARM] = 0.85,
    [HITGROUP_RIGHTARM] = 0.85,

    [HITGROUP_LEFTLEG] = 0.5,
    [HITGROUP_RIGHTLEG] = 0.5,
}

ArcCW.UC.BodyDamageMults_Shotgun = {
    [HITGROUP_HEAD] = 1.5,

    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,

    [HITGROUP_LEFTARM] = 0.85,
    [HITGROUP_RIGHTARM] = 0.85,

    [HITGROUP_LEFTLEG] = 0.5,
    [HITGROUP_RIGHTLEG] = 0.5,
}

ArcCW.UC.RifleAmmoTypes = {
    ["smg1"] = true,
    ["ar2"] = true,
    ["SniperPenetratedRound"] = true
}
ArcCW.UC.PistolAmmoTypes = {
    ["pistol"] = true,
    ["357"] = true,
    ["plinking"] = true
}


ArcCW.UC.StdDmg = {
    -- Pistol/plinking calibers
    ["22lr"] = {
        max = 12,
        min = 7,
        pen = 3
    },
    ["9mm"] = {
        max = 30,
        min = 17,
        pen = 6
    },
    ["10mm"] = {
        max = 35,
        min = 20,
        pen = 8
    },
    ["380acp"] = {
        max = 30,
        min = 15,
        pen = 3
    },
    ["40sw"] = {
        max = 30,
        min = 23,
        pen = 8
    },
    ["45acp"] = {
        max = 45,
        min = 15,
        pen = 9
    },
    ["357sig"] = {
        max = 33,
        min = 17,
        pen = 6
    },

    -- Magnum calibers
    ["357"] = {
        max = 50,
        min = 12,
        pen = 9
    },
    ["44"] = {
        max = 60,
        min = 15,
        pen = 10
    },
    ["50ae"] = {
        max = 70,
        min = 17,
        pen = 12
    },
    ["50beo"] = {
        max = 70,
        min = 20,
        pen = 12
    },

    -- Carbine/rifle calibers
    ["556"] = {
        max = 34,
        min = 20,
        pen = 14
    },
    ["300blk"] = {
        max = 40,
        min = 15,
        pen = 10
    },
    ["545"] = {
        max = 40,
        min = 20,
        pen = 12
    },
    ["762_39"] = { -- 7.62x39, not 7.62x51 NATO
        max = 50,
        min = 25,
        pen = 16
    },
    ["762_51"] = { -- 7.62x51 NATO
        max = 75,
        min = 40,
        pen = 20
    },
    ["366"] = { -- .366 TKM
        max = 60,
        min = 30,
        pen = 18
    },

    -- Shotgun calibers
    ["12g_p"] = { -- Pump
        max = 20,
        min = 13,
        pen = 2
    },
    ["12g_s"] = { -- Semi
        max = 18,
        min = 10,
        pen = 2
    },
    ["410b"] = {
        max = 18,
        min = 5,
        pen = 2
    },

    -- Sniper calibers
    ["338"] = {
        max = 85,
        min = 160,
        pen = 36
    },
    ["300"] = {
        max = 44,
        min = 85,
        pen = 24
    },
    ["50bmg"] = {
        max = 104,
        min = 180,
        pen = 50
    },
}