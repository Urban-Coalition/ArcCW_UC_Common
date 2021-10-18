att.PrintName = "40mm Caseless Grenades"
att.AbbrevName = "Caseless"
att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
att.Description = "Russian caseless VOG-25 grenades converted for use in conventional tubes.\nWithout the need to remove an empty case, it can be reloaded faster; but the caseless design also means less propellant and less explosive potential."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Mult_ReloadTime = 0.78
att.Mult_MuzzleVelocity = 0.85
att.Mult_Damage = 0.85
att.Mult_DamageMin = 0.85
--att.Mult_Recoil = 1

att.ActivateElements = {"m79_nade_caseless"}

att.Hook_SelectReloadAnimation = function(wep, anim)
    return anim .. "_caseless"
end