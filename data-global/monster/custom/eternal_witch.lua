local mType = Game.createMonsterType("Eternal Witch")
local monster = {}

monster.description = "a eternal witch"
monster.experience = 5000000
monster.outfit = {
	lookType = 54,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.events = {
	"WitchBossEvent",
	"EternalWitchDeathTrigger",
}

monster.health = 800000
monster.maxHealth = 800000
monster.race = "blood"
monster.corpse = 18254
monster.speed = 3000
monster.manaCost = 0

monster.changeTarget = {
	interval = 4000,
	chance = 100,
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
	canPushCreatures = false,
	staticAttackChance = 95,
	targetDistance = 4,
	runHealth = 0,
	healthHidden = false,
	isBlockable = false,
	canWalkOnEnergy = true,
	canWalkOnFire = false,
	canWalkOnPoison = false,
}

monster.light = {
	level = 0,
	color = 0,
}

monster.voices = {
	interval = 5000,
	chance = 10,
	{ text = "¡Herba budinia ex!", yell = true },
	{ text = "¡Horax Pokti!", yell = true },
	{ text = "¡Hahahahaha!", yell = false },
	{ text = "¡You are mine, bitch!", yell = true },
}

monster.loot = {
	{ id = 3012, chance = 100000 }, -- wolf tooth chain
	{ name = "gold coin", chance = 100000, maxCount = 100 },
	{ name = "necrotic rod", chance = 50000 },
	{ name = "spellbook of dark mysteries", chance = 45000 },
	{ name = "demonrage sword", chance = 40000 },
	{ name = "chaos mace", chance = 40000 },
	{ name = "haunted blade", chance = 35000 },
	{ name = "hellforged axe", chance = 35000 },
	{ name = "demonwing axe", chance = 35000 },
	{ name = "emerald sword", chance = 30000 },
	{ name = "havoc blade", chance = 30000 },
	{ name = "shadow sceptre", chance = 30000 },
	{ name = "ornamented axe", chance = 25000 },
	{ name = "jade hammer", chance = 25000 },
	{ name = "skullcrusher", chance = 25000 },
	{ name = "witch hat", chance = 10000 },
	{ name = "ultimate health potion", chance = 50000, maxCount = 50 },
	{ name = "great mana potion", chance = 50000, maxCount = 50 },
	{ name = "great spirit potion", chance = 50000, maxCount = 50 },
	{ name = "blue gem", chance = 15000 },
	{ name = "red gem", chance = 15000 },
	{ name = "green crystal splinter", chance = 20000, maxCount = 10 },
	{ name = "blue crystal splinter", chance = 20000, maxCount = 10 },
	{ name = "demonic essence", chance = 5000, maxCount = 3 },
}

monster.attacks = {
	{ name = "melee", interval = 2000, chance = 100, minDamage = 2000, maxDamage = -4550 },
	{ name = "combat", interval = 2000, chance = 40, type = COMBAT_FIREDAMAGE, minDamage = -1500, maxDamage = -2500, range = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_HITBYFIRE, target = false },
	{ name = "firefield", interval = 2000, chance = 20, range = 7, radius = 2, shootEffect = CONST_ANI_FIRE, target = true },
	{ name = "combat", interval = 2500, chance = 35, type = COMBAT_ENERGYDAMAGE, minDamage = -1620, maxDamage = -2800, range = 8, shootEffect = CONST_ANI_ENERGYBALL, effect = CONST_ME_ENERGYHIT, target = true },
	{ name = "combat", interval = 3000, chance = 30, type = COMBAT_ICEDAMAGE, minDamage = -1900, maxDamage = -3600, range = 7, radius = 3, shootEffect = CONST_ANI_ICE, effect = CONST_ME_ICEAREA, target = true },
	{ name = "condition", type = CONDITION_POISON, interval = 2000, chance = 40, minDamage = -1080, maxDamage = -2800, range = 7, shootEffect = CONST_ANI_POISON, target = false },
	{ name = "outfit", interval = 3000, chance = 25, range = 7, radius = 5, effect = CONST_ME_MAGIC_RED, target = false, duration = 3000, outfitMonster = "green frog" },
	{ name = "speed", interval = 2000, chance = 35, speedChange = -1000, radius = 6, effect = CONST_ME_MAGIC_RED, target = true, duration = 8000 },
}

monster.defenses = {
	defense = 50,
	armor = 50,
	mitigation = 0.50,
	{ name = "combat", interval = 8000, chance = 70, type = COMBAT_HEALING, minDamage = 80000, maxDamage = 150000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "invisible", interval = 5000, chance = 30, effect = CONST_ME_MAGIC_BLUE },
	{ name = "speed", interval = 4000, chance = 50, speedChange = 1500, effect = CONST_ME_MAGIC_RED, target = false, duration = 10000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = -10 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 0 },
	{ type = COMBAT_EARTHDAMAGE, percent = 10 },
	{ type = COMBAT_FIREDAMAGE, percent = -5 },
	{ type = COMBAT_LIFEDRAIN, percent = 0 },
	{ type = COMBAT_MANADRAIN, percent = 0 },
	{ type = COMBAT_DROWNDAMAGE, percent = 0 },
	{ type = COMBAT_ICEDAMAGE, percent = 0 },
	{ type = COMBAT_HOLYDAMAGE, percent = 0 },
	{ type = COMBAT_DEATHDAMAGE, percent = -10 },
}

monster.immunities = {
	{ type = "paralyze", condition = false },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)