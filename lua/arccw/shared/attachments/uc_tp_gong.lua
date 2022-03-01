att.PrintName = "Action Hero"
att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
att.Description = "Operate the firearm using only one hand. This improves weapon mobility, but accurate fire becomes difficult at best and near impossible at worst.\nBecause accuracy is already out the window, practictioners of this style also opt to shoot while sprinting at full speed."
att.Desc_Pros = {
    "+6% Coolness"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_tp"

att.AutoStats = true
att.SortOrder = 20

att.Override_ShootWhileSprint = true
att.Mult_HipDispersion = 0.75
att.Mult_Recoil = 1.5
att.Mult_RecoilSide = 2.5
att.Mult_SightTime = 1.5
att.Mult_Sway = 2
--att.Mult_MoveDispersion = 2
att.Mult_MoveSpeed = .95

att.LHIK = true
att.LHIKHide = true
att.Override_HoldtypeActive = "pistol"
att.Override_HoltypeActive_Priority = 999
att.Override_HoldtypeSights = "pistol"
att.Override_HoltypeSights_Priority = 999
att.Override_HoldtypeHolstered = "normal"

att.Hook_Compatible = function(wep, data)
    if wep:GetIsManualAction() and wep:GetBuff("HoldtypeActive") ~= "pistol" and wep:GetBuff("HoldtypeActive") ~= "revolver" then return false end
end