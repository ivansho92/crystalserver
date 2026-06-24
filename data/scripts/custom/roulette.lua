local config = {
    actionId = 18562, -- on lever
    lever = {
        left = 2772,
        right = 2773
    },
    playItem = {
        itemId = 37317, -- item required to pull lever
        count = 1
    },
    rouletteOptions = {
        rareItemChance_broadcastThreshold = 500,
        ignoredItems = {1617}, -- if you have tables/counters/other items on the roulette tiles, add them here
        winEffects = {CONST_ANI_FIRE, CONST_ME_SOUND_YELLOW, CONST_ME_SOUND_PURPLE, CONST_ME_SOUND_BLUE, CONST_ME_SOUND_WHITE}, -- first effect needs to be distance effect
        effectDelay = 333,
        spinTime = {min = 10, max = 15}, -- seconds
        spinSlowdownRamping = 10,
        rouletteStorage = 48550 -- required storage to avoid player abuse (if they logout/die before roulette finishes.. they can spin again for free)
    },
    prizePool = {
        {itemId = 50334, count = {1, 1},    chance = 500 }, -- zaoan sauce
        {itemId = 11587, count = {1, 1},    chance = 500 }, -- demonic candy ball
        {itemId = 11586, count = {1, 1},    chance = 500 }, -- pot of blackjack
        {itemId = 11584, count = {1, 1},    chance = 500 }, -- coconut shrimp bake
        {itemId = 9087, count = {1, 1},    chance = 500 }, -- carrot cake
        {itemId = 9088, count = {1, 1},    chance = 500 }, -- northern fishburger
        {itemId = 9086, count = {1, 1},    chance = 500 }, -- blessed steak
        {itemId = 9085, count = {1, 1},    chance = 500 }, -- filled jalapeno peppers
        {itemId = 9084, count = {1, 1},    chance = 500 }, -- veggie casserole
        {itemId = 9083, count = {1, 1},    chance = 500 }, -- banana chocolate shake
        {itemId = 9082, count = {1, 1},    chance = 500 }, -- tropical fried terrorbird
        {itemId = 9081, count = {1, 1},    chance = 500 }, -- roasted dragon wings
        {itemId = 9080, count = {1, 1},    chance = 500 }, -- hydra tongue salad
        {itemId = 9079, count = {1, 1},    chance = 500 }, -- rotworm stew
        {itemId = 3382, count = {1, 1},    chance = 500 }, -- crown legs
        {itemId = 16244, count = {1, 1},    chance = 400 }, -- music box 
        {itemId = 3043, count = {100, 100},    chance = 3500 }, -- crystal coin
        {itemId = 36725, count = {1, 1},    chance = 200 }, -- stamina extension
		{itemId = 36657, count = {1, 1},    chance = 150 }, -- eldritch claymore
		{itemId = 36661, count = {1, 1},    chance = 150 }, -- eldritch greataxe
		{itemId = 36656, count = {1, 1},    chance = 150 }, -- eldritch shield
		{itemId = 36659, count = {1, 1},    chance = 150 }, -- eldritch warmace
		{itemId = 36658, count = {1, 1},    chance = 150 }, -- gilded eldritch claymore
		{itemId = 36662, count = {1, 1},    chance = 150 }, -- gilded eldritch greataxe
		{itemId = 36660, count = {1, 1},    chance = 150 }, -- gilded eldritch warmace
		{itemId = 36664, count = {1, 1},    chance = 150 }, -- eldritch bow
		{itemId = 36667, count = {1, 1},    chance = 150 }, -- eldritch breeches
		{itemId = 36666, count = {1, 1},    chance = 150 }, -- eldritch quiver
		{itemId = 36665, count = {1, 1},    chance = 150 }, -- gilded eldritch bow
		{itemId = 36670, count = {1, 1},    chance = 150 }, -- eldritch cowl
		{itemId = 36672, count = {1, 1},    chance = 150 }, -- eldritch folio
		{itemId = 36668, count = {1, 1},    chance = 150 }, -- eldritch wand
		{itemId = 36669, count = {1, 1},    chance = 150 }, -- gilded eldritch wand
		{itemId = 36671, count = {1, 1},    chance = 150 }, -- eldritch hood
		{itemId = 36674, count = {1, 1},    chance = 150 }, -- eldritch rod
		{itemId = 36673, count = {1, 1},    chance = 150 }, -- eldritch tome
		{itemId = 36675, count = {1, 1},    chance = 150 }, -- gilded eldritch rod
		{itemId = 50169, count = {1, 1},    chance = 150 }, -- eldritch crescent moon spade
		{itemId = 50170, count = {1, 1},    chance = 150 }, -- gilded eldritch crescent moon spade
		{itemId = 50266, count = {1, 1},    chance = 150 }, -- eldritch monk boots
		{itemId = 30396, count = {1, 1},    chance = 150 }, -- cobra axe
		{itemId = 50167, count = {1, 1},    chance = 150 }, -- cobra bo
		{itemId = 30394, count = {1, 1},    chance = 150 }, -- cobra boots
		{itemId = 39178, count = {1, 1},    chance = 10 }, -- Draconic Spiritthorn Ring
		{itemId = 43875, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Battleaxe
		{itemId = 43868, count = {1, 1},    chance = 10 }, -- Draconic Ice Hatchet
		{itemId = 43869, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Hatchet
		{itemId = 43873, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Bludgeon
		{itemId = 43866, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Cudice
		{itemId = 43867, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Cudgel
		{itemId = 43871, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Razor
		{itemId = 43870, count = {1, 1},    chance = 10 }, -- Draconic Death Razor
		{itemId = 43865, count = {1, 1},    chance = 10 }, -- Draconic Ice Blade
		{itemId = 34099, count = {1, 1},    chance = 10 }, -- Draconic Soulbastion
		{itemId = 34097, count = {1, 1},    chance = 10 }, -- Draconic Soulwalkers
		{itemId = 43876, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Legs
		{itemId = 39147, count = {1, 1},    chance = 10 }, -- Draconic Spiritthorn Armor
		{itemId = 39148, count = {1, 1},    chance = 10 }, -- Draconic Spiritthorn Helmet
		{itemId = 39150, count = {1, 1},    chance = 10 }, -- Draconic Quiver
		{itemId = 34098, count = {1, 1},    chance = 10 }, -- Draconic Soulstalkers
		{itemId = 43881, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Greaves
		{itemId = 34094, count = {1, 1},    chance = 10 }, -- Draconic Soulshell
		{itemId = 39149, count = {1, 1},    chance = 10 }, -- Draconic Alicorn Headguard
		{itemId = 43878, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Bow
		{itemId = 43880, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Crossbow
		{itemId = 39181, count = {1, 1},    chance = 10 }, -- Draconic Alicorn Ring
		{itemId = 43883, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Coil
		{itemId = 43882, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Wand
		{itemId = 39184, count = {1, 1},    chance = 10 }, -- Draconic Arcanomancer Ring
		{itemId = 39152, count = {1, 1},    chance = 10 }, -- Draconic Arcanomancer Spellbook
		{itemId = 43884, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Boots
		{itemId = 34092, count = {1, 1},    chance = 10 }, -- Draconic Soulshanks
		{itemId = 34095, count = {1, 1},    chance = 10 }, -- Draconic Soulmantle
		{itemId = 39151, count = {1, 1},    chance = 10 }, -- Draconic Arcanomancer Helmet
		{itemId = 43886, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Rod
		{itemId = 43885, count = {1, 1},    chance = 10 }, -- Draconic Death Rod
		{itemId = 39187, count = {1, 1},    chance = 10 }, -- Draconic Arboreal Ring
		{itemId = 39154, count = {1, 1},    chance = 10 }, -- Draconic Arboreal Tome
		{itemId = 43887, count = {1, 1},    chance = 10 }, -- Draconic Galoshes
		{itemId = 34093, count = {1, 1},    chance = 10 }, -- Draconic Soulstrider
		{itemId = 34096, count = {1, 1},    chance = 10 }, -- Draconic Soulshroud
		{itemId = 39153, count = {1, 1},    chance = 10 }, -- Draconic Arboreal Crown
		{itemId = 50188, count = {1, 1},    chance = 10 }, -- Draconic Ethereal Hat
		{itemId = 50254, count = {1, 1},    chance = 10 }, -- Draconic Soulgarb
		{itemId = 50146, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Trousers
		{itemId = 50240, count = {1, 1},    chance = 10 }, -- Draconic Soulsoles
		{itemId = 50158, count = {1, 1},    chance = 10 }, -- Draconic Sanguine Claws
		{itemId = 50148, count = {1, 1},    chance = 10 }, -- Draconic Ethereal Ring
		{itemId = 943, count = {1, 1},    chance = 10 }, -- Tier Upgrade Stone
		{itemId = 30395, count = {1, 1},    chance = 150 }, -- cobra club
		{itemId = 30393, count = {1, 1},    chance = 150 }, -- cobra crossbow
		{itemId = 30397, count = {1, 1},    chance = 150 }, -- cobra hood
		{itemId = 30400, count = {1, 1},    chance = 150 }, -- cobra rod	
		{itemId = 30398, count = {1, 1},    chance = 150 }, -- cobra sword
		{itemId = 30399, count = {1, 1},    chance = 150 }, -- cobra wand
		{itemId = 31631, count = {1, 1},    chance = 150 }, -- cobra amulet
		{itemId = 35514, count = {1, 1},    chance = 150 }, -- jungle flail
		{itemId = 35515, count = {1, 1},    chance = 150 }, -- throwing axe
		{itemId = 35518, count = {1, 1},    chance = 150 }, -- jungle bow
		{itemId = 35524, count = {1, 1},    chance = 150 }, -- jungle quiver
		{itemId = 35521, count = {1, 1},    chance = 150 }, -- jungle rod
		{itemId = 35522, count = {1, 1},    chance = 150 }, -- jungle wand
		{itemId = 35517, count = {1, 1},    chance = 150 }, -- bast legs
		{itemId = 35516, count = {1, 1},    chance = 150 }, -- exotic legs
		{itemId = 35520, count = {1, 1},    chance = 150 }, -- make-do boots
		{itemId = 35519, count = {1, 1},    chance = 150 }, -- makeshift boots
		{itemId = 35523, count = {1, 1},    chance = 150 }, -- exotic amulet
		{itemId = 28724, count = {1, 1},    chance = 150 }, -- falcon battleaxe
		{itemId = 28718, count = {1, 1},    chance = 150 }, -- falcon bow	
		{itemId = 28714, count = {1, 1},    chance = 150 }, -- falcon circlet
		{itemId = 28715, count = {1, 1},    chance = 150 }, -- falcon coif
		{itemId = 28720, count = {1, 1},    chance = 150 }, -- falcon greaves
		{itemId = 28723, count = {1, 1},    chance = 150 }, -- falcon longsword
		{itemId = 28725, count = {1, 1},    chance = 150 }, -- falcon mace			
		{itemId = 28719, count = {1, 1},    chance = 150 }, -- falcon plate			
		{itemId = 28716, count = {1, 1},    chance = 150 }, -- falcon rod
		{itemId = 50161, count = {1, 1},    chance = 150 }, -- falcon sai
		{itemId = 28721, count = {1, 1},    chance = 150 }, -- falcon shield
		{itemId = 28717, count = {1, 1},    chance = 150 }, -- falcon wand			
        {itemId = 36729, count = {1, 1},    chance = 200 }, -- fire resilience
        {itemId = 36742, count = {1, 1},    chance = 200 }, -- physical amplification
        {itemId = 36741, count = {1, 1},    chance = 200 }, -- death amplification
        {itemId = 36738, count = {1, 1},    chance = 200 }, -- eart amplification
        {itemId = 36740, count = {1, 1},    chance = 200 }, -- holy amplification
        {itemId = 36739, count = {1, 1},    chance = 200 }, -- energy amplification
        {itemId = 36737, count = {1, 1},    chance = 200 }, -- ice amplification
        {itemId = 36736, count = {1, 1},    chance = 200 }, -- fire amplification
        {itemId = 36730, count = {1, 1},    chance = 200 }, -- ice resilience
        {itemId = 36735, count = {1, 1},    chance = 200 }, -- physical resilience
        {itemId = 36734, count = {1, 1},    chance = 200 }, -- death resilience
        {itemId = 36732, count = {1, 1},    chance = 200 }, -- energy resilience
        {itemId = 36733, count = {1, 1},    chance = 200 }, -- holy resilience
        {itemId = 36724, count = {1, 1},    chance = 200 }, -- strike enhancement
        {itemId = 36726, count = {1, 1},    chance = 200 }, -- charm upgrade
        {itemId = 36727, count = {1, 1},    chance = 200 },  -- wealth duplex loot boost
        {itemId = 3079, count = {1, 1},    chance = 4000 }, -- boots of haste
        {itemId = 10386, count = {1, 1},    chance = 1000 }, -- zaoan shoes
        {itemId = 3392, count = {1, 1},    chance = 3500 }, -- royal helmet
        {itemId = 25718, count = {1, 1}, chance = 2000 }, -- temple teleport scroll 
        {itemId = 3364, count = {1, 1},    chance = 1500 }, -- golden legs
        {itemId = 3366, count = {1, 1},    chance = 1500 }, -- magic plate armor
		{itemId = 17858, count = {1, 1},    chance = 1500 }, -- leech
		{itemId = 37317, count = {1, 1},    chance = 1500 }, -- tibiacoin item para ruleta
		{itemId = 22118, count = {25, 25},    chance = 2000 }, -- tibiacoin agregable
		{itemId = 37061, count = {1, 1},    chance = 1000 }, -- Evora (calabaza)
		{itemId = 4100, count = {1, 1},    chance = 1000 }, -- gamemaster doll
		{itemId = 3365, count = {1, 1},    chance = 1000 }, -- golden helmet
		{itemId = 5907, count = {1, 1},    chance = 2000 }, -- slingshot
		{itemId = 3360, count = {1, 1},    chance = 1000 }, -- golden armor
		{itemId = 34326, count = {1, 1},    chance = 1000 }, -- wicked witch doll
		{itemId = 6529, count = {1, 1},    chance = 1000 }, -- soft boots
        {itemId = 5903, count = {1, 1},    chance = 5 }, -- ferumbra's hat
		{itemId = 3420, count = {1, 1},    chance = 1000 }, -- demon shield
        {itemId = 3555, count = {1, 1},    chance = 1000  },  -- golden boots

		-- exercise weapons (CHARGES)
		{itemId = 35279, charge = {2500, 2500}, chance = 3000000 },  -- durable exercise sword
		{itemId = 35280, charge = {2500, 2500}, chance = 300 }, -- durable exercise axe
		{itemId = 35281, charge = {2500, 2500}, chance = 300 },  -- durable exercise club
		{itemId = 35282, charge = {2500, 2500}, chance = 300 },  -- durable exercise bow
		{itemId = 35283, charge = {2500, 2500}, chance = 300 },  -- durable exercise rod
		{itemId = 35284, charge = {2500, 2500}, chance = 300 },  -- durable exercise wand
		{itemId = 50294, charge = {2500, 2500}, chance = 300 } -- durable exercise wraps
    },
    roulettePositions = { -- hard-coded to 9 positions.
        Position(1099, 1005, 7),
        Position(1100, 1005, 7),
        Position(1101, 1005, 7),
        Position(1102, 1005, 7), 
        Position(1103, 1005, 7), -- position 5 = reward location (CENTER)
        Position(1104, 1005, 7),
        Position(1105, 1005, 7),
		Position(1106, 1005, 7),
		Position(1107, 1005, 7),
    }
}

local chancedItems = {}

local function resetLever(position)
    local lever = Tile(position):getItemById(config.lever.right)
    if lever then
        lever:transform(config.lever.left)
    end
end

-- Creates item on a tile for display (roulette tiles)
local function createDisplayItem(itemInfo, pos)
    if itemInfo.charge then
        local it = Game.createItem(itemInfo.itemId, 1, pos)
        if it then
            it:setAttribute(ITEM_ATTRIBUTE_CHARGES, itemInfo.charge)
        end
        return it
    end
    return Game.createItem(itemInfo.itemId, itemInfo.count or 1, pos)
end

local function updateRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            if i ~= 9 then
                item:moveTo(positions[i + 1])
            else
                item:remove()
            end
        end
    end
    createDisplayItem(newItemInfo, positions[1])
end

local function clearRoulette(newItemInfo)
    local positions = config.roulettePositions
    for i = #positions, 1, -1 do
        local item = Tile(positions[i]):getTopVisibleThing()
        if item and item:getId() ~= Tile(positions[i]):getGround():getId() and not table.contains(config.rouletteOptions.ignoredItems, item:getId()) then
            item:remove()
        end
        if newItemInfo == nil then
            positions[i]:sendMagicEffect(CONST_ME_POFF)
        else
            createDisplayItem(newItemInfo, positions[i])
        end
    end
end

local function chanceNewReward()
    local rewardTable = {}
    while #rewardTable < 1 do
        for i = 1, #config.prizePool do
            if config.prizePool[i].chance >= math.random(10000) then
                rewardTable[#rewardTable + 1] = i
            end
        end
    end

    local randIndex = rewardTable[math.random(#rewardTable)]
    local rewardEntry = config.prizePool[randIndex]

    chancedItems[#chancedItems + 1] = rewardEntry.chance

    if rewardEntry.charge then
        local charges = type(rewardEntry.charge) == "table"
            and math.random(rewardEntry.charge[1], rewardEntry.charge[2])
            or rewardEntry.charge
        return { itemId = rewardEntry.itemId, charge = charges }
    end

    local amount = type(rewardEntry.count) == "table"
        and math.random(rewardEntry.count[1], rewardEntry.count[2])
        or (rewardEntry.count or 1)

    return { itemId = rewardEntry.itemId, count = amount }
end

local function initiateReward(leverPosition, effectCounter)
    if effectCounter < #config.rouletteOptions.winEffects then
        effectCounter = effectCounter + 1
        if effectCounter == 1 then
            config.roulettePositions[1]:sendDistanceEffect(config.roulettePositions[5], config.rouletteOptions.winEffects[1])
            config.roulettePositions[9]:sendDistanceEffect(config.roulettePositions[5], config.rouletteOptions.winEffects[1])
        else
            for i = 1, #config.roulettePositions do
                config.roulettePositions[i]:sendMagicEffect(config.rouletteOptions.winEffects[effectCounter])
            end
        end
        addEvent(initiateReward, config.rouletteOptions.effectDelay, leverPosition, effectCounter)
        return
    end
    resetLever(leverPosition)
end

-- Give the CENTER ITEM as reward, but KEEP the center tile filled
local function rewardPlayer(playerId, leverPosition)
    local player = Player(playerId)
    if not player then
        return
    end

    local centerPos = config.roulettePositions[5]
    local tile = Tile(centerPos)
    if not tile then
        return
    end

    local rewardItem = tile:getTopVisibleThing()
    if not rewardItem or not rewardItem:isItem() then
        return
    end

    local rewardId = rewardItem:getId()
    local rewardCount = rewardItem:getCount() or 1
    local rewardCharges = rewardItem:getAttribute(ITEM_ATTRIBUTE_CHARGES)

    -- IMPORTANT: don't remove the visual item, just give a copy to player
    if rewardCharges and rewardCharges > 0 then
        local it = Game.createItem(rewardId, 1)
        if it then
            it:setAttribute(ITEM_ATTRIBUTE_CHARGES, rewardCharges)
            it:moveTo(player)
        end
    else
        if ItemType(rewardId):isStackable() then
            player:addItem(rewardId, rewardCount, true)
        else
            player:addItem(rewardId, 1, true)
        end
    end

    player:setStorageValue(config.rouletteOptions.rouletteStorage, -1)

    if chancedItems[#chancedItems - 3] and chancedItems[#chancedItems - 3] <= config.rouletteOptions.rareItemChance_broadcastThreshold then
        local itemName = ItemType(rewardId):getName()
        Game.broadcastMessage("The player " .. player:getName() .. " has won " .. itemName .. " from the roulette!", 20)
    end
end

local function roulette(playerId, leverPosition, spinTimeRemaining, spinDelay)
    local player = Player(playerId)
    if not player then
        resetLever(leverPosition)
        return
    end

    local newItemInfo = chanceNewReward()
    updateRoulette(newItemInfo)

    if spinTimeRemaining > 0 then
        spinDelay = spinDelay + config.rouletteOptions.spinSlowdownRamping
        addEvent(roulette, spinDelay, playerId, leverPosition, spinTimeRemaining - (spinDelay - config.rouletteOptions.spinSlowdownRamping), spinDelay)
        return
    end

    initiateReward(leverPosition, 0)
    rewardPlayer(playerId, leverPosition)
end

local casinoRoulette = Action()

function casinoRoulette.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    if item:getId() == config.lever.right then
        player:sendTextMessage(19, "Casino Roulette is currently in progress. Please wait.") -- 19 = MESSAGE_INFO_DESCR universal
        return true
    end

    if player:getItemCount(config.playItem.itemId) < config.playItem.count then
        item:getPosition():sendMagicEffect(CONST_ME_POFF)
        player:sendTextMessage(19,
            "You need at least " .. config.playItem.count .. " " .. (ItemType(config.playItem.itemId):getName()) .. " to play the roulette.")
        return true
    end

    item:transform(config.lever.right)
    clearRoulette()
    chancedItems = {}

    player:removeItem(config.playItem.itemId, config.playItem.count)
    player:setStorageValue(config.rouletteOptions.rouletteStorage, 1)

    local spinTimeRemaining = math.random((config.rouletteOptions.spinTime.min * 1000), (config.rouletteOptions.spinTime.max * 1000))
    roulette(player:getId(), toPosition, spinTimeRemaining, 100)
    return true
end

casinoRoulette:aid(config.actionId)
casinoRoulette:register()

local disableMovingItemsToRoulettePositions = MoveEvent()

disableMovingItemsToRoulettePositions.onAddItem = function(moveitem, tileitem, position, item, count, fromPosition, toPosition)
    for _, k in pairs(config.roulettePositions) do
        if toPosition == k then
            return false
        end
    end
    return true
end

disableMovingItemsToRoulettePositions:position(config.roulettePositions)
disableMovingItemsToRoulettePositions:register()