AddCSLuaFile()

SWEP.Base = "arc9_base"
SWEP.Spawnable = true
SWEP.NotForNPCs = true
SWEP.Category = "ARC9 - Escape From Tarkov"
SWEP.SubCategory = ARC9:GetPhrase("eft_subcat_melee")
SWEP.Credits = { 
    [ARC9:GetPhrase("eft_trivia_author") .. "1"] = "Darsu", 
    [ARC9:GetPhrase("eft_trivia_assets") .. "2"] = "Battlestate Games LTD", 
    [ARC9:GetPhrase("eft_trivia_help") .. "3"] = "Mal0", 
    [ARC9:GetPhrase("eft_trivia_arc9") .. "4"] = "Arctic",
}

SWEP.PrintName = ARC9:GetPhrase("eft_weapon_sp8") or "SP-8 Machete"
SWEP.Class = ARC9:GetPhrase("eft_class_weapon_melee")
SWEP.Trivia = {}

SWEP.Description = [[SP-8 is a survival machete made of a single piece of high carbon steel. Manufactured by Ontario Knife Company.]]

SWEP.BarrelLength = 2
SWEP.Slot = 0
SWEP.WorldModel = "models/weapons/w_knife_t.mdl"
SWEP.ViewModel = "models/weapons/arc9/darsu_eft/c_melee_sp8.mdl"
SWEP.ViewModelFOVBase = 65
SWEP.MirrorVMWM = true
SWEP.DefaultBodygroups = "00000000000000"

SWEP.NoTPIKVMPos = true
-- SWEP.NoTPIK = true
SWEP.CanLean = false

SWEP.Ammo = ""
SWEP.ChamberSize = 0
SWEP.ClipSize = -1
SWEP.SupplyLimit = 0 
SWEP.SecondarySupplyLimit = 0

SWEP.Firemodes = { {  Mode = 1, PrintName = "Melee" } }

-------------------------- HANDLING

SWEP.FreeAimRadius = 0

SWEP.SprintToFireTime = 0.25

SWEP.SpeedMult = 1
SWEP.SpeedMultSights = 0.75
SWEP.SpeedMultShooting = 0.7
SWEP.SpeedMultMelee = 0.75
SWEP.SpeedMultCrouch = 1
SWEP.SpeedMultBlindFire = 1

SWEP.ShootWhileSprint = false 

-------------------------- MELEE

SWEP.Bash = true
SWEP.PrimaryBash = true
SWEP.Bash2 = true
SWEP.SecondaryBash = true

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

local multmelee = GetConVar("arc9_eft_mult_melee")
SWEP.DamageMaxHook = function(swep, dmg) return dmg * (multmelee:GetFloat() or 1) end
SWEP.BashDamageHook = function(swep, dmg) return dmg * (multmelee:GetFloat() or 1) end
SWEP.Bash2DamageHook = function(swep, dmg) return dmg * (multmelee:GetFloat() or 1) end

local path = "weapons/darsu_eft/melee/"

SWEP.MeleeHitSound = {path .. "body1.ogg", path .. "body2.ogg", path .. "body3.ogg", path .. "body4.ogg", path .. "body5.ogg", path .. "body6.ogg"}
SWEP.MeleeHitWallSound = {path .. "knife_bayonet_hit1.ogg", path .. "knife_bayonet_hit2.ogg"}
SWEP.MeleeSwingSound = path .. "knife_bayonet_swing1.ogg"

-------------------------- POSITIONS

SWEP.HasSights = false

SWEP.ActivePos = Vector(-0.7, -4.1, -0.27)
SWEP.ActiveAng = Angle(0, 0, 0)

SWEP.SprintAng = Angle(0, -40, -30)
SWEP.SprintPos = Vector(-11.7, -2, -2)

SWEP.NearWallAng = Angle(0, 55, 0)
SWEP.NearWallPos = Vector(0, 0, -15)

SWEP.CrouchPos = Vector(-0.7, -3.8, .35)
SWEP.CrouchAng = Angle(0, 0, -1)

SWEP.CustomizeAng = Angle(87, -25, -94.3)
SWEP.CustomizePos = Vector(-8, 20, 15)
SWEP.CustomizeSnapshotFOV = 65
SWEP.CustomizeRotateAnchor = Vector(19, -4.28, -5.23)


SWEP.TPIKforcelefthand = true
SWEP.TPIKParentToSpine4 = true  

SWEP.WorldModelOffset = {
    Pos = Vector(-10, 5, -14),
    Ang = Angle(20, -10, 195),
    TPIKPos = Vector(17, 1, 1),
    TPIKAng = Angle(0, 90, 90),
    Scale = 1
}


-------------------------- HoldTypes

SWEP.HoldType = "duel"
SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeHolstered = "normal"
SWEP.HoldTypeCustomize = "duel"

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
SWEP.AnimMelee = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
SWEP.AnimReload = false
SWEP.AnimDraw = false

-------------------------- SOUNDS

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },

    ["draw"] = {
        Source = "draw_sword",
        EventTable = {
            { s = path .. "knife_bayonet_equip.ogg", t = 0.25 },
        }
    },

    ["holster"] = {
        Source = "holster",
        EventTable = {
            { s = path .. "knife_bayonet_holster.ogg", t = 0.25 },
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

SWEP.AttachmentElements = {}