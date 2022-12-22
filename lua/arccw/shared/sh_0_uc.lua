hook.Add("Initialize", "ArcCW_Plinking", function()
    game.AddAmmoType({
        name = "plinking",
    })

    if CLIENT then
        language.Add("plinking_ammo", "Plinking Ammo")
    end
end)

sound.Add({
    name = "DB_ADD",
    channel = CHAN_AUTO,
    volume = 1.0,
    level = 100,
    sound = {"^arccw_uc/common/db_add_1.ogg", "^arccw_uc/common/db_add_2.ogg", "^arccw_uc/common/db_add_3.ogg"}
})

game.AddParticles("particles/muzzleflash_dragonsbreath.pcf")
PrecacheParticleSystem("muzzleflash_dragonbreath")
game.AddParticles("particles/uo_explosions_fas2.pcf")
PrecacheParticleSystem("explosion_HE_m79_fas2")
PrecacheParticleSystem("explosion_he_grenade_fas2")
PrecacheParticleSystem("explosion_HE_claymore_fas2")
PrecacheParticleSystem("explosion_grenade_fas2")
ArcCW.UC = {}

ArcCW.UC.BodyDamageMults = {
    [HITGROUP_HEAD] = 3.5,
    [HITGROUP_CHEST] = 1.15,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 0.85,
    [HITGROUP_RIGHTARM] = 0.85,
    [HITGROUP_LEFTLEG] = 0.5,
    [HITGROUP_RIGHTLEG] = 0.5,
}

ArcCW.UC.BodyDamageMults_Shotgun = {
    [HITGROUP_HEAD] = 1.5,
    [HITGROUP_CHEST] = 1,
    [HITGROUP_STOMACH] = 1,
    [HITGROUP_LEFTARM] = 0.85,
    [HITGROUP_RIGHTARM] = 0.85,
    [HITGROUP_LEFTLEG] = 0.5,
    [HITGROUP_RIGHTLEG] = 0.5,
}

ArcCW.UC.RifleAmmoTypes = {
    ["smg1"] = true,
    ["ar2"] = true,
    ["SniperPenetratedRound"] = true
}

ArcCW.UC.PistolAmmoTypes = {
    ["pistol"] = true,
    ["357"] = true,
    ["plinking"] = true
}


local common = ")^/arccw_uc/common/"
ArcCW.UC.DrawSounds = {
    {s = common .. "raise.ogg", t = 0},
    {s = common .. "shoulder.ogg", t = 0.15},
    {s = common .. "rattle.ogg", t = 0.2},
}

ArcCW.UC.HolsterSounds = {
    {s = common .. "rattle.ogg", t = 0},
    {s = common .. "cloth_6.ogg", t = 0.2},
}

ArcCW.UC.SubsonicThreshold = 340

-- Refer to http://www.ballisticsbytheinch.com/ for muzzle velocity per barrel length if possible
ArcCW.UC.StdDmg = {
    -- Pistol/plinking calibers
    ["22lr"] = {
        max = 12,
        min = 7,
        pen = 3,
        vel = 330
    },
    ["9mm"] = {
        max = 30,
        min = 17,
        pen = 6,
        vel = 380
    },
    ["10mm"] = {
        max = 35,
        min = 20,
        pen = 8,
        vel = 400
    },
    ["380acp"] = {
        max = 30,
        min = 15,
        pen = 3,
        vel = 390
    },
    ["40sw"] = {
        max = 30,
        min = 23,
        pen = 8,
        vel = 340
    },
    ["45acp"] = {
        max = 45,
        min = 15,
        pen = 9,
        vel = 250
    },
    ["357sig"] = {
        max = 33,
        min = 17,
        pen = 6,
        vel = 440
    },
    -- Magnum calibers
    ["357"] = {
        max = 60,
        min = 20,
        pen = 9,
        vel = 430
    },
    ["44"] = {
        max = 75,
        min = 16,
        pen = 10,
        vel = 360
    },
    ["50ae"] = {
        max = 80,
        min = 12,
        pen = 12,
        vel = 450
    },
    ["50beo"] = {
        max = 80,
        min = 20,
        pen = 12,
        vel = 540
    },
    -- Carbine/rifle calibers
    ["57fn"] = {
        max = 28,
        min = 20,
        pen = 15,
        vel = 910
    }, -- 5.7x28mm FN
    ["556"] = {
        max = 34,
        min = 20,
        pen = 14,
        vel = 910
    },
    ["300blk"] = {
        max = 40,
        min = 15,
        pen = 10,
        vel = 310
    },
    ["545"] = {
        max = 40,
        min = 20,
        pen = 12,
        vel = 880
    },
    ["762_39"] = {
        max = 50,
        min = 25,
        pen = 16,
        vel = 730
    }, -- 7.62x39, not 7.62x51 NATO
    ["762_51"] = {
        max = 65,
        min = 35,
        pen = 20,
        vel = 850
    }, -- 7.62x51 NATO
    ["366"] = {
        max = 60,
        min = 30,
        pen = 18,
        vel = 600
    }, -- .366 TKM
    -- Shotgun calibers
    ["12g_p"] = {
        max = 20,
        min = 13,
        pen = 2,
        num = 8,
        vel = 400
    }, -- Pump
    ["12g_s"] = {
        max = 18,
        min = 10,
        pen = 2,
        num = 8,
        vel = 400
    }, -- Semi
    ["410b"] = {
        max = 18,
        min = 5,
        pen = 2,
        vel = 400
    },
    -- Sniper calibers
    ["338"] = {
        max = 85,
        min = 160,
        pen = 36,
        vel = 1000
    },
    ["300"] = {
        max = 44,
        min = 85,
        pen = 24,
        vel = 950
    },
    ["50bmg"] = {
        max = 104,
        min = 180,
        pen = 46,
        vel = 920
    },
}

function ArcCW.UC.CalConv(from, to, stat)
    return math.Round(ArcCW.UC.StdDmg[to][stat] / ArcCW.UC.StdDmg[from][stat], 2)
end

ArcCW.UC.ADSReload = function(wep)
    if IsValid(wep) and wep.ArcCW then
        local vm = wep:GetOwner():GetViewModel()

        local delta = 1-wep:GetSightDelta()

        local bipoded = wep:GetInBipod()
        wep.ADSBipodAnims = math.Approach(wep.ADSBipodAnims or 0, bipoded and 1 or 0, FrameTime() / 0.5)

        vm:SetPoseParameter("sights", Lerp( math.ease.InOutCubic(math.max(delta, wep.ADSBipodAnims)), 0, 1)) -- thanks fesiug
    end
end

-- right forward up
local traces1 = {
    {
        Distance = Vector(0, 0, 1024),
        Influence = 1,
    }, -- Up

}

local traces2 = {
    {
        Distance = Vector(0, 0, 1024),
        Influence = 1,
    }, -- Up
    {
        Distance = Vector(768, 768, 0),
        Influence = 0.5,
    }, -- Right
    {
        Distance = Vector(-768, 768, 0),
        Influence = 0.5,
    }, -- Left

}

local traces3 = {
    {
        Distance = Vector(0, 0, 1024),
        Influence = 0,
    }, -- Up
    {
        Distance = Vector(0, 768, 768),
        Influence = 1,
    }, -- Up Forward
    {
        Distance = Vector(0, -768, 768),
        Influence = 1,
    }, -- Up Back
    {
        Distance = Vector(0, 768, 0),
        Influence = 0.5,
    }, -- Forward
    {
        Distance = Vector(768, 768, 0),
        Influence = 0.5,
    }, -- Right
    {
        Distance = Vector(-768, 768, 0),
        Influence = 0.5,
    }, -- Left

}

local traces4 = {
    {
        Distance = Vector(0, 0, 1024),
        Influence = 0.5,
    }, -- Up
    {
        Distance = Vector(0, 768, 768),
        Influence = 1,
    }, -- Up Forward
    {
        Distance = Vector(0, -768, 768),
        Influence = 1,
    }, -- Up Back
    {
        Distance = Vector(0, 768, 0),
        Influence = 0.5,
    }, -- Forward
    {
        Distance = Vector(0, -1024, 0),
        Influence = 0.5,
    }, -- Back
    {
        Distance = Vector(768, 768, 0),
        Influence = 0.5,
    }, -- Right
    {
        Distance = Vector(-768, 768, 0),
        Influence = 0.5,
    }, -- Left
    {
        Distance = Vector(-768, -768, 0),
        Influence = 0.5,
    }, -- Left Back
    {
        Distance = Vector(768, -768, 0),
        Influence = 0.5,
    }, -- Right Back

}

local tracebase = {
    start = 0,
    endpos = 0,
    filter = NULL,
}

local choice = {
    [1] = traces1,
    [2] = traces2,
    [3] = traces3,
    [4] = traces4,
}

if game.SinglePlayer() and SERVER then
    util.AddNetworkString("ArcCW_UC_InnyOuty")
elseif game.SinglePlayer() and CLIENT then
    net.Receive("ArcCW_UC_InnyOuty", function(len, ply)
        ArcCW.UC.InnyOuty(net.ReadEntity())
    end)
end

ArcCW.UC.InnyOuty = function(wep)
    if wep:GetBuff_Override("UC_NoInnyOuty") then return end

    local dist = wep:GetBuff_Hook("Hook_GetDistantShootSound")
    if dist == false then return end

    if game.SinglePlayer() and SERVER then
        net.Start("ArcCW_UC_InnyOuty")
        net.WriteEntity(wep)
        net.Send(wep:GetOwner())
    elseif CLIENT and wep:GetOwner() == LocalPlayer() then
        if wep.DistantShootSoundOutdoors and wep.DistantShootSoundIndoors then
            local dso = wep.DistantShootSoundOutdoors
            local dsi = wep.DistantShootSoundIndoors
            local dsov = wep.DistantShootSoundOutdoorsVolume
            local dsiv = wep.DistantShootSoundIndoorsVolume

            if wep:GetBuff_Override("Silencer") then
                if wep:GetBuff("PhysBulletMuzzleVelocity") < ArcCW.UC.SubsonicThreshold then--if wep:CheckFlags(nil, {"powder_subsonic"}) or wep:CheckFlags(nil, {"cal_subsonic"}) then
                    return -- no tail
                else
                    dso = wep.DistantShootSoundOutdoorsSilenced
                    dsi = wep.DistantShootSoundIndoorsSilenced
                end
            end

            dso = wep:GetBuff_Hook("Hook_GetDistantShootSoundOutdoors", dso)
            dsi = wep:GetBuff_Hook("Hook_GetDistantShootSoundIndoors", dsi)
            local vol = 0
            local wo = wep:GetOwner()
            local wop = wo:EyePos()
            local woa = Angle(0, wo:EyeAngles().y, 0)
            local t_influ = 0
            local option = GetConVar("arccw_uc_disttrace"):GetInt()
            local fps = 1 / RealFrameTime()

            if option > 0 then
                option = choice[option]
            else
                if fps > 100 then
                    option = 4
                elseif fps > 40 then
                    option = 3
                else
                    option = 2
                end

                if GetConVar("developer"):GetInt() > 1 then
                    print("perf" .. option)
                end

                option = choice[option]
            end

            for _, tin in ipairs(option) do
                tracebase.start = wop
                offset = Vector()
                --if !tin.AngleUp then--_ != 1 then
                offset = offset + (tin.Distance.x * woa:Right())
                offset = offset + (tin.Distance.y * woa:Forward())
                offset = offset + (tin.Distance.z * woa:Up())
                --end
                tracebase.endpos = wop + offset
                tracebase.filter = wo
                t_influ = t_influ + (tin.Influence or 1)
                local result = util.TraceLine(tracebase)
                debugoverlay.Line(wop - (vector_up * 4), result.HitPos - (vector_up * 4), 1, Color((_ / 4) * 255, 0, (1 - (_ / 4)) * 255))
                debugoverlay.Text(result.HitPos - (vector_up * 4), math.Round((result.HitSky and 1 or result.Fraction) * 100) .. "%", 1)
                vol = vol + (result.HitSky and 1 or result.Fraction) * tin.Influence
            end

            vol = vol / t_influ

            if GetConVar("developer"):GetInt() > 1 then
                print(vol)
            end

            if dso then
                for _, snd in ipairs(dso) do
                    wep:StopSound(snd)
                end

                if math.max(0.15, vol) ~= 0.15 then
                    wep:EmitSound(dso[math.random(1, #dso)], 75, 100, vol * dsov or 1, CHAN_VOICE2)
                end
            end

            if dsi then
                for _, snd in ipairs(dsi) do
                    wep:StopSound(snd)
                end

                if math.min(0.85, vol) ~= 0.85 then
                    wep:EmitSound(dsi[math.random(1, #dsi)], 75, 100, (1 - vol) * dsiv or 1, CHAN_STREAM)
                end
            end
        end
    end
end

ArcCW.UC.CustColorUpdateInterval = 5

if CLIENT then
    CreateClientConVar("arccw_uc_disttrace", 0, true, false, "Mode for traces", 0, 4)
    CreateClientConVar("arccw_uc_custcolor_enable", 255, true, true, "1 for custom colors, 0 for playermodel color", 0, 1)
    CreateClientConVar("arccw_uc_custcolor_1_r", 255, true, true, "Main color R", 0, 255)
    CreateClientConVar("arccw_uc_custcolor_1_g", 255, true, true, "Main color G", 0, 255)
    CreateClientConVar("arccw_uc_custcolor_1_b", 255, true, true, "Main color B", 0, 255)
    CreateClientConVar("arccw_uc_custcolor_2_r", 255, true, true, "Second color R", 0, 255)
    CreateClientConVar("arccw_uc_custcolor_2_g", 255, true, true, "Second color G", 0, 255)
    CreateClientConVar("arccw_uc_custcolor_2_b", 255, true, true, "Second color B", 0, 255)

    -- CreateClientConVar("arccw_uc_menu", 1, true, false, "Cool menu!", 0, 1)

    -- These convars are already known serverside; this only serves to tell the server it's time to update our colors to other clients.
    if not game.SinglePlayer() then
        local t = "ArcCW_UC_UpdateColor"
        local custcolorcallback = function(cvar, old, new)
            if timer.Exists(t) then
                timer.Adjust(t, ArcCW.UC.CustColorUpdateInterval)
            else
                timer.Create(t, ArcCW.UC.CustColorUpdateInterval, 1, function()
                    net.Start("ArcCW_UC_CustColor")
                    net.SendToServer()
                end)
            end
        end
        cvars.AddChangeCallback("arccw_uc_custcolor_enable", custcolorcallback)
        cvars.AddChangeCallback("arccw_uc_custcolor_1_r", custcolorcallback)
        cvars.AddChangeCallback("arccw_uc_custcolor_1_g", custcolorcallback)
        cvars.AddChangeCallback("arccw_uc_custcolor_1_b", custcolorcallback)
        cvars.AddChangeCallback("arccw_uc_custcolor_2_r", custcolorcallback)
        cvars.AddChangeCallback("arccw_uc_custcolor_2_g", custcolorcallback)
        cvars.AddChangeCallback("arccw_uc_custcolor_2_b", custcolorcallback)
    end

    matproxy.Add({
        name = "UC_ShellColor",
        init = function(self, mat, values)
            --self.envMin = values.min
            --self.envMax = values.max
            self.col = Vector()
        end,
        bind = function(self, mat, ent)
            local swent = ent

            if IsValid(swent) then
                local herg = color_white
                local r = 255
                local g = 255
                local b = 255

                if swent:IsWeapon() and swent.ArcCW then
                    herg = swent:GetBuff_Override("Override_UC_ShellColor") or swent.UC_ShellColor or herg
                    r = herg.r or 255
                    g = herg.g or 255
                    b = herg.b or 255
                elseif IsValid(swent:GetOwner()) and IsValid(swent:GetOwner():GetActiveWeapon()) and swent:GetOwner():GetActiveWeapon().ArcCW then
                    swent = swent:GetOwner():GetActiveWeapon()
                    herg = swent:GetBuff_Override("Override_UC_ShellColor") or swent.UC_ShellColor or herg
                    r = herg.r or 255
                    g = herg.g or 255
                    b = herg.b or 255
                elseif swent then
                    herg = swent.UC_ShellColor or herg
                    r = herg.r or 255
                    g = herg.g or 255
                    b = herg.b or 255
                end

                self.col.x = r / 255
                self.col.y = g / 255
                self.col.z = b / 255
                mat:SetVector("$color2", self.col)
            end
        end
    })

    local function proxystuff(digit)
        return {
            name = "UC_Weapon_Color" .. digit,
            init = function(self, mat, values)
                self.ResultTo = values.resultvar
            end,
            bind = function(self, mat, ent)
                local owner = ent:GetOwner()

                if IsValid(ent) and ent.ArcCW and IsValid(owner) and owner:IsPlayer() then
                    local net_color = owner["UC_CustColor" .. digit]
                    if (owner == LocalPlayer() and owner:GetInfoNum("arccw_uc_custcolor_enable", 0) == 1) or (owner.UC_CustEnable and net_color) then -- ply.UC_CustEnable
                        if net_color then
                            mat:SetVector(self.ResultTo, Vector(net_color.r, net_color.g, net_color.b) / 230)
                        else
                            mat:SetVector(self.ResultTo, Vector(owner:GetInfoNum("arccw_uc_custcolor_" .. digit .. "_r", 255), owner:GetInfoNum("arccw_uc_custcolor_" .. digit .. "_g", 255), owner:GetInfoNum("arccw_uc_custcolor_" .. digit .. "_b", 255)) / 230)
                        end
                    else
                        mat:SetVector(self.ResultTo, owner:GetPlayerColor() * 0.9)
                    end
                    -- else
                    -- mat:SetVector(self.ResultTo, Vector(0.8, 0.8, 0.8))
                end
            end
        }
    end

    matproxy.Add(proxystuff(1))
    matproxy.Add(proxystuff(2))

    net.Receive("ArcCW_UC_CustColor", function()
        local ply = net.ReadEntity()
        ply.UC_CustEnable = net.ReadBool()
        if ply.UC_CustEnable then
            ply.UC_CustColor1 = net.ReadColor(false)
            ply.UC_CustColor2 = net.ReadColor(false)
        end
    end)

    local function menu_uc(panel)
        panel:AddControl("header", {
            description = "This menu contains options for configuring Urban Coalition weapons and items."
        })

        local combobox = panel:ComboBox("Trace count", "arccw_uc_disttrace") --vgui.Create( "DComboBox", panel )
        combobox:SetSortItems(false)
        combobox:AddChoice("Automatic", 0)
        combobox:AddChoice("1-way (performance, not recommended)", 1)
        combobox:AddChoice("3-way (default)", 2)
        combobox:AddChoice("6-way (expensive)", 3)
        combobox:AddChoice("9-way (absurd)", 4)
        panel:ControlHelp("How accurate should the weapon tail calculation be for when used outdoors or indoors?")

        panel:AddControl("header", {
            description = "________________"
        })

        -- idk write better   Write something about list of guns that supports it or something
        panel:AddControl("checkbox", {
            label = "Use defined colors for customisation",
            command = "arccw_uc_custcolor_enable"
        })

        panel:ControlHelp("will use playermodel color if off")

        panel:AddControl("color", {
            label = "Primary Color",
            red = "arccw_uc_custcolor_1_r",
            green = "arccw_uc_custcolor_1_g",
            blue = "arccw_uc_custcolor_1_b"
        })

        panel:AddControl("color", {
            label = "Secondary Color",
            red = "arccw_uc_custcolor_2_r",
            green = "arccw_uc_custcolor_2_g",
            blue = "arccw_uc_custcolor_2_b"
        })

        panel:AddControl("header", {
            description = "________________"
        })
        panel:AddControl("header", {
            description = "Asset precaching"
        })

        panel:AddControl("button", {
            label = "Clientside Asset Cache",
            command = "arccw_uc_cache_client"
        })
        panel:ControlHelp("Begin a clientside caching of all Urban Coalition assets.")
        panel:AddControl("slider", {
            label = "Attempts per second",
            command = "arccw_uc_cache_client_persecond",
            min = 10,
            max = 60,
        })

        panel:AddControl("button", {
            label = "Serverside Asset Cache",
            command = "arccw_uc_cache_server"
        })
        panel:ControlHelp("Command the server to do a caching of all Urban Coalition assets.")
    end

    hook.Add("PopulateToolMenu", "ARCCW_UC_MenuOptions", function()
        spawnmenu.AddToolMenuOption("Options", "ArcCW", "ArcCW_UC", "Urban Coalition", "", "", menu_uc)
    end)

elseif SERVER then

    util.AddNetworkString("ArcCW_UC_CustColor")

    net.Receive("ArcCW_UC_CustColor", function(len, ply)
        if (ply.UC_LastColorUpdate or 0) + ArcCW.UC.CustColorUpdateInterval > CurTime() then return end
        ply.UC_LastColorUpdate = CurTime()
        net.Start("ArcCW_UC_CustColor")
            local enabled = tobool(ply:GetInfoNum("arccw_uc_custcolor_enable", 0))
            net.WriteBool(enabled)
            if enabled then
                net.WriteColor(Color(ply:GetInfoNum("arccw_uc_custcolor_1_r", 255), ply:GetInfoNum("arccw_uc_custcolor_1_g", 255), ply:GetInfoNum("arccw_uc_custcolor_1_b", 255)), false)
                net.WriteColor(Color(ply:GetInfoNum("arccw_uc_custcolor_2_r", 255), ply:GetInfoNum("arccw_uc_custcolor_2_g", 255), ply:GetInfoNum("arccw_uc_custcolor_2_b", 255)), false)
            end
        net.SendOmit(ply)
    end)
end

hook.Add("ArcCW_InitBulletProfiles", "UrbanCoalition", function()
    ArcCW:AddBulletProfile("uc_tracer_g", {
        color = Color(100, 255, 100),
        size = 1.5,
        size_min = 2,
        tail_length = 0.05,
    })

    ArcCW:AddBulletProfile("uc_tracer_r", {
        color = Color(255, 100, 100),
        size = 1.5,
        size_min = 2,
        tail_length = 0.05,
    })

    ArcCW:AddBulletProfile("uc_tracer_w", {
        color = Color(255, 255, 255),
        size = 1.5,
        size_min = 2,
        tail_length = 0.05,
    })

    ArcCW:AddBulletProfile("uc_plinking", {
        color = Color(255, 255, 255, 200),
        size = 0.5,
        size_min = 0.25,
        tail_length = 0.03,
    })

    ArcCW:AddBulletProfile("uc_api", {
        color = Color(255, 175, 100),
        size = 1,
        size_min = 1,
        tail_length = 0.05,
    })

    ArcCW:AddBulletProfile("uc_dragon", {
        color = Color(255, 220, 175),
        sprite_head = false,
        sprite_tail = false,

        DrawBullet = function(bulinfo, bullet)

            if CurTime() - bullet.StartTime <= 0.05 then return end
            local a = bullet.PosStart and Lerp((bullet.PosStart - bullet.Pos):LengthSqr() / 40000, 0, 1) or 0
            if a == 0 then return end

            -- Do not try to keep emitting while time is frozen (singleplayer pause)
            if bullet.LastTick and bullet.LastTick == CurTime() then return end
            bullet.LastTick = CurTime()

            local emitter = ParticleEmitter(bullet.Pos)
            if not IsValid(emitter) then return end

            local vec = bullet.Vel * engine.TickInterval()
            local count = math.ceil(vec:Length() / 12)

            local count2 = math.ceil(math.sqrt(count) / 3 * a)
            for j = 1, count2 do
                local p = bullet.Pos - vec * (j / count2) + VectorRand() * math.Clamp((CurTime() - bullet.StartTime) / 0.5, 0, 8)

                local spark = emitter:Add("effects/spark", p)
                spark:SetVelocity(VectorRand() * 100 + vec * 0.75)
                spark:SetGravity(Vector(math.Rand(-10, 10), math.Rand(-10, 10), -75))
                spark:SetDieTime(math.Rand(0.15, 0.2))
                spark:SetStartAlpha(255)
                spark:SetEndAlpha(0)
                spark:SetStartSize(math.Rand(3, 6))
                spark:SetEndSize(0)
                spark:SetRoll(math.Rand(-180, 180))
                spark:SetRollDelta(math.Rand(-0.2, 0.2))
                spark:SetColor(255, 220, 175)
                spark:SetAirResistance(50)
                spark:SetLighting(false)
                spark:SetCollide(true)
                spark:SetBounce(0.8)
            end

            emitter:Finish()
            bullet.RenderTick = (bullet.RenderTick or 0) + 1
        end,

        PhysBulletHit = function(bulinfo, bullet, tr)
            if not CLIENT then return end

            local emitter = ParticleEmitter(bullet.Pos)
            if not IsValid(emitter) then return end

            local dir = bullet.Vel:GetNormalized()
            local reflect = dir:Dot(tr.HitNormal) * 2 * tr.HitNormal  - dir
            local vec = (reflect + VectorRand() * 0.1):GetNormalized()

            for i = 1, math.random(16, 32) do
                local ember = emitter:Add("effects/spark", tr.HitPos + VectorRand() * 4)
                ember:SetVelocity(VectorRand() * 100 - vec * math.Rand(100, 500) + Vector(0, 0, math.Rand(75, 150)))
                ember:SetGravity(Vector(0, 0, -600))
                ember:SetDieTime(math.Rand(0.6, 1.2))
                ember:SetStartAlpha(255)
                ember:SetEndAlpha(0)
                ember:SetStartSize(math.Rand(3, 6))
                ember:SetEndSize(0)
                ember:SetRoll(math.Rand(-180, 180))
                ember:SetRollDelta(math.Rand(-0.2, 0.2))
                ember:SetColor(255, 220, 175)
                ember:SetAirResistance(80)
                ember:SetLighting(false)
                ember:SetCollide(true)
                ember:SetBounce(0.5)
            end

            emitter:Finish()
        end
    })
end)

local paths = {
    "sound/weapons/arccw_ud/",
    "sound/weapons/arccw_ur/",
    "sound/weapons/arccw_uc_galil/",
    "sound/weapons/arccw_uc_lynx/",
    "sound/weapons/arccw_uc_usp/",
    "sound/arccw_uc/",
    "sound/weapons/arccw/",
    "models/weapons/arccw/",
    "models/items/arccw/",
}

if CLIENT then
    local procedure = {
        ["sound"] = function(asset)
            asset = string.Replace( asset, "sound\\", "" )
            asset = string.Replace( asset, "sound/", "" )
            if !IsValid(LocalPlayer()) then
                print("LocalPlayer is NULL! You're too early!!")
            else
                LocalPlayer():EmitSound( asset, 75, 100, 0.01, CHAN_WEAPON )
            end
        end,
        ["model"] = function(asset)
            local cmdl = ClientsideModel( asset )
            cmdl:Remove()
        end,
    }

    local cooltable = {}
    function fukc()
        local function recurse( path, dir )
            local files, directories = file.Find( path .. (dir and (dir .. "/") or "") .. "*", "GAME" )
            for i, fie in ipairs(files) do
                local fiex = string.GetExtensionFromFilename(fie)
                if fiex == "ogg" or fiex == "wav" or fiex == "mp3" or fiex == "mdl" then
                    table.insert( cooltable, path .. (dir and (dir .. "/") or "") .. fie )
                end
            end
            for i, dir in ipairs(directories) do
                recurse( path, dir )
            end
        end

        cooltable = {}

        UC_Precache = true
        UC_PrecachePer = 0
        UC_PrecachePeh = 0
        UC_PrecacheCur = "..."
        for i, path in ipairs(paths) do
            recurse( path )
        end

        -- PrintTable(cooltable)

        for i, fie in ipairs(cooltable) do
            timer.Simple(i/GetConVar("arccw_uc_cache_client_persecond"):GetFloat(), function()
                UC_PrecachePer = i
                UC_PrecachePeh = #cooltable
                UC_PrecacheCur = fie
                local fiex = string.GetExtensionFromFilename(fie)
                if fiex == "ogg" or fiex == "wav" or fiex == "mp3" then
                    procedure["sound"](fie)
                elseif fiex == "mdl" then
                    procedure["model"](fie)
                elseif fiex == "phy" or fiex == "vvd" or fiex == "vtx" then
                    -- ignore these
                else
                    print("Unknown what to do with " .. fie .. "!")
                end
                if i == #cooltable then UC_Precache = false end
            end)
        end
    end

    hook.Add("HUDPaint", "UC_Precache", function()
        if UC_Precache then
            local i_1 = UC_PrecachePer or 1
            local i_2 = UC_PrecachePeh or 1
            local i_per = i_1 / i_2
            local i_cur = UC_PrecacheCur or "..."
            surface.SetDrawColor(255, 255, 255, 255)
            local ss = ScreenScale(1) * GetConVar("arccw_hud_size"):GetFloat()
            local bx, by = (ss*150), (ss*10)

            -- Bar
            surface.DrawOutlinedRect( ( ScrW() / 2 ) - ( bx / 2 ), ( ScrH() * 0.7 ) - ( by / 2 ), bx, by, 2 )
            surface.DrawRect( ( ScrW() / 2 ) - ( bx / 2 ), ( ScrH() * 0.7 ) - ( by / 2 ), bx * i_per, by )

            -- Top left
            draw.SimpleText( "CACHING:", "ArcCW_12", ( ScrW() / 2 ) - ( bx / 2 ), ( ScrH() * 0.7 ) - ( by / 2 ) - (ss*1), color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_BOTTOM )

            -- Bottom right
            draw.SimpleText( math.Round(i_per * 100) .. "%", "ArcCW_12", ( ScrW() / 2 ) + ( bx / 2 ), ( ScrH() * 0.7 ) + ( by / 2 ) - (ss*1), color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_TOP )

            -- Top right
            draw.SimpleText( i_1 .. "/" .. i_2, "ArcCW_8", ( ScrW() / 2 ) + ( bx / 2 ), ( ScrH() * 0.7 ) - ( by / 2 ) - (ss*1), color_white, TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM )

            -- Bottom left
            draw.SimpleText( i_cur, "ArcCW_6", ( ScrW() / 2 ) - ( bx / 2 ), ( ScrH() * 0.7 ) + ( by / 2 ) + (ss*1), color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_TOP )
        end
    end)
    CreateClientConVar("arccw_uc_cache_client_persecond", 60, true, false)
    concommand.Add( "arccw_uc_cache_client", function()
        fukc()
    end)
end

if SERVER then
    local procedure = {
        ["sound"] = function(asset)
            local cmdl = ents.Create( "prop_dynamic" )
            asset = string.Replace( asset, "sound\\", "" )
            asset = string.Replace( asset, "sound/", "" )
            cmdl:EmitSound( asset, 75, 100, 0.4, CHAN_WEAPON )
            cmdl:Remove()
        end,
        ["model"] = function(asset)
            local cmdl = ents.Create( "prop_dynamic" )
            -- print(cmdl)
            cmdl:SetModel(asset)
            cmdl:Spawn()
            cmdl:Remove()
        end,
    }
    local cooltable = {}
    function fukc_server()
        local function recurse( path, dir )
            local files, directories = file.Find( path .. (dir and (dir .. "/") or "") .. "*", "GAME" )
            for i, fie in ipairs(files) do
                local fiex = string.GetExtensionFromFilename(fie)
                if fiex == "ogg" or fiex == "wav" or fiex == "mp3" or fiex == "mdl" then
                    table.insert( cooltable, path .. (dir and (dir .. "/") or "") .. fie )
                end
            end
            for i, dir in ipairs(directories) do
                recurse( path, dir )
            end
        end

        cooltable = {}

        UC_Precache = true
        UC_PrecachePer = 0
        UC_PrecachePeh = 0
        UC_PrecacheCur = "..."
        for i, path in ipairs(paths) do
            recurse( path )
        end

        -- PrintTable(cooltable)

        for i, fie in ipairs(cooltable) do
            timer.Simple(i/(1/20), function()
                -- print(fie)
                UC_PrecachePer = i
                UC_PrecachePeh = #cooltable
                UC_PrecacheCur = fie
                local fiex = string.GetExtensionFromFilename(fie)
                if fiex == "ogg" or fiex == "wav" or fiex == "mp3" then
                    procedure["sound"](fie)
                elseif fiex == "mdl" then
                    procedure["model"](fie)
                elseif fiex == "phy" or fiex == "vvd" or fiex == "vtx" then
                    -- ignore these
                else
                    print("Unknown what to do with " .. fie .. "!")
                end
                if i == #cooltable then UC_Precache = false end
            end)
        end
    end

    concommand.Add( "arccw_uc_cache_server", function()
        print("hi")
        fukc_server()
    end, nil, "command server to cache")
end