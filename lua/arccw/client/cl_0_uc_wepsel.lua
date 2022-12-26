surface.CreateFont("UCWepSel", {
    font = "Bahnschrift",
    size = 36,
    weight = 0,
    blursize = 0,
    antialias = true,
})

surface.CreateFont("UCWepSel2", {
    font = "Bahnschrift Light",
    size = 17,
    weight = 0,
    blursize = 0,
    antialias = true,
})

surface.CreateFont("UCWepSel3", {
    font = "Bahnschrift Light",
    size = 13,
    weight = 0,
    blursize = 0,
    antialias = true,
})

local PANEL = {}

local matOverlay_AdminOnly = Material("icon16/shield.png")
local matOverlay_NPCWeapon = Material("icon16/monkey.png")
local matOverlay_NPCWeaponSelected = Material("icon16/monkey_tick.png")

AccessorFunc(PANEL, "m_Color", "Color")
AccessorFunc(PANEL, "m_Type", "ContentType")
AccessorFunc(PANEL, "m_SpawnName", "SpawnName")
AccessorFunc(PANEL, "m_NPCWeapon", "NPCWeapon")
AccessorFunc(PANEL, "m_bAdminOnly", "AdminOnly")
AccessorFunc(PANEL, "m_bIsNPCWeapon", "IsNPCWeapon")

function PANEL:Init()
    self:SetPaintBackground(false)
    -- local sw, sh = self:GetParent():GetParent():GetParent():GetSize()
    self:SetSize(384, 128) -- TODO: get real long n har. nvm
    self:SetText("")
    self:SetDoubleClickingEnabled(false)
    self.Image = self:Add("DImage")
    self.Image:SetPos(3, 3)
    self.Image:SetSize(128 - 6, 128 - 6)
    self.Image:SetVisible(false)
    self.Border = 0
end

function PANEL:SetName(name, spname, other)
    self:SetTooltip(name .. "\n" .. spname)
    self.WEP_NAME = name
    self.WEP_MANU = other.manu
    self.WEP_YEAR = other.year
    self.WEP_CALI = other.cali
    --self.Label:SetText( name )
    --self.Label2:SetText( name )
    self.m_NiceName = name
end

function PANEL:SetMaterial(name)
    self.m_MaterialName = name
    local mat = Material(name)

    -- Look for the old style material
    if not mat or mat:IsError() then
        name = name:Replace("entities/", "VGUI/entities/")
        name = name:Replace(".png", "")
        mat = Material(name)
    end

    -- Couldn't find any material.. just return
    if not mat or mat:IsError() then
        mat = Material("entities/ucepicfail.png")
    end

    self.Image:SetMaterial(mat)
end

function PANEL:DoRightClick()
    local pCanvas = self:GetSelectionCanvas()
    if IsValid(pCanvas) and pCanvas:NumSelectedChildren() > 0 and self:IsSelected() then return hook.Run("SpawnlistOpenGenericMenu", pCanvas) end
    self:OpenMenu()
end

function PANEL:DoClick()
end

function PANEL:OpenMenu()
end

function PANEL:OnDepressionChanged(b)
end

function PANEL:Paint(w, h)
    if self.Depressed and not self.Dragging then
        if self.Border ~= 8 then
            self.Border = 8
            self:OnDepressionChanged(true)
        end
    else
        if self.Border ~= 0 then
            self.Border = 0
            self:OnDepressionChanged(false)
        end
    end

    surface.SetDrawColor(255, 255, 255, 255)

    if not dragndrop.IsDragging() and (self:IsHovered() or self.Depressed or self:IsChildHovered()) then
        surface.SetMaterial(Material("entities/uchover.png"))
        surface.DrawTexturedRect(self.Border, self.Border, w, h)
    end

    --surface.SetMaterial( matOverlay_Normal )
    --self.Label:Show()
    local c_w, c_s = Color(255, 255, 255, 200), Color(0, 0, 0, 127)

    -- Name
    if assert(self.WEP_NAME, "Holy balls no weapon name??") then
        surface.SetFont("UCWepSel")
        surface.SetTextPos((128 + 16) + 2, (50 - 24) + 2)
        surface.SetTextColor(c_s)
        surface.DrawText(self.WEP_NAME or "idk")
        surface.SetTextPos(128 + 16, 50 - 24)
        surface.SetTextColor(color_white)
        surface.DrawText(self.WEP_NAME or "idk")
    end

    local ya = false

    if self.WEP_MANU then
        -- Manufacturer
        surface.SetFont("UCWepSel2")
        surface.SetTextPos((128 + 16) + 2, (50 - 24 + 32) + 2)
        surface.SetTextColor(c_s)
        surface.DrawText(self.WEP_MANU or "idk")
        surface.SetTextPos(128 + 16, 50 - 24 + 32)
        surface.SetTextColor(c_w)
        surface.DrawText(self.WEP_MANU or "idk")
        ya = true
    end

    if self.WEP_CALI then
        -- Caliber
        surface.SetFont("UCWepSel3")
        surface.SetTextPos((128 + 16) + 2, (50 - 24 + 32 + (ya and 16 or 0)) + 2)
        surface.SetTextColor(c_s)
        surface.DrawText(self.WEP_CALI or "idk")
        surface.SetTextPos(128 + 16, 50 - 24 + 32 + (ya and 16 or 0))
        surface.SetTextColor(c_w)
        surface.DrawText(self.WEP_CALI or "idk")
    end

    if self.WEP_YEAR then
        -- Year
        surface.SetFont("UCWepSel3")
        surface.SetTextPos((128 + 16) + 2, (50 - 31) + 2)
        surface.SetTextColor(c_s)
        surface.DrawText(self.WEP_YEAR or "9999")
        surface.SetTextPos(128 + 16, 50 - 31)
        surface.SetTextColor(c_w)
        surface.DrawText(self.WEP_YEAR or "9999")
    end

    render.PushFilterMag(TEXFILTER.ANISOTROPIC)
    render.PushFilterMin(TEXFILTER.ANISOTROPIC)
    self.Image:PaintAt(3 + self.Border, 3 + self.Border, 128 - 8 - self.Border * 2, 128 - 8 - self.Border * 2)
    render.PopFilterMin()
    render.PopFilterMag()

    --surface.DrawTexturedRect( self.Border, self.Border, w-self.Border*2, h-self.Border*2 )
    if self:GetAdminOnly() then
        surface.SetMaterial(matOverlay_AdminOnly)
        surface.DrawTexturedRect(self.Border + 8, self.Border + 8, 16, 16)
    end

    -- This whole thing could be more dynamic
    if self:GetIsNPCWeapon() then
        surface.SetMaterial(matOverlay_NPCWeapon)

        if self:GetSpawnName() == GetConVar("gmod_npcweapon"):GetString() then
            surface.SetMaterial(matOverlay_NPCWeaponSelected)
        end

        surface.DrawTexturedRect(w - self.Border - 24, self.Border + 8, 16, 16)
    end

    self:ScanForNPCWeapons()
end

function PANEL:ScanForNPCWeapons()
    if self.HasScanned then return end
    self.HasScanned = true

    for _, v in pairs(list.Get("NPCUsableWeapons")) do
        if v.class == self:GetSpawnName() then
            self:SetIsNPCWeapon(true)
            break
        end
    end
end

function PANEL:PaintOver(w, h)
    self:DrawSelections()
end

function PANEL:ToTable(bigtable)
    local tab = {}
    tab.type = self:GetContentType()
    tab.nicename = self.m_NiceName
    tab.material = self.m_MaterialName
    tab.admin = self:GetAdminOnly()
    tab.spawnname = self:GetSpawnName()
    tab.weapon = self:GetNPCWeapon()
    table.insert(bigtable, tab)
end

function PANEL:Copy()
    local copy = vgui.Create("UCWepSel", self:GetParent())
    copy:SetContentType(self:GetContentType())
    copy:SetSpawnName(self:GetSpawnName())
    copy:SetName(self.m_NiceName, self:GetSpawnName())
    copy:SetMaterial(self.m_MaterialName)
    copy:SetNPCWeapon(self:GetNPCWeapon())
    copy:SetAdminOnly(self:GetAdminOnly())
    copy:CopyBase(self)
    copy.DoClick = self.DoClick
    copy.OpenMenu = self.OpenMenu
    copy.OpenMenuExtra = self.OpenMenuExtra

    return copy
end

vgui.Register("UCWepSel", PANEL, "DButton")