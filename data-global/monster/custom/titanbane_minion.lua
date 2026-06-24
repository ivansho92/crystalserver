local mType = Game.createMonsterType("Titanbane Minion")
local monster = {}

monster.description = "a Titanbane Minion"
monster.experience = 0
monster.outfit = {
	lookType = 21,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 5000
monster.maxHealth = 5000
monster.race = "blood"
monster.corpse = 0
monster.speed = 500

monster.changeTarget = {
	interval = 4000,
	chance = 90,
}

monster.strategiesTarget = {
	nearest = 25,
	health = 25,
	damage = 25,
	random = 25,
}

monster.flags = {
	summonable = false,
	attackable = true,
	hostile = true,
	convinceable = false,
	pushable = false,
	rewardBoss = true,
	illusionable = false,
	canPushItems = true,
	canPushCreatures = true,
	staticAttackChance = 90,
	targetDistance = 1,
	runHealth = 0,
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
	chance = 30,
	{ text = "Meep? You will die!", yell = false },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 70, minDamage = 100, maxDamage = -600 },
	{ name = "walker skill reducer", interval = 2000, chance = 40, target = false },
	{ name = "mooh'tah master skill reducer", interval = 4000, chance = 50, target = false },
	{ name = "speed", interval = 5000, chance = 50, speedChange = -1000, range = 7, shootEffect = CONST_ANI_SUDDENDEATH, effect = CONST_ME_SMALLCLOUDS, target = false, duration = 30000 },	
}

monster.defenses = {
	defense = 50,
	armor = 50,
	mitigation = 0.07,
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 0 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 0 },
	{ type = COMBAT_FIREDAMAGE, percent = 0 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = -0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = true },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
