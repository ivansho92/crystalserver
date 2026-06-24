local expScroll = Action()

function expScroll.onUse(player, item, fromPosition, target, toPosition, isHotkey)

    local currentLevel = player:getLevel()
    local targetLevel = currentLevel + 2

    local currentExp = player:getExperience()
    local expForTarget = Game.getExperienceForLevel(targetLevel)

    local expToGive = expForTarget - currentExp

    if expToGive > 0 then
        player:addExperience(expToGive, false) -- false = sin mostrar experiencia extra
    end

    player:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
    player:getPosition():sendMagicEffect(CONST_ME_HOLYAREA)
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "You advanced 2 levels!")

    item:remove(1)
    return true
end

expScroll:id(23682)
expScroll:register()