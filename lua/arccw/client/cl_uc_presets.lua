local presetData = {
    ["arccw_ud_m16"] = {
        ["M16A4"] =
            "ud_m16_rs\n"
            .."ud_m16_barrel_tactical_a4"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n",
        ["M16A1"] =
            "\n"
            .."ud_m16_barrel_classic\n"
            .."\n"
            .."ud_m16_receiver_a1\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."ud_m16_mag_20\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n",
        ["M4A1"] = 
            "ud_m16_rs\n"
            .."ud_m16_barrel_tactical\n"
            .."\n"
            .."ud_m16_receiver_auto"
            .."\n"
            .."\n"
            .."ud_m16_grip_ergo\n"
            .."ud_m16_stock_carbine\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n",
        ["Service Rifle"] =
            "\n"
            .."ud_m16_barrel_wood\n"
            .."\n"
            .."ud_m16_receiver_semi\n"
            .."\n"
            .."\n"
            .."ud_m16_grip_wood\n"
            .."ud_m16_stock_wood\n"
            .."ud_m16_mag_20\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."ud_m16_charm_ch",
        ["R0635"] = 
            "\n"
            .."ud_m16_barrel_cqbr\n"
            .."\n"
            .."ud_m16_receiver_9mm\n"
            .."\n"
            .."\n"
            .."ud_m16_grip_ergo\n"
            .."ud_m16_stock_carbine\n"
            .."ud_m16_mag_9mm_32\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n",
        ["ADAR 2-15"] =
            "ud_m16_rs\n"
            .."ud_m16_barrel_adar\n"
            .."\n"
            .."ud_m16_receiver_semi\n"
            .."\n"
            .."\n"
            .."\n"
            .."ud_m16_stock_adar\n"
            .."ud_m16_mag_20\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n",
        ["M231 FPW"] = 
            "\n"
            .."ud_m16_barrel_fpw\n"
            .."\n"
            .."ud_m16_receiver_auto\n"
            .."\n"
            .."\n"
            .."ud_m16_stock_231\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n",
    },

    ["arccw_ur_ak"] = {
        ["AKM"] = 
            "\n"
            .."\n"
            .."ur_ak_muzzle_akm\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."ur_ak_grip_akm\n"
            .."ur_ak_stock_akn\n"
            .."ur_ak_cover_ribbed"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n",
        ["AK-74"] = 
            "\n"
            .."\n"
            .."ur_ak_muzzle_ak74\n"
            .."ur_ak_cal_545\n"
            .."\n"
            .."\n"
            .."\n"
            .."ur_ak_grip_akm\n"
            .."ur_ak_stock_akn\n"
            .."ur_ak_cover_ribbed"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n",
        ["AKS-74U"] = 
            "\n"
            .."ur_ak_barrel_krinkov\n"
            .."\n"
            .."ur_ak_cal_545\n"
            .."\n"
            .."\n"
            .."\n"
            .."ur_ak_grip_akm\n"
            .."ur_ak_stock_aks\n"
            .."ur_ak_cover_ribbed"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n",
        ["PP-19"] = 
            "\n"
            .."ur_ak_barrel_vityaz\n"
            .."\n"
            .."ur_ak_cal_9mm\n"
            .."\n"
            .."\n"
            .."\n"
            .."ur_ak_grip_alpha\n"
            .."ur_ak_stock_aks\n"
            .."ur_ak_cover_alpha\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n",
        ["RPKM"] = 
            "\n"
            .."ur_ak_barrel_rpk\n"
            .."\n"
            .."\n"
            .."ur_ak_mag_762_75,1,-1\n"
            .."\n"
            .."\n"
            .."ur_ak_grip_akm\n"
            .."ur_ak_stock_rpk\n"
            .."ur_ak_cover_ribbed"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n",
        ["VEPR .366"] = 
            "\n"
            .."ur_ak_barrel_vepr\n"
            .."\n"
            .."ur_ak_cal_366\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."ur_ak_stock_vepr"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n",
        ["AK-12"] = 
            "\n"
            .."ur_ak_barrel_ak12\n"
            .."\n"
            .."ur_ak_cal_545_ak12\n"
            .."ur_ak_mag_545_ak12,1,-1\n"
            .."\n"
            .."\n"
            .."ur_ak_grip_ak12\n"
            .."ur_ak_stock_ak12\n"
            .."ur_ak_cover_ak12\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n"
            .."\n",

    },
} -- The things I have to go through for readability :defeat:


for wep,data in pairs(presetData) do
    local filePath = "arccw_presets/"..wep

    if !file.Exists(filePath,"DATA") then -- This code will do nothing if the weapon's preset folder exists, even if it's empty
        print("Urban Renewal: Writing default presets for "..wep)
        file.CreateDir("arccw_presets/"..wep)

        for name,atts in pairs(data) do
            file.Write(filePath.."/"..name..".txt",atts)
        end
    end
end

-- TODO: Make preset generation prompted instead of automatic

matproxy.Add({
    name = "UC_Weapon_Color", 
    init = function(self, mat, values)
        self.ResultTo = values.resultvar
    end,
    bind = function(self, mat, ent)
       if IsValid(ent) and ent.ArcCW and IsValid(ent:GetOwner()) then
           mat:SetVector(self.ResultTo, (ent:GetOwner():GetPlayerColor()*.9))
       end
   end 
})