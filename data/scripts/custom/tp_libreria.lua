-- Spawnea los libros de teleport en startup

local bookSpawner = GlobalEvent("BookSpawner")

function bookSpawner.onStartup()

	local items = {
		{50978, Position(33185, 31794, 7)},
		{51528, Position(32522, 32512, 8)},
		{51624, Position(32526, 32512, 8)},
		{51625, Position(32536, 32512, 8)},
		{51626, Position(32540, 32512, 8)},

		{51756, Position(32526, 32512, 9)},
		{51756, Position(32552, 32594, 10)},
		{51756, Position(32585, 32557, 11)}
	}

	for _, data in ipairs(items) do
		local itemId = data[1]
		local pos = data[2]

		local tile = Tile(pos)
		if not tile then
			Game.createTile(pos)
			tile = Tile(pos)
		end

		if tile then
			local existingItem = tile:getItemById(itemId)
			if not existingItem then
				Game.createItem(itemId, 1, pos)
				print("[BookSpawner] Spawned item " .. itemId ..
					" at " .. pos.x .. "," .. pos.y .. "," .. pos.z)
			end
		end
	end

	return true
end

bookSpawner:register()
