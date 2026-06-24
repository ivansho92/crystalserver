-- =====================================
-- Draconic Anti-Trap System
-- CrystalServer 4.1.6 (revscript)
-- =====================================

local ESCAPE_TIME = 20000      -- ms sin moverse para considerar trap
local TELEPORT_RANGE = 4      -- sqm máximos para blink
local SPEED_BONUS = 620       -- speed extra al escapar
local SPEED_DURATION = 6000  -- duración del speed bonus (ms)

local lastState = {}

local draconicEscape = CreatureEvent("DraconicEscape")

function draconicEscape.onThink(creature)
	if not creature:isMonster() then
		return true
	end

	if creature:getName() ~= "Black Deity" then
		return true
	end

	local cid = creature:getId()
	local pos = creature:getPosition()
	local now = os.time() * 1000

	if not lastState[cid] then
		lastState[cid] = {
			pos = pos,
			time = now
		}
		return true
	end

	local data = lastState[cid]

	-- No se movió
	if data.pos == pos then
		if now - data.time >= ESCAPE_TIME then
			for i = 1, 12 do
				local newPos = Position(
					pos.x + math.random(-TELEPORT_RANGE, TELEPORT_RANGE),
					pos.y + math.random(-TELEPORT_RANGE, TELEPORT_RANGE),
					pos.z
				)

				local tile = Tile(newPos)
				if tile and tile:isWalkable() then
					creature:teleportTo(newPos)
					newPos:sendMagicEffect(CONST_ME_TELEPORT)

					-- Speed boost
					creature:changeSpeed(SPEED_BONUS)

					addEvent(function(id)
						local m = Creature(id)
						if m then
							m:changeSpeed(-SPEED_BONUS)
						end
					end, SPEED_DURATION, cid)

					lastState[cid] = nil
					return true
				end
			end
		end
	else
		data.pos = pos
		data.time = now
	end

	return true
end

draconicEscape:register()