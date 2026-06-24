print("[TheodoraTaskDeath] loaded")

local TASK_KILL_STORAGE   = 47002
local TASK_ACTIVE_STORAGE = 47003
local TASK_ID_STORAGE     = 47004

local TASKS = {
    [1] = { monsterName = "Infernal Demon", killsRequired = 500, theonReward = 50 },
    [2] = { monsterName = "Rotworm",        killsRequired = 350, theonReward = 10 },
    [3] = { monsterName = "Frost Troll",    killsRequired = 420, theonReward = 10 },
    [4] = { monsterName = "Terrorsleep",    killsRequired = 250, theonReward = 25 },
}

local theodoraTaskDeath = CreatureEvent("TheodoraTaskDeath")

-- Cambiado de onKill -> onDeath para quitar el warning "Deprecated use of onKill"
function theodoraTaskDeath.onDeath(creature, corpse, killer, mostDamage, unjustified, mostDamage_unjustified)
    if not creature or not creature:isMonster() then
        return true
    end

    -- Intentar resolver el player con el killer o el que hizo más daño
    local player = (killer and killer:getPlayer()) or (mostDamage and mostDamage:getPlayer())
    if not player then
        return true
    end

    -- Solo contar si la task está activa
    if player:getStorageValue(TASK_ACTIVE_STORAGE) ~= 1 then
        return true
    end

    local taskId = player:getStorageValue(TASK_ID_STORAGE)
    local task = TASKS[taskId]
    if not task then
        return true
    end

    -- El monster que murió es "creature" (antes era "target")
    if creature:getName():lower() ~= task.monsterName:lower() then
        return true
    end

    local kills = player:getStorageValue(TASK_KILL_STORAGE)
    if kills < 0 then kills = 0 end

    if kills < task.killsRequired then
        kills = kills + 1
        player:setStorageValue(TASK_KILL_STORAGE, kills)
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
            string.format("[TheodoraTask] %d/%d %s killed.",
                kills, task.killsRequired, task.monsterName))
    end

    return true
end

theodoraTaskDeath:register()