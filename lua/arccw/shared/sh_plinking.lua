hook.Add("Initialize", "ArcCW_Plinking", function()
    game.AddAmmoType({
        name = "plinking",
    })
    if CLIENT then
        language.Add("plinking_ammo", "Plinking Ammo")
    end
end)