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

game.AddParticles("particles/uo_explosions_fas2.pcf")
PrecacheParticleSystem("explosion_HE_m79_fas2")
PrecacheParticleSystem("explosion_he_grenade_fas2")
PrecacheParticleSystem("explosion_HE_claymore_fas2")
PrecacheParticleSystem("explosion_grenade_fas2")

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
        pen = 3,
        vel = 330
    },
    ["9mm"] = {
        max = 30,
        min = 17,
        pen = 6,
        vel = 380
    },
    ["10mm"] = {
        max = 35,
        min = 20,
        pen = 8,
        vel = 400
    },
    ["380acp"] = {
        max = 30,
        min = 15,
        pen = 3,
        vel = 390
    },
    ["40sw"] = {
        max = 30,
        min = 23,
        pen = 8,
        vel = 340
    },
    ["45acp"] = {
        max = 45,
        min = 15,
        pen = 9,
        vel = 250
    },
    ["357sig"] = {
        max = 33,
        min = 17,
        pen = 6,
        vel = 440
    },

    -- Magnum calibers
    ["357"] = {
        max = 50,
        min = 12,
        pen = 9,
        vel = 430
    },
    ["44"] = {
        max = 60,
        min = 15,
        pen = 10,
        vel = 360
    },
    ["50ae"] = {
        max = 70,
        min = 17,
        pen = 12,
        vel = 450
    },
    ["50beo"] = {
        max = 70,
        min = 20,
        pen = 12,
        vel = 540
    },

    -- Carbine/rifle calibers
    ["556"] = {
        max = 34,
        min = 20,
        pen = 14,
        vel = 910
    },
    ["300blk"] = {
        max = 40,
        min = 15,
        pen = 10,
        vel = 310
    },
    ["545"] = {
        max = 40,
        min = 20,
        pen = 12,
        vel = 880
    },
    ["762_39"] = { -- 7.62x39, not 7.62x51 NATO
        max = 50,
        min = 25,
        pen = 16,
        vel = 730
    },
    ["762_51"] = { -- 7.62x51 NATO
        max = 75,
        min = 40,
        pen = 20,
        vel = 850
    },
    ["366"] = { -- .366 TKM
        max = 60,
        min = 30,
        pen = 18,
        vel = 600
    },

    -- Shotgun calibers
    ["12g_p"] = { -- Pump
        max = 20,
        min = 13,
        pen = 2,
        vel = 400
    },
    ["12g_s"] = { -- Semi
        max = 18,
        min = 10,
        pen = 2,
        vel = 400
    },
    ["410b"] = {
        max = 18,
        min = 5,
        pen = 2,
        vel = 400
    },

    -- Sniper calibers
    ["338"] = {
        max = 85,
        min = 160,
        pen = 36,
        vel = 1000
    },
    ["300"] = {
        max = 44,
        min = 85,
        pen = 24,
        vel = 950
    },
    ["50bmg"] = {
        max = 104,
        min = 180,
        pen = 46,
        vel = 920
    },
}
