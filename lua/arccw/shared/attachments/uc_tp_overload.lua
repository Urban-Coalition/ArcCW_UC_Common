att.PrintName = "Overload"

att.Icon = Material("entities/att/arccw_uc_tp_overload.png", "smooth mips")
att.Description = "With a little grease and some physical force, most magazines can be made to accept an extra round."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_tp"

att.AutoStats = true
att.SortOrder = 8

att.Add_ClipSize = 1

att.Hook_Compatible = function(wep)
    if wep.RejectMagSizeChange or wep:GetCapacity() == 1 then return false end
end