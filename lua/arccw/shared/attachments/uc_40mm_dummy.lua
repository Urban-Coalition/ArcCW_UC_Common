att.PrintName = "40mm Dummy Grenades"
att.AbbrevName = "Dummy"
att.Icon = Material("entities/att/arccw_uc_40mm_generic.png", "mips smooth")
att.Description = "Non-lethal grenades with an empty ceramic shell.\nUsed for target practice, the grenade has a noticable trail and paints its impact point with blue chalk."
att.Desc_Pros = {
    "uc.infiniteammo"
}
att.Desc_Cons = {
    "uc.40mm.nodmg",
}
att.Desc_Neutrals = {
}
att.Slot = "uc_40mm"

att.SortOrder = -9001

att.AutoStats = true

att.Override_ShootEntity = "arccw_uc_40mm_dummy"

att.ActivateElements = {"40mm_dummy"}

att.Mult_VisualRecoil = 0.5
att.Mult_Recoil = 0.5
att.Mult_ReloadTime = 0.8
att.Override_InfiniteAmmo = true