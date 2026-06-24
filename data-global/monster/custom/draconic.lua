local mType = Game.createMonsterType("Draconic")
local monster = {}

monster.description = "a draconic"
monster.experience = 60000
monster.outfit = {
	lookType = 39,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 8000
monster.maxHealth = 8000
monster.race = "blood"
monster.corpse = 0
monster.speed = 600

monster.changeTarget = {
	interval = 4000,
	chance = 70,
}

monster.strategiesTarget = {
	nearest = 100,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = false,
	illusionable = true,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 80,
	targetDistance = 5,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = true,
	canWalkOnPoison = true,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "Can you kill me?!", yell = true },
	{ text = "HAHAHA", yell = true },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 200, maxDamage = -350 },
	{ name = "combat", interval = 3000, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -180, maxDamage = -350, range = 7, radius = 5, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "drunk", interval = 2000, chance = 60, minDamage = -100, maxDamage = -250, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false },	
	{ name = "speed", interval = 2000, chance = 70, speedChange = -500, radius = 1, effect = CONST_ME_MAGIC_RED, target = true, duration = 4000 },	
	{ name = "combat", interval = 2000, chance = 35, type = COMBAT_FIREDAMAGE, minDamage = -300, maxDamage = -500, radius = 4, effect = CONST_ME_FIREAREA, target = false },
}

monster.defenses = {
	defense = 45,
	armor = 50,
	mitigation = 0.5,
	{ name = "combat", interval = 4000, chance = 40, type = COMBAT_HEALING, minDamage = 350, maxDamage = 950, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 85 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 85 },
	{ type = COMBAT_EARTHDAMAGE, percent = 85 },
	{ type = COMBAT_FIREDAMAGE, percent = 85 },
	{ type = COMBAT_LIFEDRAIN, percent = 85 },
	{ type = COMBAT_MANADRAIN, percent = 85 },
	{ type = COMBAT_DROWNDAMAGE, percent = 85 },
	{ type = COMBAT_ICEDAMAGE, percent = 85 },
	{ type = COMBAT_HOLYDAMAGE, percent = 85 },
	{ type = COMBAT_DEATHDAMAGE, percent = 85 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
