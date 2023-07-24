SWEP.Base = "arc9_eft_melee_base"
SWEP.Category = "ARC9 - Escape From Tarkov"
SWEP.SubCategory = ARC9:GetPhrase("eft_subcat_melee")
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.PrintName = ARC9:GetPhrase("eft_weapon_rebel") or "Red Rebel ice pick"
SWEP.Class = ARC9:GetPhrase("eft_class_weapon_melee")
SWEP.Description = [[A perfectly balanced ice axe, the tip is made of a single piece of hardened metal.]]

SWEP.ViewModel = "models/weapons/arc9/darsu_eft/c_melee_rebel_axe.mdl"
SWEP.WorldModel = "models/weapons/arc9/darsu_eft/w_melee_rebel_axe.mdl"

SWEP.DamageMax = 25

SWEP.BashDamage = 25
SWEP.BashLungeRange = 0
SWEP.BashRange = 0.6 / 0.0254 * 2
SWEP.PreBashTime = 0.3
SWEP.PostBashTime = 0.4

SWEP.Bash2Damage = 30
SWEP.Bash2LungeRange = 0
SWEP.Bash2Range = 0.65 / 0.0254 * 2
SWEP.PreBash2Time = 0.3
SWEP.PostBash2Time = 0.5

SWEP.CustomizeAng = Angle(87, -25, -70)
SWEP.CustomizePos = Vector(0, 30, 18)
SWEP.CustomizeRotateAnchor = Vector(19, -4.28, -5.23)

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },

    ["draw"] = {
        Source = "draw",
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
        Source = "inspect_axe"
    },

    ["bash"] = {
        Source = "fire1_axe"
    },
    ["bash2"] = {
        Mult = 0.85,
        Source = "fire2_axe"
    },

    ["impact"] = {
        Source = "fire1_axe_hit"
    },
    ["impact2"] = {
        Source = "fire2_axe_hit"
    },
}