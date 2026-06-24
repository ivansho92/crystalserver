local internalNpcName = "Drome Seller"
local npcType = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name = internalNpcName
npcConfig.description = internalNpcName

npcConfig.health = 100
npcConfig.maxHealth = npcConfig.health
npcConfig.walkInterval = 2000
npcConfig.walkRadius = 2

npcConfig.outfit = {
	lookType = 471,
	lookHead = 0,
	lookBody = 57,
	lookLegs = 0,
	lookFeet = 68,
	lookAddons = 2,
}

npcConfig.flags = {
	floorchange = false,
}

npcConfig.voices = {
	interval = 15000,
	chance = 50,
	{ text = "Resilience, amplification and more! Ask me about my offers!" },
}

npcConfig.currency = 22721

local GOLD_TOKEN = 22721
local SILVER_TOKEN = 22516

-- Items organized by token type
local itemsTable = {
	["silver"] = {
		{ itemName = "fire resilience", clientId = 36729, buy = 20 },
		{ itemName = "ice resilience", clientId = 36730, buy = 20 },
		{ itemName = "earth resilience", clientId = 36731, buy = 20 },
		{ itemName = "energy resilience", clientId = 36732, buy = 20 },
		{ itemName = "holy resilience", clientId = 36733, buy = 20 },
		{ itemName = "death resilience", clientId = 36734, buy = 20 },
		{ itemName = "physical resilience", clientId = 36735, buy = 20 },
	},
	["gold"] = {
		{ itemName = "kooldown-aid", clientId = 36723, buy = 30 },
		{ itemName = "strike enhancement", clientId = 36724, buy = 30 },
		{ itemName = "stamina extension", clientId = 36725, buy = 30 },
		{ itemName = "charm upgrade", clientId = 36726, buy = 30 },
		{ itemName = "wealth duplex", clientId = 36727, buy = 80 },
		{ itemName = "bestiary betterment", clientId = 36728, buy = 30 },
		{ itemName = "fire amplification", clientId = 36736, buy = 30 },
		{ itemName = "ice amplification", clientId = 36737, buy = 30 },
		{ itemName = "earth amplification", clientId = 36738, buy = 30 },
		{ itemName = "energy amplification", clientId = 36739, buy = 30 },
		{ itemName = "holy amplification", clientId = 36740, buy = 30 },
		{ itemName = "death amplification", clientId = 36741, buy = 30 },
		{ itemName = "physical amplification", clientId = 36742, buy = 30 },
	},
}

-- Build complete shop for config (for trade command)
npcConfig.shop = {}
for _, category in pairs(itemsTable) do
	for _, item in ipairs(category) do
		table.insert(npcConfig.shop, item)
	end
end

local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)

npcType.onThink = function(npc, interval)
	npcHandler:onThink(npc, interval)
end

npcType.onAppear = function(npc, creature)
	npcHandler:onAppear(npc, creature)
end

npcType.onDisappear = function(npc, creature)
	npcHandler:onDisappear(npc, creature)
end

npcType.onMove = function(npc, creature, fromPosition, toPosition)
	npcHandler:onMove(npc, creature, fromPosition, toPosition)
end

npcType.onSay = function(npc, creature, type, message)
	npcHandler:onSay(npc, creature, type, message)
end

npcType.onCloseChannel = function(npc, creature)
	npcHandler:onCloseChannel(npc, creature)
end

npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
	npc:sellItem(player, itemId, amount, subType, 0, ignore, inBackpacks)
end

npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
	player:sendTextMessage(MESSAGE_TRADE, string.format("Sold %ix %s for %i token(s).", amount, name, totalCost))
end

npcType.onCheckItem = function(npc, player, clientId, subType) end

local function greetCallback(npc, creature)
	local playerId = creature:getId()
	npcHandler:setTopic(playerId, 0)
	return true
end

local function creatureSayCallback(npc, creature, type, message)
	local player = Player(creature)
	local playerId = player:getId()

	if not npcHandler:checkInteraction(npc, creature) then
		return false
	end

	local msg = message:lower()

	-- Handle silver tokens shop
	if MsgContains(message, "silver") then
		npcConfig.currency = SILVER_TOKEN
		npcHandler:say("Here are the items available for silver tokens:", npc, creature)
		npc:openShopWindowTable(player, itemsTable["silver"])
		return true
	end

	-- Handle gold tokens shop
	if MsgContains(message, "gold") then
		npcConfig.currency = GOLD_TOKEN
		npcHandler:say("Here are the items available for gold tokens:", npc, creature)
		npc:openShopWindowTable(player, itemsTable["gold"])
		return true
	end

	-- Main trade greeting
	if MsgContains(message, "trade") or MsgContains(message, "offer") then
		npcHandler:say({
			"Welcome! I trade concoctions with two types of tokens!",
			"Say {silver} to see my silver token items",
			"Say {gold} to see my gold token items"
		}, npc, creature)
		return true
	end

	return true
end

npcHandler:setCallback(CALLBACK_GREET, greetCallback)
npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, false)

npcType:addDialogOptions("trade", "bye")

npcType:register(npcConfig)
