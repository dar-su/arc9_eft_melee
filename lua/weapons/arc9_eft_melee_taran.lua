SWEP.Base = "arc9_eft_melee_base"
SWEP.Category = "ARC9 - Escape From Tarkov"
SWEP.SubCategory = ARC9:GetPhrase("eft_subcat_melee")
SWEP.Spawnable = true
SWEP.AdminOnly = false

ARC9:AddPhrase("eft_weapon_taran", "\"PR-Taran\"", "en")
ARC9:AddPhrase("eft_weapon_taran", "\"ПР-Таран\"", "ru")
ARC9:AddPhrase("eft_weapon_taran", "PW-Tawan :3", "uwu")

SWEP.PrintName = ARC9:GetPhrase("eft_weapon_taran") or "PR-Taran baton"
SWEP.Class = ARC9:GetPhrase("eft_class_weapon_melee")
SWEP.Description = [[The PR-Taran baton with side handle is used by law enforcement agencies for protection and crowd control.]]

SWEP.ViewModel = "models/weapons/arc9/darsu_eft/c_melee_taran.mdl"
SWEP.WorldModel = "models/weapons/arc9/darsu_eft/w_melee_taran.mdl"

SWEP.DamageMax = 26

SWEP.BashDamage = 26
SWEP.BashLungeRange = 0
SWEP.BashRange = 0.6 / 0.0254 * 2
SWEP.PreBashTime = 0.3
SWEP.PostBashTime = 0.4

SWEP.Bash2Damage = 43
SWEP.Bash2LungeRange = 0
SWEP.Bash2Range = 0.65 / 0.0254 * 2
SWEP.PreBash2Time = 0.5
SWEP.PostBash2Time = 0.6

SWEP.CustomizeAng = Angle(87, -25, -70)
SWEP.CustomizePos = Vector(2, 28, 15.5)
SWEP.CustomizeRotateAnchor = Vector(19, -4.28, -5.23)

local path = "weapons/darsu_eft/melee/"
SWEP.MeleeSwingSound = {path .. "taran_swing_01.ogg", path .. "taran_swing_02.ogg", path .. "taran_swing_03.ogg"}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },

    ["draw"] = {
        Source = "draw_sword",
        EventTable = {
            { s = "weapons/darsu_eft/melee/knife_bayonet_equip.ogg", t = 0 },
        }
    },

    ["holster"] = {
        Source = "holster",
        EventTable = {
            { s = "weapons/darsu_eft/melee/knife_bayonet_holster.ogg", t = 0.25 },
        }
    },

    ["inspect"] = {
        Source = "inspect_sword"
    },

    ["bash"] = {
        Source = "fire1_axe"
    },
    ["bash2"] = {
        Mult = 0.85,
        Source = "fire_voodoo"
    },

    ["impact"] = {
        Source = "fire1_axe_hit"
    },
    ["impact2"] = {
        Source = "fire_voodoo_hit"
    },
}


-- thing to make everyone jam guns if someone hold the taran,,,,,, 
-- in original this works only on boss - boss gives nearby players panic buff and their guns jam


local enabletaranjam = ARC9EFTBASE and GetConVar("arc9_eft_taran_jam") or CreateConVar("arc9_eft_taran_jam", "1", {FCVAR_ARCHIVE, FCVAR_REPLICATED}, "for melee pack - if ANY player draws PR-Taran, this will make all guns forcefully jammed (Sets arc9 jam chance modifier to 9999, sets to prev value when no holding taran).", 0, 1)

local non9999cvarvalue = 1
local malfconvar = GetConVar("arc9_mod_malfunction")

local fuckthis = 0
hook.Add("Think", "arc9eftjammer", function()
    if SERVER and fuckthis < CurTime() then
        fuckthis = CurTime() + 1.5

        local funnycheck = false
        
        if enabletaranjam:GetBool() then
            -- for i, v in (player.Iterator and player.Iterator() or ipairs(player.GetAll())) do
            for _, ply in ipairs(player.GetAll()) do
                if IsValid(ply) and IsValid(ply:GetActiveWeapon()) and ply:GetActiveWeapon():GetClass() == "arc9_eft_melee_taran" then
                    funnycheck = true
                    break
                end
            end
        end

        local cvarval = malfconvar:GetFloat() or 1

        if cvarval != 99999 then 
            non9999cvarvalue = cvarval 
            if funnycheck then
                malfconvar:SetFloat(99999)
                -- print("settng to 999")
            elseif cvarval != non9999cvarvalue then
                malfconvar:SetFloat(non9999cvarvalue)
                -- print("Reseting to2 ", non9999cvarvalue)
            end
        else
            if !funnycheck then
                malfconvar:SetFloat(non9999cvarvalue)
                -- print("Reseting to ", non9999cvarvalue)
            end
        end
    end
end)
