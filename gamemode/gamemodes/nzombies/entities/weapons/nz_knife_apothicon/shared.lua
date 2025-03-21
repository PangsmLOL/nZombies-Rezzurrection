SWEP.Base = "tfa_melee_base"
SWEP.Category = "nZombies Buyable Knives"
SWEP.PrintName = "Apothicon Sword"
SWEP.Author		= "Laby" --Author Tooltip
SWEP.ViewModel =  "models/weapons/bo3_melees/zodsword/c_zodsword_nz.mdl"
SWEP.WorldModel = "models/weapons/bo3_melees/zodsword/w_zodsword.mdl"
SWEP.ViewModelFlip = false
SWEP.ViewModelFOV = 70
SWEP.UseHands = true
SWEP.HoldType = "melee2"
SWEP.DrawCrosshair = true

SWEP.Primary.Directional = false

SWEP.Spawnable = true
SWEP.AdminOnly = false

SWEP.DisableIdleAnimations = true

SWEP.Secondary.CanBash = false
SWEP.Secondary.MaxCombo = 0
SWEP.Primary.MaxCombo = 0

SWEP.VMPos = Vector(0,0,0) --The viewmodel positional offset, constantly.  Subtract this from any other modifications to viewmodel position.

-- nZombies Stuff
SWEP.NZPreventBox		= true	-- If true, this gun won't be placed in random boxes GENERATED. Users can still place it in manually.


SWEP.Offset = { --Procedural world model animation, defaulted for CS:S purposes.
        Pos = {
        Up = 0.5,
        Right = 1.1,
        Forward = 3.2,
        },
        Ang = {
		Up = -90,
        Right = 185,
        Forward = -5
        },
		Scale = 1
}

function SWEP:Deploy()
	self:SendWeaponAnim(ACT_VM_DRAW_DEPLOYED)
	self.HolsterTime = CurTime() + (45/30)
			self:EmitSound("Weapon_BO3_SWORD.Draw")
	
end
SWEP.Primary.Attacks = {
	{
		['act'] = ACT_VM_MISSCENTER, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 20*5, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		["src"] = Vector(0, 0, 0), -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		["dir"] = Vector(-50, 0, -15), -- Trace direction/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 666, --This isn't overpowered enough, I swear!!
		["dmgtype"] = bit.bor(DMG_RADIATION),  --DMG_SLASH,DMG_CRUSH, etc.
		["delay"] = 6 / 30, --Delay
		['snd_delay'] = 5 / 30,
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "Weapon_BO3_KATANA.Swing", -- Sound ID
		["viewpunch"] = Angle(1.5, 2.5, 0), --viewpunch angle
		["end"] = 0.8, --time before next attack
		["hull"] = 1, --Hullsize
		['hitflesh'] = "Weapon_BO3_KATANA.Hit_Flesh",
		['hitworld'] ="Weapon_BO3_AXE.Hit"
	},
	{
		['act'] = ACT_VM_HITCENTER, -- Animation; ACT_VM_THINGY, ideally something unique per-sequence
		['len'] = 20*5, -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		["src"] = Vector(0, 0, 0), -- Trace source; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		["dir"] = Vector(-50, 0, -15), -- Trace direction/length; X ( +right, -left ), Y ( +forward, -back ), Z ( +up, -down )
		['dmg'] = 666, --This isn't overpowered enough, I swear!!
		["dmgtype"] = bit.bor(DMG_RADIATION),  --DMG_SLASH,DMG_CRUSH, etc.
		["delay"] = 6 / 30, --Delay
		['snd_delay'] = 5 / 30,
		['spr'] = true, --Allow attack while sprinting?
		['snd'] = "Weapon_BO3_KATANA.Swing", -- Sound ID
		["viewpunch"] = Angle(0, 0, 0), --viewpunch angle
		["end"] = 1.1, --time before next attack
		["hull"] = 1, --Hullsize
		['hitflesh'] = "Weapon_BO3_KATANA.Hit_Flesh",
		['hitworld'] ="Weapon_BO3_AXE.Hit"
	}
}

SWEP.ImpactDecal = "ManhackCut"

SWEP.SequenceRateOverride = {
	[ACT_VM_HITCENTER] = 28 / 30
}


if CLIENT then
	SWEP.WepSelectIconCSO = Material("vgui/killicons/tfa_cso_mastercombatknife")
	SWEP.DrawWeaponSelection = TFA_CSO_DrawWeaponSelection
end
