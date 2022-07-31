local function DoGenericSpawnmenuRightclickMenu(self)
    local clickmenu = DermaMenu()

    clickmenu:AddOption("#spawnmenu.menu.copy", function()
        SetClipboardText(self:GetSpawnName())
    end):SetIcon("icon16/page_copy.png")

    if isfunction(self.OpenMenuExtra) then
        self:OpenMenuExtra(clickmenu)
    end

    clickmenu:Open()
end


hook.Add( "PopulateWeapons", "UC_AddWeaponContent", function( pnlContent, tree, node )

    local AllUCWeapons = {}
    local AllUCWeaponsByPack = {}
    for classname, _ in pairs( weapons.GetList() ) do
        local wep = weapons.Get(_.ClassName)
        if wep.Category == "ArcCW - Urban Coalition" then
            AllUCWeapons[_.ClassName] = wep
        end
    end

    for classname, weapondata in pairs( AllUCWeapons ) do
        local pack = weapondata.UC_CategoryPack or "_Unknown"
        if pack then
            if !AllUCWeaponsByPack[pack] then AllUCWeaponsByPack[pack] = {} end
            table.insert(AllUCWeaponsByPack[pack], classname)
        end
    end

    -- PrintTable(AllUCWeapons)
    -- PrintTable(AllUCWeaponsByPack)

    local NodeToUse = 0
    -- MW base devs, I tried to recreate this spawnmenu stuff without looking at the code for yours
    -- BUT I WAS FUCKING BAWLING MY EYES OUT TRYING TO GET HOW TO DO THIS NEXT LINE
    -- anyways you guys probably are not reading this so i will end it here thank you
    -- ( i had the idea to do this kinda shit like. 2 days before smgs were pushed. i'm fucking crying i crode 😭😭😭 )
    for _, UCNode in pairs(tree:Root():GetChildNodes()) do
        if UCNode:GetText() != "ArcCW - Urban Coalition" then continue end
        NodeToUse = UCNode
    end

    NodeToUse.DoPopulate = function(self)
        -- If we've already populated it - forget it.
        if (self.PropPanel) then return end

        -- Create the container panel
        self.PropPanel = vgui.Create("ContentContainer", pnlContent)
        self.PropPanel:SetVisible(false)
        self.PropPanel:SetTriggerSpawnlistChange(false)

        for pack, class in SortedPairs( AllUCWeaponsByPack ) do
            local label = vgui.Create("ContentHeader", NodeToUse)
            label:SetText( string.Right( pack, #pack-1 ) )
            self.PropPanel:Add(label)

            local alphabeticallist = {}
            for _, k in pairs(class) do table.insert(alphabeticallist, {AllUCWeapons[k], PrintName = AllUCWeapons[k].PrintName}) end
            for k, ent in SortedPairsByMemberValue( alphabeticallist, "PrintName" ) do
                local ent = ent[1]
                CreateUCWeapon( self.PropPanel, {
                    nicename	= ent.PrintName or ent.ClassName,
                    spawnname	= ent.ClassName,
                    material	= ent.IconOverride or "entities/" .. ent.ClassName .. ".png",
                    admin		= ent.AdminOnly,

                    uc_manu = ent.Trivia_Manufacturer,
                    uc_year = ent.Trivia_Year,
                    uc_cali = ent.Trivia_Calibre,
                } )
            end

        end
    end
end )

function CreateUCWeapon(container, obj)
    if !obj.material then return end
    if !obj.nicename then return end
    if !obj.spawnname then return end
    local icon = vgui.Create("UCWepSel", container)
    icon:SetContentType("weapon")
    icon:SetSpawnName(obj.spawnname)

    icon:SetName(obj.nicename, obj.spawnname, {
        manu = obj.uc_manu,
        year = obj.uc_year,
        cali = obj.uc_cali
    })

    icon:SetMaterial(obj.material)
    icon:SetAdminOnly(obj.admin)
    icon:SetColor(Color(135, 206, 250, 255))

    icon.DoClick = function()
        RunConsoleCommand("gm_giveswep", obj.spawnname)
        surface.PlaySound("ui/buttonclickrelease.wav")
    end

    icon.DoMiddleClick = function()
        RunConsoleCommand("gm_spawnswep", obj.spawnname)
        surface.PlaySound("ui/buttonclickrelease.wav")
    end

    icon.OpenMenuExtra = function(self, menu)
        menu:AddOption("#spawnmenu.menu.spawn_with_toolgun", function()
            RunConsoleCommand("gmod_tool", "creator")
            RunConsoleCommand("creator_type", "3")
            RunConsoleCommand("creator_name", obj.spawnname)
        end):SetIcon("icon16/brick_add.png")

        local opt = menu:AddOption("#spawnmenu.menu.use_as_npc_gun", function()
            RunConsoleCommand("gmod_npcweapon", self:GetSpawnName())
        end)

        if self:GetSpawnName() == GetConVar("gmod_npcweapon"):GetString() then
            opt:SetIcon("icon16/monkey_tick.png")
        else
            opt:SetIcon("icon16/monkey.png")
        end
    end

    icon.OpenMenu = DoGenericSpawnmenuRightclickMenu

    if IsValid(container) then
        container:Add(icon)
    end

    return icon
end