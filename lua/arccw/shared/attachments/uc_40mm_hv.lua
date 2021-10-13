att.PrintName = "40mm High Velocity Grenades"
att.AbbrevName = "High Velocity"
att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
att.Description = "Fin-stabilized, lightweight grenade with explosive payload.\nFlies fast and with low drag, but creates a smaller and less lethal explosion."
att.Desc_Pros = {
    "uc.40mm.drag.low"
}
att.Desc_Cons = {
    "uc.40mm.blast.low"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.Override_ShootEntity = "arccw_uc_40mm_hv"

att.AutoStats = true

att.Mult_Damage = 0.7
att.Mult_DamageMin = 0.7

att.Mult_MuzzleVelocity = 1.5

-- att.ActivateElements = {"m79_nade_caseless"}