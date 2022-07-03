att.PrintName = "Subsonic"

att.SortOrder = 17
att.Icon = Material("entities/att/acwatt_uc_powder_subsonic.png", "smooth mips")
att.Description = [[Powder load low enough to make the bullet travel slower than the speed of sound. This reduces range significantly, but makes gunfire very comfortable and quiet (comparatively speaking).
The sonic boom typical of the round is eliminated, rendering it even more silent than usual with a suppressed firearm.]]
att.Desc_Pros = {
    "pro.invistracers",
    -- "uc.subsonic"
}
att.Desc_Cons = {
}
att.Desc_Neutrals = {
}
att.Slot = "uc_powder"

att.AutoStats = true

att.Mult_RecoilSide = 0.75
att.Mult_Recoil = 0.8
att.Mult_RangeMin = 0.75
att.Mult_Range = 0.7

att.Mult_RPM = 0.89
att.Mult_ShootVol = 0.8
--att.Mult_ShootPitch = 1.1 please don't

att.Override_PhysTracerProfile = 7
att.Override_TracerNum = 0

att.Mult_MalfunctionMean = 1.3
att.Mult_PhysBulletMuzzleVelocity = 0.75

-- att.Hook_GetDistantShootSound = function(wep, distancesound)
--     if distancesound == wep.DistantShootSoundSilenced then
--         return false
--     end
-- end

att.GivesFlags = {"powder_subsonic"}
att.ExcludeFlags = {"cal_subsonic"}