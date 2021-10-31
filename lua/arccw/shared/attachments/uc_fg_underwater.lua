att.PrintName = "Sealed Bolt"

att.Icon = Material("entities/att/acwatt_uc_sealedbolt.png", "smooth mips")
att.Description = "Watertight modifications that allow the weapon to fire underwater."
att.Desc_Pros = {
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_fg"
att.AutoStats = true
att.SortOrder = 3

att.Override_CanFireUnderwater = true

att.Hook_AddShootSound = function(wep)
    if wep:GetOwner():WaterLevel() >= 3 then
        wep:MyEmitSound("weapons/underwater_explode" .. math.random(3, 4) .. ".wav", 70, math.random(60, 80), 0.5, CHAN_AUTO)
    end
end

att.Hook_PreDoEffects = function(wep)
    if wep:GetOwner():WaterLevel() >= 3 then
        return true
    end
end

att.M_Hook_Mult_ShootPitch = function(wep, data)
    if wep:GetOwner():WaterLevel() >= 3 then
        data.mult = data.mult * 0.6
    end
end