att.PrintName = "Dual-Stage Trigger"

att.Icon = Material("entities/att/arccw_uc_dualstagetrigger.png", "mips smooth")
att.Description = "A heavy trigger with a semi-automatic middle stage and a fully-automatic end stage. Can shoot semi- and fully- automatically without the need for switching a fire selector."
att.Desc_Pros = {
    "uc.dualstage.pro"
}
att.Desc_Cons = {
    "uc.dualstage.con"
}
att.Desc_Neutrals = {
}
att.Slot = "uc_fg"
att.AutoStats = true

att.Hook_Compatible = function(wep)
    if wep:GetIsManualAction() then
        return false
    end
end
att.SortOrder = 2

att.Hook_Compatible = function(wep)
    if wep:GetIsManualAction() then
        return false
    end
    for i, v in pairs(wep.Firemodes) do
        if !v then continue end
        if v.Mode and v.Mode != 1 and v.Mode != 0 then
            return
        end
    end
    return false
end

--att.Override_ShotRecoilTable = {0.7}

att.Mult_RPM = 1.1
att.Mult_TriggerDelayTime = 0

function att.Hook_ModifyRPM(wep, delay)
    if wep:GetCurrentFiremode().Mode != 1 and (!wep:GetOwner():IsPlayer() or wep:GetOwner():KeyDown(IN_ATTACK))
            and wep:GetBurstCount() == 0 then -- wep:GetState() != ArcCW.STATE_CUSTOMIZE
        return delay + 0.1
    end
end

function att.Hook_Think(wep)
    if wep:GetOwner():IsPlayer() and wep:GetOwner():KeyReleased(IN_ATTACK) and wep:GetBurstCount() == 0 and IsFirstTimePredicted() then
        wep:SetNextPrimaryFire((wep.TriggerDownTime or CurTime()) + wep:GetFiringDelay())
    elseif wep:GetOwner():IsPlayer() and wep:GetOwner():KeyPressed(IN_ATTACK) and wep:GetBurstCount() == 0 and IsFirstTimePredicted() then
        wep.TriggerDownTime = CurTime()
    end
end

att.AttachSound = "arccw_uc/common/gunsmith/internal_modification.ogg"