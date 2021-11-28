hook.Add("Initialize", "ArcCW_Plinking", function()
    game.AddAmmoType({
        name = "plinking",
    })
    if CLIENT then
        language.Add("plinking_ammo", "Plinking Ammo")
    end
end)

ArcCW.UC = {}

ArcCW.UC.BodyDamageMults = {
    [HITGROUP_HEAD] = 3,

    [HITGROUP_CHEST] = 1.1,
    [HITGROUP_STOMACH] = 1,

    [HITGROUP_LEFTARM] = 0.85,
    [HITGROUP_RIGHTARM] = 0.85,

    [HITGROUP_LEFTLEG] = 0.5,
    [HITGROUP_RIGHTLEG] = 0.5,
}