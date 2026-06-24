-- ======================================
-- DRACONIC WEEKEND RAID (CrystalServer)
-- Sábado: 20 Draconics
-- Domingo: 40 Draconics
-- Hora: 7:00 PM (HORA REAL DEL SERVER)
-- Aviso: 5 minutos antes
-- ======================================

local config = {
	-- ÁREA DEL RAID
	fromPos = Position(1047, 908, 7),
	toPos   = Position(1092, 957, 7),

	monsterName = "Draconic",

	-- HORARIOS (HORA REAL DEL SERVER)
	warningTime = { hour = 18, minute = 55 }, -- 6:55 PM
	raidTime    = { hour = 19, minute = 0  }, -- 7:00 PM

	saturdayAmount = 20,
	sundayAmount   = 40,

	-- storages
	warningStorage = 910010,
	raidStorage    = 910011
}

local function spawnDraconics(amount)
	for i = 1, amount do
		local pos = Position(
			math.random(config.fromPos.x, config.toPos.x),
			math.random(config.fromPos.y, config.toPos.y),
			config.fromPos.z
		)

		pos:sendMagicEffect(CONST_ME_TELEPORT)
		Game.createMonster(config.monsterName, pos, true, true)
	end
end

local globalEvent = GlobalEvent("draconic_weekend_raid")

function globalEvent.onThink(interval)
	local date = os.date("*t")

	-- Solo sábado (7) y domingo (1)
	if date.wday ~= 7 and date.wday ~= 1 then
		return true
	end

	-- ===== AVISO 5 MINUTOS ANTES =====
	if date.hour == config.warningTime.hour and date.min == config.warningTime.minute then
		if Game.getStorageValue(config.warningStorage) ~= date.yday then
			Game.broadcastMessage(
				"El RAID DRACONIC comenzará en 5 minutos. ¡Prepárense!",
				MESSAGE_STATUS_WARNING
			)
			Game.setStorageValue(config.warningStorage, date.yday)
		end
	end

	-- ===== RAID =====
	if date.hour == config.raidTime.hour and date.min == config.raidTime.minute then
		if Game.getStorageValue(config.raidStorage) == date.yday then
			return true
		end

		Game.broadcastMessage(
			"¡El RAID DRACONIC ha comenzado!",
			MESSAGE_STATUS_WARNING
		)

		if date.wday == 7 then
			spawnDraconics(config.saturdayAmount)
		else -- domingo
			spawnDraconics(config.sundayAmount)
		end

		Game.setStorageValue(config.raidStorage, date.yday)
	end

	return true
end

-- chequea cada minuto
globalEvent:interval(60 * 1000)
globalEvent:register()
