SWEP.Base = "arc9_eft_melee_base"
SWEP.Category = "ARC9 - Escape From Tarkov"
SWEP.SubCategory = ARC9:GetPhrase("eft_subcat_melee")
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.PrintName = ARC9:GetPhrase("eft_weapon_sp8") or "SP-8 Machete"
SWEP.Class = "eft_class_weapon_melee"
SWEP.Description = "eft_weapon_sp8_desc"

SWEP.ViewModel = "models/weapons/arc9/darsu_eft/c_melee_sp8.mdl"
SWEP.WorldModel = "models/weapons/arc9/darsu_eft/w_melee_sp8-8_lod0www.mdl" -- i forgor rename in qc

SWEP.DamageMax = 28

SWEP.BashDamage = 28
SWEP.BashLungeRange = 0
SWEP.BashRange = 0.5 / 0.0254 * 2
SWEP.PreBashTime = 0.3
SWEP.PostBashTime = 0.4

SWEP.Bash2Damage = 37
SWEP.Bash2LungeRange = 0
SWEP.Bash2Range = 0.6 / 0.0254 * 2
SWEP.PreBash2Time = 0.45
SWEP.PostBash2Time = 0.5

SWEP.CustomizeAng = Angle(87, -25, -94.3)
SWEP.CustomizePos = Vector(-8, 20, 15)
SWEP.CustomizeRotateAnchor = Vector(19, -4.28, -5.23)

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },

    ["draw"] = {
        Source = "draw_sword",
        EventTable = {
            { s = "weapons/darsu_eft/melee/knife_bayonet_equip.ogg", t = 0.25 },
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
        Source = "fire1"
    },
    ["bash2"] = {
        Source = "fire2"
    },

    ["impact"] = {
        Source = "fire1_hit"
    },
    ["impact2"] = {
        Source = "fire2_hit"
    },
}