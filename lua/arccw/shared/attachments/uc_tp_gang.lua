att.PrintName = "Homeboy"
-- BANDIT STYLE IS BACK, BABY
att.Icon = nil -- Material("entities/att/acwatt_lowpolysaiga12extmag.png", "smooth mips")
att.Description = "GANGSTAS ROLL UP IN DA HOOD, POP POP POP POP POP [-----], I BALL HARD STICK A GLOCK UP IN YOUR FACE [-----], DROP DROP DROP DROP DROP GO YOUR HOMIES [-----]"
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
    "uc.homeboy"
}
att.Slot = "uc_tp"

att.AutoStats = true
att.SortOrder = 14

--[[]
att.Mult_HipDispersion = 0.5
att.Mult_RecoilSide = 1.25
att.Mult_SightTime = 1.75
att.Mult_Sway = 1.5
]]

att.Mult_HipDispersion = 0.85
att.Mult_MoveDispersion = 0.75

att.LHIK = true
att.LHIKHide = true

att.Override_ActivePos = Vector(1, 0, 1)
att.Override_ActiveAng = Angle(0, 0, -60)

att.Override_ActivePos_Priority = 15
att.Override_ActiveAng_Priority = 15

att.Override_RecoilDirection = Angle(0.707, -0.707, 0)
att.Override_RecoilDirectionSide = Angle(0.707, 0.707, 0)

att.Override_AddSightRoll = -45

att.Hook_Compatible = function(wep, data)
    if wep:GetIsManualAction() and wep:GetBuff("HoldtypeActive") ~= "pistol" and wep:GetBuff("HoldtypeActive") ~= "revolver" then return false end
end