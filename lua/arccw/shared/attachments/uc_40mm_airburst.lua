att.PrintName = "40mm Airburst Grenades"
att.AbbrevName = "Airburst"
att.Icon = nil
att.Description = "Grenades filled with fragmentation. While usually detonated by a time fuse, this one has been modified to detonate by proximity. Intended for indirect fire, the projectile is slow and has high drag, with a safety fuse to prevent point-blank detonations."
att.Desc_Pros = {
    "uc.40mm.airburst",
}
att.Desc_Cons = {
    "uc.40mm.nodmg",
    "uc.40mm.arm.0.5",
    "uc.40mm.drag.high",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.AutoStats = true

att.Override_ShootEntity = "arccw_uc_40mm_airburst"

att.Mult_MuzzleVelocity = 0.75

--att.ActivateElements = {"m79_nade_incendiary"}