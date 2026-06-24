local mType = Game.createMonsterType("Titanbane Gnawer")
local monster = {}

monster.name = "Titanbane Gnawer"
monster.description = "a Titanbane Gnawer"
monster.experience = 1800000
monster.outfit = {
	lookType = 56,
	lookHead = 0,
	lookBody = 0,
	lookLegs = 0,
	lookFeet = 0,
	lookAddons = 0,
	lookMount = 0,
}

monster.health = 1000000
monster.maxHealth = 1000000
monster.runHealth = 0
monster.race = "fire"
monster.corpse = 6068
monster.speed = 1000
monster.summonCost = 0

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

monster.summon = {
	maxSummons = 7,
	summons = {
		{ name = "titanbane minion", chance = 80, interval = 2000, count = 4 },
	},
}

monster.voices = {
    interval = 4000,
    chance = 40,
    phrases = {
        { text = "Your bones will splinter beneath my claws!", yell = true },
        { text = "No titan shall stand!", yell = true },
        { text = "Gnaw... tear... devour!", yell = false },
        { text = "I am plague, I am war!", yell = true },
        { text = "Flee, or be shredded!", yell = false },
        { text = "Titan flesh... so tender!", yell = true },
        { text = "Meep...? No. DIE!", yell = true },
    }
}

monster.loot = {
	{ id = 39698, chance = 20000, unique = true }, -- draconic blessed torch
	{ id = 8076, chance = 14000 }, -- spellscroll of prophecies
	{ id = 7427, chance = 12000 }, -- chaos mace
	{ id = 37317, chance = 12000, maxCount = 3 }, -- tibia coin (ruleta)
	{ id = 22118, chance = 8000, maxCount = 3 }, -- tibia coin agregable
	{ id = 22118, chance = 8000, maxCount = 4 }, -- tibia coin agregable
	{ id = 22721, chance = 12000, maxCount = 5 }, -- gold token
	{ id = 37317, chance = 12000, maxCount = 3 }, -- tibia coin (ruleta)
	{ id = 22118, chance = 80000, maxCount = 3 }, -- tibia coin agregable
	{ id = 22118, chance = 8000, maxCount = 4 }, -- tibia coin agregable
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

monster.attacks = {
	{ name = "combat", interval = 3000, chance = 40, type = COMBAT_PHYSICALDAMAGE, minDamage = 1800, maxDamage = -3000, length = 8, spread = 0, effect = CONST_ME_WHITE_ENERGY_SPARK },
	{ name = "combat", interval = 5000, chance = 50, type = COMBAT_ICEDAMAGE, minDamage = -2000, maxDamage = -3000, effect = CONST_ME_ICEATTACK },
	{ name = "melee", interval = 3000, chance = 80, skill = 100, attack = 1800 },
	{ name = "combat", interval = 4000, chance = 60, type = COMBAT_MANADRAIN, minDamage = -700, maxDamage = -1500, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_POFF, target = false },
	{ name = "drunk", interval = 1000, chance = 50, range = 7, shootEffect = CONST_ANI_ENERGY, effect = CONST_ME_ENERGYAREA, target = false },
	{ name = "strength", interval = 2000, chance = 60, range = 7, shootEffect = CONST_ANI_LARGEROCK, effect = CONST_ME_ENERGYAREA, target = false },
	{ name = "combat", interval = 4000, chance = 50, type = COMBAT_LIFEDRAIN, minDamage = -1400, maxDamage = -2500, radius = 8, effect = CONST_ME_LOSEENERGY, target = false },
	{ name = "combat", interval = 2000, chance = 30, type = COMBAT_MANADRAIN, minDamage = -1200, maxDamage = -2000, radius = 8, effect = CONST_ME_MAGIC_GREEN, target = false },
	{ name = "speed", interval = 4000, chance = 60, speedChange = -3500, radius = 6, effect = CONST_ME_POISONAREA, target = false, duration = 60000 },
	{ name = "strength", interval = 1000, chance = 40, radius = 5, effect = CONST_ME_HITAREA, target = false },
	{ name = "outfit", interval = 1000, chance = 50, radius = 8, effect = CONST_ME_LOSEENERGY, target = false, duration = 8000, outfitMonster = "rat" },
	{ name = "combat", interval = 1000, chance = 34, type = COMBAT_FIREDAMAGE, minDamage = -800, maxDamage = -1500, range = 7, radius = 7, shootEffect = CONST_ANI_FIRE, effect = CONST_ME_FIREAREA, target = true },
	{ name = "combat", interval = 1000, chance = 50, type = COMBAT_LIFEDRAIN, minDamage = -1600, maxDamage = -2850, length = 8, spread = 0, effect = CONST_ME_MAGIC_RED, target = false },
}

monster.defenses = {
	defense = 145,
	armor = 188,
	--	mitigation = ???,
	{ name = "combat", interval = 4000, chance = 50, type = COMBAT_HEALING, minDamage = 20000, maxDamage = 40000, effect = CONST_ME_MAGIC_BLUE, target = false },
	{ name = "speed", interval = 2000, chance = 80, speedChange = 1800, effect = CONST_ME_MAGIC_RED, target = false, duration = 6000 },
}

monster.elements = {
	{ type = COMBAT_PHYSICALDAMAGE, percent = 20 },
	{ type = COMBAT_ENERGYDAMAGE, percent = 20 },
	{ type = COMBAT_EARTHDAMAGE, percent = 20 },
	{ type = COMBAT_FIREDAMAGE, percent = 20 },
	{ type = COMBAT_LIFEDRAIN, percent = 20 },
	{ type = COMBAT_MANADRAIN, percent = 20 },
	{ type = COMBAT_DROWNDAMAGE, percent = 20 },
	{ type = COMBAT_ICEDAMAGE, percent = 20 },
	{ type = COMBAT_HOLYDAMAGE, percent = 20 },
	{ type = COMBAT_DEATHDAMAGE, percent = 20 },
}

monster.immunities = {
	{ type = "paralyze", condition = true },
	{ type = "outfit", condition = false },
	{ type = "invisible", condition = true },
	{ type = "bleed", condition = false },
}

mType:register(monster)
