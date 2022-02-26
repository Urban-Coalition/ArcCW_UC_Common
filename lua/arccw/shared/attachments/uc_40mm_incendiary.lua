att.PrintName = "40mm Incendiary Grenades" -- trol
att.AbbrevName = "Incendiary"
att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
att.Description = "Hand-made grenades loaded with a fuel mixture that disperses on impact, burning an area over time."
att.Desc_Pros = {
    "uc.40mm.incendiary"
}
att.Desc_Cons = {
    "uc.40mm.mindmg"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Override_ShootEntity = "arccw_uc_40mm_incendiary"

--att.Mult_Recoil = 1

att.ActivateElements = {"40mm_incendiary"}

att.Hook_AddShootSound = function(wep, data)
    wep:EmitSound("DB_ADD",data.volume,data.pitch,1,CHAN_WEAPON - 1) -- lua/arccw/shared/sh_0_uc.lua
end