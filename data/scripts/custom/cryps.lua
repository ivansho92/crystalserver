local teleportMove = MoveEvent()

local teleports = {
    {
        position = Position(32821, 31533, 10),
        destination = Position(32881, 31599, 11),
    },
    {
        position = Position(32823, 31533, 10),
        destination = Position(32881, 31599, 11),
    },
    {
        position = Position(32881, 31598, 11),
        destination = Position(32822, 31534, 10),
    }
}

local portalMap = {}
for _, tp in ipairs(teleports) do
    local key = tp.position.x .. "," .. tp.position.y .. "," .. tp.position.z
    portalMap[key] = tp.destination
end

function teleportMove.onStepIn(creature, item, position, fromPosition)
    local player = creature:getPlayer()
    if not player then return true end

    local key = position.x .. "," .. position.y .. "," .. position.z
    local dest = portalMap[key]
    if dest then
        player:teleportTo(dest)
        Position(dest):sendMagicEffect(CONST_ME_TELEPORT)
    end
    return true
end

teleportMove:type("stepin")
teleportMove:id(11553)
teleportMove:register()