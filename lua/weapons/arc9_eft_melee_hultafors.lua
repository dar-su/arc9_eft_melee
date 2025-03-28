SWEP.Base = "arc9_eft_melee_base"
SWEP.Category = "ARC9 - Escape From Tarkov"
SWEP.SubCategory = ARC9:GetPhrase("eft_subcat_melee")
SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.PrintName = "Superfors Hammer" -- Superfors DB 2020 Dead Blow Hammer
SWEP.Class = ARC9:GetPhrase("eft_class_weapon_melee")
SWEP.Description = [[Superfors DB 2020 Dead Blow Hammer
The hammer is coated with urethane which provides a "thud" using steel balls to cushion the impact and reduce the vibration recoil to the handle.

Not usable in real EFT, but became usable by ChocoMilk in SPT mod with animations by Fnuxray!]]

SWEP.Credits = { 
    [ARC9:GetPhrase("eft_trivia_author") .. "1"] = "Darsu", 
    [ARC9:GetPhrase("eft_trivia_assets") .. "2"] = "Battlestate Games LTD",
    ["Custom Animations" .. "0"] = "Fnuxray", 
}


SWEP.ViewModel = "models/weapons/arc9/darsu_eft/c_melee_hultafors.mdl"
SWEP.WorldModel = "models/weapons/arc9/darsu_eft/w_melee_hultafors.mdl"

SWEP.ViewModelFOVBase = 70

SWEP.ActivePos = Vector(1.0, 2, 0.5)
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
SWEP.PreBashTime = 0.55
SWEP.PostBashTime = 0.9

SWEP.Bash2Damage = 125 / 2
SWEP.Bash2LungeRange = 0
SWEP.Bash2Range = 1 / 0.0254 * 2
SWEP.PreBash2Time = 0.82
SWEP.PostBash2Time = 1.15

SWEP.CustomizeAng = Angle(87, -25, -94.3)
SWEP.CustomizePos = Vector(-10, 44, 14)
SWEP.CustomizeSnapshotFOV = 80
SWEP.CustomizeRotateAnchor = Vector(19, -4.28, -5.23)

local path = "weapons/darsu_eft/melee/"

SWEP.MeleeHitSound = {path .. "hammer_hit_body1.ogg", path .. "hammer_hit_body2.ogg"}
SWEP.MeleeHitWallSound = {path .. "hammer_hit_wall1.ogg", path .. "hammer_hit_wall2.ogg"}
SWEP.MeleeSwingSound = false
SWEP.Hook_BashHit = function(self, data)
    local dmg = data.dmg
    local ent = data.tr.Entity
    if IsValid(ent) and ent:IsPlayer() then
        if EFTMED then
            EFTMED.EffectGive(ent, "EFTMEDConcussion", "EFTMEDHPhead", 20)
        else
            net.Start("arc9eftexplosion")
            net.WriteFloat(1)
            net.WriteUInt(20, 9)
            net.WriteBool(false)
            net.WriteEntity(self)
            net.WriteBool(false)
            net.Send(ent)
        end
        ent:ViewPunch(Angle(1.5, 0, -7.5) * 1)
    end
end

local swing = {path .. "hammer_swing1.ogg", path .. "hammer_swing2.ogg", path .. "hammer_swing3.ogg"}
local charge = {path .. "hammer_charge1.ogg", path .. "hammer_charge2.ogg", path .. "hammer_charge3.ogg"}

SWEP.Animations = {
    ["idle"] = {
        Source = "idle",
    },

    ["draw"] = {
        Source = {"draw"},
        EventTable = {
            { s = charge, t = 0.25 },
            { s = "weapons/darsu_eft/melee/hammer_charge3.ogg", t = 24/24 },
            { s = "arc9_eft_shared/weap_handon.ogg", t = 34/24, v = 0.25 },
        }
    },

    ["holster"] = {
        Source = "holster",
        MinProgress = 0.8,
        EventTable = {
            { s = "arc9_eft_shared/weap_handoff.ogg", t = 0, v = 0.5 },
            { s = charge, t = 0.3 },
        }
    },

    ["inspect"] = {
        Source = "inspect",
        EventTable = {
            { s = "weapons/darsu_eft/melee/hammer_charge1.ogg", t = 2/24, v = 0.25 },
            { s = "arc9_eft_shared/weapon_generic_spin5.ogg", t = 34/30 },
            { s = "arc9_eft_shared/weapon_generic_spin6.ogg", t = 80/30 },
        }
    },
    
    ["bash"] = {
        Source = "fire1",
        EventTable = {
            { s = charge, t = 0 },
            { s = swing, t = 9/30 },
            { s = "weapons/darsu_eft/melee/hammer_charge2.ogg", t = 40/30, v = 0.25 },
        }
    },
    ["bash_combo"] = {
        Source = "fire1_combo",
        EventTable = {
            { s = charge, t = 0 },
            { s = swing, t = 17/24-0.3 },
            { s = "arc9_eft_shared/weapon_generic_spin5.ogg", t = 37/24-0.5, v = 0.5 },
        }
    },
    ["bash2"] = {
        Source = "fire2",
        EventTable = {
            { s = charge, t = 0.1 },
            { s = swing, t = 17/30 },
            { s = "weapons/darsu_eft/melee/hammer_charge2.ogg", t = 40/30, v = 0.33 },
        }
    },
}

SWEP.Hook_Bash = function(self)
    if self:GetNextPrimaryFire() - CurTime() < 1 then
        timer.Simple(0.15, function() 
            if IsValid(self) then
                local owner = self:GetOwner()
                if IsValid(owner) then
                    if owner:KeyDown(IN_ATTACK) then
                        self:MeleeAttack(true)
                        self:PlayAnimation("bash_combo", 1 / self:GetProcessedValue("BashSpeed"), false)
                        self:SetNextPrimaryFire(CurTime() + 2)
                    end
                end
            end
        end)
    end
end