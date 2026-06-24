local houseTeleport = Action()

local config = {
    storage = 19027,
    cooldown = 10,
    effectOnTeleport = CONST_ME_TELEPORT
}

function houseTeleport.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    local inFight = player:isPzLocked() or player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT)
    if inFight then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "No puedes usar este objeto mientras estás en batalla.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    local expires = player:getStorageValue(config.storage)
    if expires > os.time() then
        local remaining = expires - os.time()
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Puedes usar este objeto nuevamente en: " .. remaining .. " segundos.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    -- Verifica que tenga al menos una casa (via repo helper)
    local house = Game.getHouseByPlayerGUID(player:getGuid())
    if not house then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "¡No posees ninguna casa para teletransportarte!")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    local exitPos = house:getExitPosition()
    if exitPos then
        player:setStorageValue(config.storage, os.time() + config.cooldown)
        player:teleportTo(exitPos, true)
        player:getPosition():sendMagicEffect(config.effectOnTeleport)
    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "No se pudo encontrar la entrada de tu casa.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
    end
    return true
end

houseTeleport:id(49273)
houseTeleport:register()