att.PrintName = "\"CNFT\" Confetti"
att.Icon = Material("entities/att/arccw_uc_ammo_shotgun_generic.png", "mips smooth")
att.Description = [[Joke ammunition filled with tiny pieces of colorful paper. Produces a celebratory puff instead of anything reasonably lethal, allowing your weapon to double as a party popper.

Shotguns are truly the most versatile firearms.]]
att.Desc_Pros = {
    "uc.confetti",
    "uc.infiniteammo"
}
att.Desc_Cons = {
    "uc.noprojectile"
}
att.Desc_Neutrals = {
    "uc.manualonly"
}
att.Slot = {"ud_ammo_shotgun","uc_ammo"}
att.ActivateElements = {"uc_manualonly"}
att.SortOrder = -9001
att.AutoStats = true

att.NotForNPCs = true
att.Mult_Recoil = .2
att.Override_Num = 0
att.Override_Num_Priority = 9001
att.Override_InfiniteAmmo = true


local path = ")^arccw_uc/common/"
att.Hook_GetShootSound = function(wep, fsound)
    if fsound == wep.ShootSound or fsound == wep.FirstShootSound then return {path .. "confetti-01.ogg", path .. "confetti-02.ogg", path .. "confetti-03.ogg", path .. "confetti-04.ogg", path .. "confetti-05.ogg", path .. "confetti-06.ogg"} end
    --if fsound == wep.ShootSoundSilenced then return path .. "confetti_sup.ogg" end
end
att.Hook_GetDistantShootSound = function(wep, distancesound)
    if distancesound == wep.DistantShootSound then return false
    end
end
att.UC_NoInnyOuty = true

att.Hook_AddShootSound = function(wep, data)
    -- wep:EmitSound("garrysmod/balloon_pop_cute.wav", data.volume,data.pitch * math.random(80,115) / 100,1,CHAN_WEAPON - 1)

    local owner = wep:GetOwner()
    local effectdata = EffectData()
	effectdata:SetOrigin(owner:EyePos() + owner:GetAimVector() * 32)
    effectdata:SetStart(owner:GetAimVector())
    util.Effect("arccw_uc_confetti", effectdata)
end

att.Override_UC_ShellColor = Color(255, 127, 182)

att.Hook_Compatible = function(wep)
    if (!wep.ManualAction and !wep.UC_CanManualAction) or !wep:GetIsShotgun() or wep:GetBuff_Override("UC_Shotshell") then return false end
end