local mType = Game.createMonsterType("Black Deity")
local monster = {}

monster.name = "Black Deity"
monster.description = "a black deity"
monster.experience = 10000000
monster.outfit = {
    lookType = 130,
    lookHead = 95,
    lookBody = 95,
    lookLegs = 95,
    lookFeet = 95,
    lookAddons = 3,
    lookMount = 230
}

monster.events = {
	"DraconicEscape",
}

monster.health = 500000
monster.maxHealth = 500000
monster.runHealth = 0
monster.race = "fire"
monster.corpse = 3058
monster.speed = 2400
monster.summonCost = 0

monster.changeTarget = {
	interval = 6000,
	chance = 100,
}

monster.strategiesTarget = {
	nearest = 25,
	health = 25,
	damage = 25,
	random = 25,
}

monster.flags = {
    attackable = true,
    hostile = true,
    summonable = false,
    convinceable = false,
    pushable = false,
    rewardBoss = true,
    illusionable = false,
    canPushItems = true,
    canPushCreatures = true,
    staticAttackChance = 95,
    targetDistance = 2,
    healthHidden = false,
    canWalkOnEnergy = true,
    canWalkOnFire = true,
    canWalkOnPoison = true
}

monster.light = {
    level = 4,
    color = 215
}

monster.summon = {
	maxSummons = 1,
	summons = {
		{ name = "infernal demon", chance = 20, interval = 3000, count = 1 },
	},
}

monster.voices = {
    interval = 2000,
    chance = 50,
    {text = "Feel the wrath of the Black Deity!", yell = false},
	{ text = "YOU ARE DOOMED!", yell = true }
}

monster.immunities = {
    {type = "paralyze", condition = true},
    {type = "outfit", condition = false},
    {type = "invisible", condition = true},
    {type = "drunk", condition = true},
    {type = "bleed", condition = false}
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.attacks = {
	{ name = "melee", interval = 4000, chance = 50, minDamage = 2200, maxDamage = -4250 },
	{ name = "condition", type = CONDITION_FIRE, interval = 1000, chance = 30, minDamage = -1500, maxDamage = -2500, range = 2, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_BLOCKHIT, target = false },
	{ name = "combat", interval = 4000, chance = 70, type = COMBAT_MANADRAIN, minDamage = -1500, maxDamage = -2900, range = 9, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 1500, chance = 80, type = COMBAT_ENERGYDAMAGE, minDamage = -1700, maxDamage = -3450, length = 8, spread = 3, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "combat", interval = 3500, chance = 55, type = COMBAT_EARTHDAMAGE, minDamage = -1550, maxDamage = -2800, range = 1, radius = 1, shootEffect = CONST_ANI_POISON, effect = CONST_ME_POISONAREA, target = true },
	{ name = "nighthunter wave", interval = 5000, chance = 65, minDamage = -1500, maxDamage = -2775 },
	{ name = "drunk", interval = 1000, chance = 50, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false },	
	{ name = "combat", interval = 3000, chance = 60, type = COMBAT_ENERGYDAMAGE, minDamage = -1575, maxDamage = -2905, range = 7, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "combat", interval = 2000, chance = 65, type = COMBAT_LIFEDRAIN, minDamage = -2000, maxDamage = -3250, length = 8, spread = 4, effect = CONST_ME_HITBYPOISON, target = false },
	{ name = "outfit", interval = 1000, chance = 30, radius = 4, effect = CONST_ME_LOSEENERGY, target = false, duration = 2000, outfitMonster = "gravedigger" },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_LIFEDRAIN, minDamage = -1550, maxDamage = -2800, radius = 9, effect = CONST_ME_POFF, target = false },
	-- poison
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 65, minDamage = -1000, maxDamage = -2600, range = 9, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "combat", interval = 2000, chance = 70, type = COMBAT_LIFEDRAIN, minDamage = -1300, maxDamage = -2500, range = 9, radius = 3, effect = CONST_ME_DRAWBLOOD, target = false },
	-- energy damage
	{ name = "condition", type = CONDITION_ENERGY, interval = 2000, chance = 60, minDamage = -1200, maxDamage = -2400, radius = 6, effect = CONST_ME_ENERGYHIT, target = false },
	{ name = "speed", interval = 2000, chance = 70, speedChange = -1000, radius = 4, effect = CONST_ME_MAGIC_RED, target = true, duration = 10000 },	
	-- fire
	{ name = "condition", type = CONDITION_FIRE, interval = 3000, chance = 70, minDamage = -1500, maxDamage = -2600, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
}

monster.defenses = {
    defense = 100,
    armor = 100,
	--	mitigation = ???,
	{ name = "combat", interval = 8000, chance = 90, type = COMBAT_HEALING, minDamage = 30000, maxDamage = 50000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 5000, chance = 40, effect = CONST_ME_MAGIC_BLUE },
	{ name = "speed", interval = 1000, chance = 60, speedChange = 2800, effect = CONST_ME_MAGIC_RED, target = false, duration = 20000 },
}

monster.loot = {
	{ id = 39698, chance = 10000, unique = true }, -- draconic blessed torch
	{ id = 8076, chance = 14000 }, -- spellscroll of prophecies
	{ id = 7427, chance = 12000 }, -- chaos mace
	{ id = 37317, chance = 12000, maxCount = 1 }, -- tibia coin (ruleta)
	{ id = 22118, chance = 8000, maxCount = 5 }, -- tibia coin agregable
	{ id = 22118, chance = 8000, maxCount = 5 }, -- tibia coin agregable
	{ id = 22721, chance = 12000, maxCount = 5 }, -- gold token
	{ id = 37317, chance = 12000, maxCount = 2 }, -- tibia coin (ruleta)
	{ id = 22118, chance = 8000, maxCount = 5 }, -- tibia coin agregable
	{ id = 22118, chance = 8000, maxCount = 5 }, -- tibia coin agregable
	{ id = 32516, chance = 12000, maxCount = 5 }, -- silver token
	{ id = 8098, chance = 12000 }, -- demonwing axe
	{ id = 8041, chance = 12000 }, -- greenwood coat
	{ id = 3029, chance = 12000, maxCount = 30 }, -- small sapphire
	{ id = 3026, chance = 12000, maxCount = 30 }, -- white pearl
	{ id = 7407, chance = 10000 }, -- haunted blade
	{ id = 8096, chance = 10000 }, -- hellforged axe
	{ id = 3010, chance = 18000 }, -- emerald bangle
	{ id = 823, chance = 18000 }, -- glacier kilt
	{ id = 822, chance = 18000 }, -- lightning legs
	{ id = 3439, chance = 18000 }, -- phoenix shield
	{ id = 8090, chance = 18000 }, -- spellbook of dark mysteries
	{ id = 812, chance = 18000 }, -- terra legs
	{ id = 8102, chance = 16000 }, -- emerald sword
	{ id = 7405, chance = 16000 }, -- havoc blade
	{ id = 7451, chance = 16000 }, -- shadow sceptre
	{ id = 7411, chance = 10000 }, -- ornamented axe
	{ id = 3033, chance = 10000, maxCount = 34 }, -- small amethyst
	{ id = 9057, chance = 10000, maxCount = 20 }, -- small topaz
	{ id = 7382, chance = 8000 }, -- demonrage sword
	{ id = 7422, chance = 8000 }, -- jade hammer
	{ id = 3035, chance = 8000, maxCount = 58 }, -- platinum coin
	{ id = 7423, chance = 8000 }, -- skullcrusher
	{ id = 5944, chance = 8000, maxCount = 9 }, -- soul orb
	{ id = 3043, chance = 10000, maxCount = 6 }, -- crystal coin
	{ id = 16124, chance = 10000, maxCount = 15 }, -- blue crystal splinter
	{ id = 7368, chance = 10000, maxCount = 100 }, -- assassin star
	{ id = 6499, chance = 1000, maxCount = 2 }, -- demonic essence
	{ id = 7643, chance = 10000, maxCount = 100 }, -- ultimate health potion
	{ id = 238, chance = 10000, maxCount = 100 }, -- great mana potion
	{ id = 7642, chance = 10000, maxCount = 100 }, -- great spirit potion
	{ id = 20063, chance = 2000, maxCount = 3 }, -- dream matter
	{ id = 3041, chance = 10000, maxCount = 2 }, -- blue gem
	{ id = 16122, chance = 10000, maxCount = 10 }, -- green crystal splinter
	{ id = 16120, chance = 10000, maxCount = 15 }, -- violet crystal shard
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)