local THEONS_STORAGE = 47000

local BONUS_REWARDS = {
    ["draconic"] = 1,
    ["black deity"] = 50,
    ["titanbane gnawer"] = 50,
    ["eternal witch"] = 50,
}

local deathEvent = CreatureEvent("TheonBonusDeath")

function deathEvent.onDeath(creature, corpse, killer, mostDamageKiller)
    if not creature or not creature:isMonster() then
        return true
    end

    local reward = BONUS_REWARDS[creature:getName():lower()]
    if not reward then
        return true
    end

    local player = nil

    if killer and killer:isPlayer() then
        player = killer
    elseif mostDamageKiller and mostDamageKiller:isPlayer() then
        player = mostDamageKiller
    end

    if not player then
        return true
    end

    local current = player:getStorageValue(THEONS_STORAGE)
    if current < 0 then
        current = 0
    end

    local total = current + reward

    player:setStorageValue(THEONS_STORAGE, total)

    player:sendTextMessage(
        MESSAGE_EVENT_ADVANCE,
        string.format(
            "[Theons] +%d Theon%s from %s. Total: %d Theons.",
            reward,
            reward == 1 and "" or "s",
            creature:getName(),
            total
        )
    )

    return true
end

deathEvent:register()

local startup = GlobalEvent("TheonBonusStartup")

function startup.onStartup()
    for monsterName, _ in pairs(BONUS_REWARDS) do
        local mType = MonsterType(monsterName)

        if mType then
            mType:registerEvent("TheonBonusDeath")
        end
    end

    return true
end

startup:register()