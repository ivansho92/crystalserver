-- =====================================
-- Eternal Witch Boss - Dynamic Combat System
-- CrystalServer (revscript)
-- =====================================

local CURSE_DURATION = 8000
local TELEPORT_COOLDOWN = 5000
local MINION_SPAWN_TIME = 15000
local SHIELD_DURATION = 4000
local SHIELD_COOLDOWN = 12000
local FORM_CHANGE_TIME = 20000
local TRAP_ESCAPE_TIME = 20000  -- 20 segundos sin moverse = está traped

local bossData = {}

local witchBossEvent = CreatureEvent("WitchBossEvent")

-- OBTENER DATA DEL BOSS
local function getBossData(cid)
	if not bossData[cid] then
		bossData[cid] = {
			form = "normal",
			shieldActive = false,
			lastTeleport = 0,
			lastMinion = 0,
			lastFormChange = 0,
			lastShield = 0,
			lastPos = nil,
			lastMoveTime = os.time() * 1000,
			phase = 1,
			trapWarning = false
		}
	end
	return bossData[cid]
end

-- MALDICIONES
local function applyCurse(creature, target)
	if not target or not target:isPlayer() then return end
	
	local curseDamage = 50
	local tickInterval = 1000
	local ticks = math.ceil(CURSE_DURATION / tickInterval)
	
	creature:say("¡MALDITA SEAS!", TALKTYPE_MONSTER_SAY)
	target:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	
	local function curseTick(targetId, remainingTicks)
		local t = Creature(targetId)
		if t and remainingTicks > 0 then
			t:addHealth(-curseDamage)
			t:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
			addEvent(curseTick, tickInterval, targetId, remainingTicks - 1)
		end
	end
	
	curseTick(target:getId(), ticks)
end

-- TELEPORTACIÓN CON AOE
local function teleportWithAOE(creature)
	local data = getBossData(creature:getId())
	local now = os.time() * 1000
	
	if now - data.lastTeleport < TELEPORT_COOLDOWN then
		return false
	end
	
	local pos = creature:getPosition()
	local newPos = Position(
		pos.x + math.random(-5, 5),
		pos.y + math.random(-5, 5),
		pos.z
	)
	
	local tile = Tile(newPos)
	if tile and tile:isWalkable() then
		creature:teleportTo(newPos)
		newPos:sendMagicEffect(CONST_ME_TELEPORT)
		creature:say("¡DESAPAREZCO!", TALKTYPE_MONSTER_SAY)
		
		local spectators = Game.getSpectators(newPos, false, true, 6, 6)
		for i = 1, #spectators do
			if spectators[i]:isPlayer() then
				spectators[i]:addHealth(-math.random(150, 250))
				spectators[i]:getPosition():sendMagicEffect(CONST_ME_EXPLOSION)
			end
		end
		
		data.lastTeleport = now
		data.lastMoveTime = now
		data.lastPos = newPos
		return true
	end
	
	return false
end

-- DETECTOR DE TRAP - Si lleva 20 segundos sin moverse, se teletransporta UNA VEZ
local function checkTrapAndEscape(creature)
	local data = getBossData(creature:getId())
	local now = os.time() * 1000
	local currentPos = creature:getPosition()
	
	-- Si se movió, actualizar la posición y el tiempo
	if not data.lastPos or (data.lastPos.x ~= currentPos.x or data.lastPos.y ~= currentPos.y or data.lastPos.z ~= currentPos.z) then
		data.lastPos = currentPos
		data.lastMoveTime = now
		data.trapWarning = false
		return
	end
	
	local timeStuck = now - data.lastMoveTime
	
	-- Si lleva más de 20 segundos sin moverse Y NO SE HA ESCAPADO YA
	if timeStuck >= TRAP_ESCAPE_TIME and not data.trapWarning then
		creature:say("¡NO ME ATRAPARAN!", TALKTYPE_MONSTER_SAY)
		teleportWithAOE(creature)
		data.trapWarning = true  -- Marcar para que NO vuelva a escapar hasta que se mueva
	end
end

-- INVOCACIONES
local function spawnMinions(creature)
	local data = getBossData(creature:getId())
	local now = os.time() * 1000
	
	if now - data.lastMinion < MINION_SPAWN_TIME then
		return false
	end
	
	local pos = creature:getPosition()
	creature:say("¡VENGAN, MIS CRIATURAS!", TALKTYPE_MONSTER_SAY)
	
	for i = 1, 3 do
		local minionPos = Position(
			pos.x + math.random(-4, 4),
			pos.y + math.random(-4, 4),
			pos.z
		)
		
		local tile = Tile(minionPos)
		if tile and tile:isWalkable() then
			local minion = Game.createMonster("Witch Minion", minionPos)
			if minion then
				pos:sendMagicEffect(CONST_ME_MAGIC_BLUE)
			end
		end
	end
	
	data.lastMinion = now
	return true
end

-- CAMBIO DE FORMA
local function changeForm(creature)
	local data = getBossData(creature:getId())
	local now = os.time() * 1000
	
	if now - data.lastFormChange < FORM_CHANGE_TIME then
		return false
	end
	
	if data.form == "normal" then
		data.form = "powerful"
		creature:say("¡TRANSFORMACIÓN SUPREMA!", TALKTYPE_MONSTER_SAY)
		creature:setOutfit({lookType = 54, lookHead = 95, lookBody = 90, lookLegs = 95, lookFeet = 95, lookAddons = 3})
		creature:changeSpeed(300)
		creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	else
		data.form = "normal"
		creature:say("Regreso a mi forma...", TALKTYPE_MONSTER_SAY)
		creature:setOutfit({lookType = 54, lookHead = 0, lookBody = 0, lookLegs = 0, lookFeet = 0})
		creature:changeSpeed(0)
	end
	
	data.lastFormChange = now
	return true
end

-- ESCUDO MÁGICO
local function activateShield(creature)
	local data = getBossData(creature:getId())
	local now = os.time() * 1000
	
	if data.shieldActive or now - data.lastShield < SHIELD_COOLDOWN then
		return false
	end
	
	data.shieldActive = true
	creature:say("¡ESCUDO PROTECTOR!", TALKTYPE_MONSTER_SAY)
	creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	
	addEvent(function(cid)
		local c = Creature(cid)
		if c then
			local d = getBossData(cid)
			d.shieldActive = false
			d.lastShield = os.time() * 1000
			c:getPosition():sendMagicEffect(CONST_ME_MAGIC_GREEN)
		end
	end, SHIELD_DURATION, creature:getId())
	
	return true
end

-- FASES DE VIDA
local function updatePhase(creature)
	local maxHealth = creature:getMaxHealth()
	local currentHealth = creature:getHealth()
	local healthPercent = (currentHealth / maxHealth) * 100
	local data = getBossData(creature:getId())
	
	local oldPhase = data.phase
	
	if healthPercent <= 25 then
		data.phase = 4
	elseif healthPercent <= 50 then
		data.phase = 3
	elseif healthPercent <= 75 then
		data.phase = 2
	else
		data.phase = 1
	end
	
	if oldPhase ~= data.phase then
		creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_RED)
	end
end

-- ABSORCIÓN DE DAÑO
local function absorbDamage(creature)
	local data = getBossData(creature:getId())
	
	if data.shieldActive then
		return
	end
	
	local healthPercent = (creature:getHealth() / creature:getMaxHealth()) * 100
	
	if healthPercent < 60 and data.phase >= 2 and math.random(1, 100) <= 20 then
		creature:say("¡ABSORBO TU ENERGÍA!", TALKTYPE_MONSTER_SAY)
		creature:addHealth(math.random(150, 300))
		creature:getPosition():sendMagicEffect(CONST_ME_MAGIC_BLUE)
	end
end

-- EVENTO PRINCIPAL onThink
function witchBossEvent.onThink(creature)
	if creature:getName() ~= "Eternal Witch" then
		return true
	end
	
	updatePhase(creature)
	absorbDamage(creature)
	checkTrapAndEscape(creature)  -- Detecta trap pero solo escapa UNA VEZ cada 20 segundos
	
	local data = getBossData(creature:getId())
	local rand = math.random(1, 100)
	local target = creature:getTarget()
	
	if data.phase >= 3 then
		if rand <= 15 then
			teleportWithAOE(creature)
		elseif rand <= 30 then
			if target then applyCurse(creature, target) end
		elseif rand <= 45 then
			spawnMinions(creature)
		elseif rand <= 60 then
			changeForm(creature)
		elseif rand <= 75 then
			activateShield(creature)
		end
	elseif data.phase == 2 then
		if rand <= 20 then
			teleportWithAOE(creature)
		elseif rand <= 40 then
			if target then applyCurse(creature, target) end
		elseif rand <= 60 then
			spawnMinions(creature)
		elseif rand <= 80 then
			activateShield(creature)
		end
	else
		if rand <= 25 then
			teleportWithAOE(creature)
		elseif rand <= 50 then
			if target then applyCurse(creature, target) end
		end
	end
	
	return true
end

witchBossEvent:register()