att.PrintName = "\"BLNK\" Blank Cartridges"
att.AbbrevName = "\"BLNK\" Blanks"
att.SortOrder = -2
att.Icon = Material("entities/att/arccw_uc_ammo_blank.png", "mips smooth")
att.Description = [[Cartridges sealed without a solid projectile. Performance is otherwise identical. Used when the muzzle report of a gunshot is necessary without the bullet, such as in filming, ceremonies, sports, and combat training.

In real life, blanks are not harmless. The muzzle shockwave or discharged wadding can and have killed people who do not exercise standard firearm precautions.]]
att.Desc_Pros = {
    "uc.infiniteammo"
}
att.Desc_Cons = {
    "uc.noprojectile"
}
att.Desc_Neutrals = {
}
att.Slot = {"uc_ammo","ud_ammo_shotgun"}

att.SortOrder = -9001
att.AutoStats = true

att.Override_Num = 0
att.Override_Num_Priority = 9001
att.Override_InfiniteAmmo = true

att.Override_UC_ShellColor = Color(0.3 * 255, 0.3 * 255, 0.3 * 255)
