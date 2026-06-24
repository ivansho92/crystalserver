-- Carga la tabla global definida en data/libs/custom/hunt_refiller.lua
dofile('data/libs/custom/hunt_refiller.lua')
HUNT_REFILLER = HUNT_REFILLER or {}

local refiller = Action()
local timeToDisapear = 150 * 1000

function refiller.onUse(player, item, fromPosition, target, toPosition, isHotkey)
    -- Checar si es VIP
    if player:getVipDays() <= 0 then
        player:sendCancelMessage("You need to be VIP to use this item.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    if (not Tile(player:getPosition()):hasFlag(TILESTATE_PROTECTIONZONE)
        and player:getCondition(CONDITION_INFIGHT, CONDITIONID_DEFAULT))
        or player:isPzLocked() then

        player:sendCancelMessage("You can't use this while in battle.")
        player:getPosition():sendMagicEffect(CONST_ME_POFF)
        return true
    end

    local pid = player:getId()
    if HUNT_REFILLER[pid] and HUNT_REFILLER[pid].time > os.time() then
        player:sendCancelMessage("You need to wait before use this item again")
        return true
    end

    if not HUNT_REFILLER[pid] then HUNT_REFILLER[pid] = {} end

    local position = player:getPosition()
    local npc = Game.createNpc('Hunt Refiller', position)
    HUNT_REFILLER[pid].time = os.time() + 30 * 60 -- Cooldown de 30 minutos
    HUNT_REFILLER[pid].npc = npc:getId()

    addEvent(function() 
        npc:remove()
    end, timeToDisapear)

    if npc then
        npc:setMasterPos(position)
        position:sendMagicEffect(CONST_ME_MAGIC_RED)
    end

    return true
end

refiller:id(43511)
refiller:register()