local mType = Game.createMonsterType("Snake God Essence")
local monster = {}

monster.description = "Snake God Essence"
monster.experience = 7410
monster.outfit = {
	lookType = 356,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {}

monster.health = 65000
monster.maxHealth = 65000
monster.race = "blood"
monster.corpse = 0
monster.speed = 150
monster.manaCost = 0

monster.changeTarget = {
	interval = 2000,
	chance = 10,
}

monster.strategiesTarget = {
	nearest = 70,
	health = 10,
	damage = 10,
	random = 10,
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
	level = 4,
	color = 24,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "AHHH ZHE POWER...", yell = true },
	{ text = "ZHE TIME OF ZHE SNAKE HAZ COME!", yell = true },
}

monster.loot = {}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 0, maxDamage = -600 },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_LIFEDRAIN, minDamage = 0, maxDamage = -300, length = 8, spread = 3, effect = CONST_ME_MAGIC_RED, target = false },
	{ name = "combat", interval = 2000, chance = 50, type = COMBAT_EARTHDAMAGE, minDamage = -150, maxDamage = -270, radius = 6, effect = CONST_ME_MAGIC_GREEN, target = false },
}

monster.defenses = {
	defense = 65,
	armor = 70,
	--	mitigation = ???,
	{ name = "combat", interval = 2000, chance = 25, type = COMBAT_HEALING, minDamage = 150, maxDamage = 450, effect = CONST_ME_MAGIC_BLUE, target = false },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = -10 },
	{ type = COMBAT_EARTHDAMAGE, percent = 100 },
	{ type = COMBAT_FIREDAMAGE, percent = -10 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = 0 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
