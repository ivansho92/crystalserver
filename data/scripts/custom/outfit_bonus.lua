local addonBonus = CreatureEvent("AddonBonus")

function addonBonus.onLogin(player)
    local conditions = {
        retrowarrior = Condition(CONDITION_ATTRIBUTES),
        retromage = Condition(CONDITION_ATTRIBUTES),
        retrohunter = Condition(CONDITION_ATTRIBUTES),
        retrocitizen = Condition(CONDITION_ATTRIBUTES),
        retrosummoner = Condition(CONDITION_ATTRIBUTES)
    }

    -- Retro Mage - looktype 968 (female), 969 (male)
    -- 4 magic level, 150 hp, 500 mana
    conditions.retromage:setParameter(CONDITION_PARAM_TICKS, -1)
    conditions.retromage:setParameter(CONDITION_PARAM_STAT_MAGICPOINTS, 4)
    conditions.retromage:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTS, 150)
    conditions.retromage:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTS, 500)

    -- Retro Warrior - looktype 962 (male), 963 (female)
    -- 4 melee, 500 hp, 100 mana
    conditions.retrowarrior:setParameter(CONDITION_PARAM_TICKS, -1)
    conditions.retrowarrior:setParameter(CONDITION_PARAM_SKILL_MELEE, 4)
    conditions.retrowarrior:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTS, 500)
    conditions.retrowarrior:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTS, 100)

    -- Retro Hunter - looktype 972 (male), 973 (female)
    -- 4 distance, 350 hp, 150 mana
    conditions.retrohunter:setParameter(CONDITION_PARAM_TICKS, -1)
    conditions.retrohunter:setParameter(CONDITION_PARAM_SKILL_DISTANCE, 4)
    conditions.retrohunter:setParameter(CONDITION_PARAM_STAT_MAXHITPOINTS, 350)
    conditions.retrohunter:setParameter(CONDITION_PARAM_STAT_MAXMANAPOINTS, 150)

    -- Retro Citizen - looktype 975 (male), 974 (female)
    -- 5.00% critical chance y 10.0% critical damage (multiplicar por 100)
    conditions.retrocitizen:setParameter(CONDITION_PARAM_TICKS, -1)
    -- conditions.retrocitizen:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_CHANCE, 500)  -- 5.00%
    conditions.retrocitizen:setParameter(CONDITION_PARAM_SKILL_CRITICAL_HIT_DAMAGE, 1500) -- 15.0%

    -- Retro Summoner - looktype 965 (male), 964 (female)
    -- 5.00% life leech (chance & amount), 5.00% mana leech (chance & amount)
    conditions.retrosummoner:setParameter(CONDITION_PARAM_TICKS, -1)
    conditions.retrosummoner:setParameter(CONDITION_PARAM_SKILL_LIFE_LEECH_CHANCE, 500)   -- 5.00%
    conditions.retrosummoner:setParameter(CONDITION_PARAM_SKILL_LIFE_LEECH_AMOUNT, 500)   -- 5.00%
    conditions.retrosummoner:setParameter(CONDITION_PARAM_SKILL_MANA_LEECH_CHANCE, 500)   -- 5.00%
    conditions.retrosummoner:setParameter(CONDITION_PARAM_SKILL_MANA_LEECH_AMOUNT, 500)   -- 5.00%

    local playerId = player:getGuid()
    local lookTypeQuery = db.storeQuery('SELECT `looktype` FROM `players` WHERE `id` =' .. playerId .. ' LIMIT 1;')
    local lookType = Result.getNumber(lookTypeQuery, "looktype")

    -- Retro Mage
    if lookType == 968 or lookType == 969 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Retro Mage bonus:\n[Magic Level] +4\n[HP] +150\n[MANA] +500")
        player:addCondition(conditions.retromage)

    -- Retro Warrior
    elseif lookType == 962 or lookType == 963 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Retro Warrior bonus:\n[Melee Skill] +4\n[HP] +500\n[MANA] +100")
        player:addCondition(conditions.retrowarrior)

    -- Retro Hunter
    elseif lookType == 972 or lookType == 973 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Retro Hunter bonus:\n[Distance Skill] +4\n[HP] +350\n[MANA] +150")
        player:addCondition(conditions.retrohunter)

    -- Retro Citizen
    elseif lookType == 975 or lookType == 974 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Retro Citizen bonus:\n[Critical Damage] +15.0%")
        player:addCondition(conditions.retrocitizen)

    -- Retro Summoner
    elseif lookType == 965 or lookType == 964 then
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "Retro Summoner bonus:\n[Life Leech Chance] +5.00%\n[Life Leech Amount] +5.00%\n[Mana Leech Chance] +5.00%\n[Mana Leech Amount] +5.00%")
        player:addCondition(conditions.retrosummoner)

    else
        player:sendTextMessage(MESSAGE_EVENT_ADVANCE, "No tienes un outfit con bonus especial.")
    end
    return true
end

addonBonus:register()