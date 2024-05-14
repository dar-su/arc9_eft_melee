SWEP.Base = "arc9_eft_melee_base"
SWEP.Category = "ARC9 - Escape From Tarkov"
SWEP.SubCategory = ARC9:GetPhrase("eft_subcat_melee")
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.PrintName = "Superfors Hammer" -- Superfors DB 2020 Dead Blow Hammer
SWEP.Class = ARC9:GetPhrase("eft_class_weapon_melee")
SWEP.Description = [[Superfors DB 2020 Dead Blow Hammer
The hammer is coated with urethane which provides a "thud" using steel balls to cushion the impact and reduce the vibration recoil to the handle.]]

SWEP.ViewModel = "models/weapons/arc9/darsu_eft/c_melee_hultafors.mdl"
SWEP.WorldModel = "models/weapons/arc9/darsu_eft/w_melee_hultafors.mdl"

SWEP.ViewModelFOVBase = 70

SWEP.ActivePos = Vector(2.7, -1, 0.1)
SWEP.ActiveAng = Angle(0, 0, 0)

-- SWEP.WorldModelOffset = {
--     Pos = Vector(-9.5, 5.5, -14.5),
--     Ang = Angle(20, -10, 195),
--     TPIKPos = Vector(17, 1, 0),
--     TPIKAng = Angle(-5, 70, 90),
-- }
-- SWEP.HoldType = "duel"


SWEP.WorldModelOffset = {
    Pos = Vector(-16.5, 3.5, -14.5),
    Ang = Angle(0, 50, 244),
    TPIKPos = Vector(8, -1, 7),
    TPIKAng = Angle(-5, 70, 90),
}
SWEP.HoldType = "melee2"

SWEP.HoldTypeSprint = "normal"
SWEP.HoldTypeHolstered = "normal"
SWEP.HoldTypeCustomize = "duel"

SWEP.SpeedMult = 0.85

SWEP.AnimShoot = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
SWEP.AnimMelee = ACT_HL2MP_GESTURE_RANGE_ATTACK_SHOTGUN
SWEP.AnimReload = false
SWEP.AnimDraw = false

SWEP.DamageMax = 125 / 2

SWEP.BashDamage = 103 / 2
SWEP.BashLungeRange = 0
SWEP.BashRange = 0.8 / 0.0254 * 2
SWEP.PreBashTime = 0.43
SWEP.PostBashTime = 0.6

SWEP.Bash2Damage = 125 / 2
SWEP.Bash2LungeRange = 0
SWEP.Bash2Range = 1 / 0.0254 * 2
SWEP.PreBash2Time = 1.1
SWEP.PostBash2Time = 0.85

SWEP.CustomizeAng = Angle(87, -25, -94.3)
SWEP.CustomizePos = Vector(-12, 44, 16)
SWEP.CustomizeSnapshotFOV = 80
SWEP.CustomizeRotateAnchor = Vector(19, -4.28, -5.23)

local path = "weapons/darsu_eft/melee/"

SWEP.MeleeHitSound = {path .. "body1.ogg", path .. "body2.ogg", path .. "body3.ogg", path .. "body4.ogg", path .. "body5.ogg", path .. "body6.ogg"}
SWEP.MeleeHitWallSound = {path .. "knife_bayonet_hit1.ogg", path .. "knife_bayonet_hit2.ogg"}
SWEP.MeleeSwingSound = false
SWEP.Hook_BashHit = function(self, data)
    local dmg = data.dmg
    local ent = data.tr.Entity
    if IsValid(ent) and ent:IsPlayer() then
        net.Start("arc9eftexplosion")
        net.WriteFloat(1)
        net.WriteUInt(20, 9)
        net.WriteBool(false)
        net.WriteEntity(self)
        net.WriteBool(false)
        net.Send(ent)

        ent:ViewPunch(Angle(1.5, 0, -7.5) * 1)
    end
end

local swing = {path .. "scythe_whoosh_01.ogg", path .. "scythe_whoosh_02.ogg", path .. "scythe_whoosh_03.ogg", path .. "scythe_whoosh_04.ogg", path .. "scythe_whoosh_05.ogg"}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },

    ["draw"] = {
        Source = {"draw"},
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
        Source = "inspect"
    },
    
    ["bash"] = {
        Source = "fire1",
        EventTable = {
            { s = swing, t = 9/30 },
        }
    },
    ["bash2"] = {
        Source = "fire2",
        EventTable = {
            { s = swing, t = 25/30 },
        }
    },

    -- ["impact"] = {
    --     Source = "fire1_hit"
    -- },
    -- ["impact2"] = {
    --     Source = "fire2_hit"
    -- },
}