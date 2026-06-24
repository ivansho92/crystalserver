local THEONS_STORAGE      = 47000
local TASK_STORAGE        = 47001
local TASK_KILL_STORAGE   = 47002
local TASK_ACTIVE_STORAGE = 47003
local TASK_ID_STORAGE     = 47004

local TASKS = {
    [1] = { monsterName = "Infernal Demon", killsRequired = 500, theonReward = 50 },
    [2] = { monsterName = "Rotworm",        killsRequired = 350, theonReward = 10 },
    [3] = { monsterName = "Frost Troll",    killsRequired = 420, theonReward = 10 },
    [4] = { monsterName = "Terrorsleep",    killsRequired = 250, theonReward = 25 },
}

local TASK_COOLDOWN = 24 * 60 * 60

local internalNpcName = "Theodora"
local npcType   = Game.createNpcType(internalNpcName)
local npcConfig = {}

npcConfig.name         = internalNpcName
npcConfig.description  = internalNpcName
npcConfig.health       = 100
npcConfig.maxHealth    = npcConfig.health
npcConfig.walkInterval = 0
npcConfig.walkRadius   = 2
npcConfig.outfit = {
    lookType   = 138,
    lookHead   = 0,
    lookBody   = 0,
    lookLegs   = 0,
    lookFeet   = 0,
    lookAddons = 0,
}
npcConfig.flags = { floorchange = false }

npcConfig.shop = {
    { itemName = "25 years backpack",            clientId = 39693, buy = 7197 },
    { itemName = "another yellow present kit",   clientId = 37571, buy = 200  },
    { itemName = "balloon no.0",                 clientId = 39671, buy = 250  },
    { itemName = "balloon no.1",                 clientId = 39672, buy = 250  },
    { itemName = "balloon no.2",                 clientId = 39673, buy = 250  },
    { itemName = "balloon no.3",                 clientId = 39674, buy = 250  },
    { itemName = "balloon no.4",                 clientId = 39675, buy = 250  },
    { itemName = "balloon no.5",                 clientId = 39676, buy = 250  },
    { itemName = "balloon no.6",                 clientId = 39677, buy = 250  },
    { itemName = "balloon no.7",                 clientId = 39678, buy = 250  },
    { itemName = "balloon no.8",                 clientId = 39679, buy = 250  },
    { itemName = "balloon no.9",                 clientId = 39680, buy = 250  },
    { itemName = "big reward box",               clientId = 39710, buy = 7197 },
    { itemName = "birthday layer cake",          clientId = 37533, buy = 10   },
    { itemName = "blue balloon",                 clientId = 37471, buy = 200  },
    { itemName = "blue present kit",             clientId = 37567, buy = 200  },
    { itemName = "blue wallpaper",               clientId = 37540, buy = 275  },
    { itemName = "blue and red presents kit",    clientId = 37566, buy = 200  },
    { itemName = "bonelord balloon",             clientId = 37502, buy = 400  },
    { itemName = "bottle of champagne",          clientId = 37530, buy = 10   },
    { itemName = "box full of balloons",         clientId = 39706, buy = 2000 },
    { itemName = "candy floss (large)",          clientId = 37531, buy = 10   },
    { itemName = "blue 25 years balloon",        clientId = 39670, buy = 200  },
    { itemName = "changing backpack",            clientId = 37536, buy = 5000 },
    { itemName = "colourful balloons",           clientId = 37501, buy = 200  },
    { itemName = "cyclops balloon",              clientId = 37503, buy = 400  },
    { itemName = "cyclops head balloon",         clientId = 37504, buy = 400  },
    { itemName = "dazzling fireworks rocket",    clientId = 37459, buy = 750  },
    { itemName = "dragon pinata kit",            clientId = 37717, buy = 10000},
    { itemName = "dwarf balloon",                clientId = 37505, buy = 400  },
    { itemName = "electric fireworks rocket",    clientId = 37452, buy = 750  },
    { itemName = "eloise balloon",               clientId = 37510, buy = 400  },
    { itemName = "explosive fireworks rocket",   clientId = 37448, buy = 750  },
    { itemName = "fiery fireworks rocket",       clientId = 37460, buy = 750  },
    { itemName = "folded blue cake carpet",      clientId = 37378, buy = 400  },
    { itemName = "folded blue tibia carpet",     clientId = 37394, buy = 400  },
    { itemName = "folded dragon carpet",         clientId = 37357, buy = 800  },
    { itemName = "folded dragon lord carpet",    clientId = 37354, buy = 800  },
    { itemName = "folded elemental carpet",      clientId = 37358, buy = 800  },
    { itemName = "folded ghazbaran carpet",      clientId = 37362, buy = 800  },
    { itemName = "folded green cake carpet",     clientId = 37376, buy = 400  },
    { itemName = "folded green tibia carpet",    clientId = 37392, buy = 400  },
    { itemName = "folded morgaroth carpet",      clientId = 37360, buy = 800  },
    { itemName = "folded orange cake carpet",    clientId = 37374, buy = 400  },
    { itemName = "folded orange tibia carpet",   clientId = 37390, buy = 400  },
    { itemName = "folded orshabaal carpet",      clientId = 37364, buy = 800  },
    { itemName = "folded pink cake carpet",      clientId = 37380, buy = 400  },
    { itemName = "folded pink tibia carpet",     clientId = 37396, buy = 400  },
    { itemName = "folded purple cake carpet",    clientId = 37379, buy = 400  },
    { itemName = "folded purple tibia carpet",   clientId = 37395, buy = 400  },
    { itemName = "folded red cake carpet",       clientId = 37366, buy = 400  },
    { itemName = "folded red tibia carpet",      clientId = 37382, buy = 400  },
    { itemName = "folded sky cake carpet",       clientId = 37377, buy = 400  },
    { itemName = "folded sky tibia carpet",      clientId = 37393, buy = 400  },
    { itemName = "folded yellow cake carpet",    clientId = 37375, buy = 400  },
    { itemName = "folded yellow tibia carpet",   clientId = 37391, buy = 400  },
    { itemName = "ghostly fireworks rocket",     clientId = 37455, buy = 750  },
    { itemName = "godly fireworks rocket",       clientId = 37456, buy = 750  },
    { itemName = "golden wallpaper",             clientId = 37542, buy = 275  },
    { itemName = "green 25 years balloon",       clientId = 37516, buy = 200  },
    { itemName = "green balloon",                clientId = 37472, buy = 200  },
    { itemName = "green wallpaper",              clientId = 37541, buy = 275  },
    { itemName = "green and blue presents kit",  clientId = 37564, buy = 200  },
    { itemName = "green and red presents kit",   clientId = 37565, buy = 200  },
    { itemName = "hydra balloon",                clientId = 37506, buy = 400  },
    { itemName = "ice cream cone (sprinkles)",   clientId = 37532, buy = 10   },
    { itemName = "lovely fireworks rocket",      clientId = 37454, buy = 750  },
    { itemName = "lucky dragon kit",             clientId = 39695, buy = 50000},
    { itemName = "magical fireworks rocket",     clientId = 37451, buy = 750  },
    { itemName = "orange 25 years balloon",      clientId = 37517, buy = 200  },
    { itemName = "orange balloon",               clientId = 37491, buy = 200  },
    { itemName = "orc balloon",                  clientId = 37507, buy = 400  },
    { itemName = "orc head balloon",             clientId = 37508, buy = 400  },
    { itemName = "pile of presents kit",         clientId = 37562, buy = 200  },
    { itemName = "pile of three presents kit",   clientId = 37563, buy = 200  },
    { itemName = "pink 25 years balloon",        clientId = 37518, buy = 200  },
    { itemName = "pink balloon",                 clientId = 37496, buy = 200  },
    { itemName = "purple 25 years balloon",      clientId = 39669, buy = 200  },
    { itemName = "purple balloon",               clientId = 37497, buy = 200  },
    { itemName = "red 25 years balloon",         clientId = 37514, buy = 200  },
    { itemName = "red balloon",                  clientId = 37498, buy = 200  },
    { itemName = "red present kit",              clientId = 37568, buy = 200  },
    { itemName = "rotworm balloon",              clientId = 37511, buy = 400  },
    { itemName = "rotworm head balloon",         clientId = 37512, buy = 400  },
    { itemName = "small blue present kit",       clientId = 37569, buy = 200  },
    { itemName = "snapping fireworks rocket",    clientId = 37450, buy = 750  },
    { itemName = "sparkling fireworks rocket",   clientId = 37458, buy = 750  },
    { itemName = "splashing fireworks rocket",   clientId = 37453, buy = 750  },
    { itemName = "string of fairy lights (bgy)", clientId = 37582, buy = 225  },
    { itemName = "string of fairy lights (brg)", clientId = 37581, buy = 225  },
    { itemName = "string of fairy lights (ryg)", clientId = 37580, buy = 225  },
    { itemName = "teal 25 years balloon",        clientId = 37515, buy = 200  },
    { itemName = "teal balloon",                 clientId = 37499, buy = 200  },
    { itemName = "tibianus balloon",             clientId = 37509, buy = 400  },
    { itemName = "vessel of devovorga",          clientId = 37576, buy = 1250 },
    { itemName = "vessel of ferumbras",          clientId = 37573, buy = 1250 },
    { itemName = "vessel of gaz'haragoth",       clientId = 37572, buy = 1250 },
    { itemName = "vessel of horestis",           clientId = 37575, buy = 1250 },
    { itemName = "vessel of the mad mage",       clientId = 37574, buy = 1250 },
    { itemName = "yellow 25 years balloon",      clientId = 37513, buy = 200  },
    { itemName = "yellow balloon",               clientId = 37500, buy = 200  },
    { itemName = "yellow present kit",           clientId = 37570, buy = 200  },
}

-- ================= HELPERS =================
local function getTheons(player)
    local v = player:getStorageValue(THEONS_STORAGE)
    return v < 0 and 0 or v
end

local function addTheons(player, amount)
    player:setStorageValue(THEONS_STORAGE, getTheons(player) + amount)
end

local function spendTheons(player, amount)
    local current = getTheons(player)
    if current < amount then return false end
    player:setStorageValue(THEONS_STORAGE, current - amount)
    return true
end

local function getTaskKills(player)
    local v = player:getStorageValue(TASK_KILL_STORAGE)
    return v < 0 and 0 or v
end

local function isTaskActive(player)
    return player:getStorageValue(TASK_ACTIVE_STORAGE) == 1
end

local function taskOnCooldown(player)
    local last = player:getStorageValue(TASK_STORAGE)
    if last < 0 then return false end
    return (os.time() - last) < TASK_COOLDOWN
end

local function secondsToHMS(seconds)
    local h = math.floor(seconds / 3600)
    local m = math.floor((seconds % 3600) / 60)
    local s = seconds % 60
    return string.format("%02d:%02d:%02d", h, m, s)
end

local function getShopEntryByClientId(clientId)
    for _, it in ipairs(npcConfig.shop) do
        if it.clientId == clientId then
            return it
        end
    end
    return nil
end

-- ================= SHOP HOOKS =================
npcType.onBuyItem = function(npc, player, itemId, subType, amount, ignore, inBackpacks, totalCost)
    local it = getShopEntryByClientId(itemId)
    if not it then
        player:sendTextMessage(MESSAGE_TRADE, "I don't sell that.")
        return
    end

    if not it.clientId or it.clientId <= 0 or not it.buy or it.buy <= 0 then
        player:sendTextMessage(MESSAGE_TRADE, "This item is not available right now.")
        return
    end

    local costTheons = it.buy * amount

    if not spendTheons(player, costTheons) then
        player:sendTextMessage(MESSAGE_TRADE, string.format(
            "You don't have enough Theons. You need %d but only have %d.",
            costTheons, getTheons(player)
        ))
        return
    end

    local result = player:addItem(itemId, amount)
    if not result then
        addTheons(player, costTheons)
        player:sendTextMessage(MESSAGE_TRADE, "Could not add item. Check your inventory space.")
        return
    end

    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, string.format(
        "Bought %ix %s for %d Theons. You now have %d Theons.",
        amount, it.itemName, costTheons, getTheons(player)
    ))
end

npcType.onSellItem = function(npc, player, itemId, subtype, amount, ignore, name, totalCost)
    player:sendTextMessage(MESSAGE_TRADE, "I don't buy anything, sorry!")
end

npcType.onCheckItem = function(npc, player, clientId, subType)
end

-- ================= NPC HANDLER =================
local keywordHandler = KeywordHandler:new()
local npcHandler     = NpcHandler:new(keywordHandler)

npcType.onThink        = function(npc, interval)                           npcHandler:onThink(npc, interval)                           end
npcType.onAppear       = function(npc, creature)                           npcHandler:onAppear(npc, creature)                          end
npcType.onDisappear    = function(npc, creature)                           npcHandler:onDisappear(npc, creature)                       end
npcType.onMove         = function(npc, creature, fromPosition, toPosition) npcHandler:onMove(npc, creature, fromPosition, toPosition)  end
npcType.onSay          = function(npc, creature, type, message)            npcHandler:onSay(npc, creature, type, message)              end
npcType.onCloseChannel = function(npc, creature)                           npcHandler:onCloseChannel(npc, creature)                    end

npcHandler:setMessage(MESSAGE_GREET,    "Hello, adventurer! I can help you with a {task}, check your {theons}, or open the {trade} shop.")
npcHandler:setMessage(MESSAGE_FAREWELL, "Farewell! Keep collecting Theons!")

local TOPIC_NONE        = 0
local TOPIC_TASK_ACCEPT = 1

local function creatureSayCallback(npc, creature, type, message)
    local player = Player(creature)
    if not player then return false end

    if not npcHandler:checkInteraction(npc, creature) then
        return false
    end

    local playerId = player:getId()
    local msg      = message:lower()

    -- ---- THEONS ----
    if msg == "theons" then
        npcHandler:say(string.format(
            "You currently have %d Theons.", getTheons(player)
        ), npc, creature)
        npcHandler:setTopic(playerId, TOPIC_NONE)
        return true
    end

    -- ---- TASK ----
    if msg == "task" then
        if taskOnCooldown(player) then
            local remaining = TASK_COOLDOWN - (os.time() - player:getStorageValue(TASK_STORAGE))
            npcHandler:say(string.format(
                "You already completed a task recently. Come back in %s!",
                secondsToHMS(remaining)
            ), npc, creature)
            npcHandler:setTopic(playerId, TOPIC_NONE)
            return true
        end

        local kills = getTaskKills(player)

        -- Recuperar task asignada o asignar nueva random y guardarla YA
        local taskId = player:getStorageValue(TASK_ID_STORAGE)
        if taskId <= 0 then
            math.randomseed(os.time())
            taskId = math.random(1, #TASKS)
            player:setStorageValue(TASK_ID_STORAGE, taskId)
        end

        local task = TASKS[taskId]

        -- Task en progreso
        if isTaskActive(player) and kills < task.killsRequired then
            npcHandler:say(string.format(
                "Progress: %d/%d %s killed. You still need %d more.",
                kills, task.killsRequired,
                task.monsterName,
                task.killsRequired - kills
            ), npc, creature)
            npcHandler:setTopic(playerId, TOPIC_NONE)
            return true
        end

        -- Task completada, entregar recompensa
        if isTaskActive(player) and kills >= task.killsRequired then
            addTheons(player, task.theonReward)
            player:setStorageValue(TASK_KILL_STORAGE,   0)
            player:setStorageValue(TASK_ACTIVE_STORAGE, 0)
            player:setStorageValue(TASK_ID_STORAGE,    -1)
            player:setStorageValue(TASK_STORAGE,        os.time())
            npcHandler:say(string.format(
                "Excellent work! Here are %d Theons as your reward. You now have %d Theons total.",
                task.theonReward, getTheons(player)
            ), npc, creature)
            npcHandler:setTopic(playerId, TOPIC_NONE)
            return true
        end

        -- Mostrar task asignada (siempre la misma hasta completarla)
        npcHandler:say(string.format(
            "Your task is to kill %d %s. I will reward you with %d Theons. Do you accept? (yes/no)",
            task.killsRequired,
            task.monsterName,
            task.theonReward
        ), npc, creature)
        npcHandler:setTopic(playerId, TOPIC_TASK_ACCEPT)
        return true
    end

    -- ---- YES / NO ----
    if npcHandler:getTopic(playerId) == TOPIC_TASK_ACCEPT then
        if msg == "yes" or msg == "si" or msg == "sí" then
            player:setStorageValue(TASK_KILL_STORAGE,   0)
            player:setStorageValue(TASK_ACTIVE_STORAGE, 1)
            local task = TASKS[player:getStorageValue(TASK_ID_STORAGE)]
            npcHandler:say(string.format(
                "Great! Go kill %d %s and come back to me when you are done.",
                task.killsRequired, task.monsterName
            ), npc, creature)
            npcHandler:setTopic(playerId, TOPIC_NONE)
            return true
        end

        if msg == "no" then
            npcHandler:say(
                "Alright, but your task remains the same. Come back when you are ready!",
                npc, creature
            )
            npcHandler:setTopic(playerId, TOPIC_NONE)
            return true
        end
    end

    return false
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new(), npcConfig.name, true, true, true)
npcType:register(npcConfig)