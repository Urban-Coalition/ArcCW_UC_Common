att.PrintName = "\"MAG\" #000 Magnum Buckshot"
att.AbbrevName = "\"MAG\" #000 Buckshot"

att.SortOrder = 5
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[Buckshot load using fewer, larger diameter shots and a more intense powder load. This ammo type is particularly effective up close, but its energy fizzles out quickly.]]
att.Desc_Pros = {
}
att.Desc_Cons = {
    "uc.pellet.0.75",
    "uc.accuracy.10",
}
att.Desc_Neutrals = {
}
att.Slot = {"ud_ammo_shotgun","uc_ammo"}

att.AutoStats = true

att.Mult_Num = 0.75
att.Mult_Damage = 1.25

att.Mult_Range = 0.75
att.Mult_RangeMin = 2

att.Mult_Recoil = 1.3
att.Add_AccuracyMOA = 10

-- it's payday, fellas
att.Add_HullSize = 0.5

att.Override_UC_ShellColor = Color(0.8*255, 0.8*255, 0.8*255)

att.Hook_Compatible = function(wep)
    if !wep:GetIsShotgun() then
        return false
    end
end