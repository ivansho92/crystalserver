-- Agregar esto en creaturescripts
function onLevelChange(player, newLevel, oldLevel)
    if newLevel ~= 500 then
        return true -- Si no es nivel 500, ignorar completamente
    end

    local accountId = player:getAccountId()

    -- Verificar si tiene referidor
    local accQuery = db.storeQuery(
        "SELECT referred_by, creation FROM accounts WHERE id = " .. accountId
    )

    if not accQuery then
        return true
    end

    local referrerAccountId = result.getNumber(accQuery, "referred_by")
    local creation = result.getNumber(accQuery, "creation")
    result.free(accQuery)

    if not referrerAccountId or referrerAccountId == 0 then
        return true -- No tiene referidor
    end

    local currentTime = os.time()
    local daysSinceCreation = math.floor((currentTime - creation) / 86400)
    local totalOnlineTime = player:getStorageValue(STORAGE_ONLINE_TIME) -- o desde DB

    -- Verificar condiciones
    if daysSinceCreation > 3 then
        print("[REFERRAL] " .. player:getName() .. " llego a 500 pero su cuenta tiene " .. daysSinceCreation .. " dias.")
        return true
    end

    -- Verificar si ya fue recompensado
    local checkReward = db.storeQuery(
        "SELECT id FROM referral_rewards WHERE referrer_id = " .. referrerAccountId ..
        " AND referred_id = " .. accountId
    )

    if checkReward then
        result.free(checkReward)
        return true -- Ya fue recompensado
    end

    -- Dar recompensa
    db.query(
        "UPDATE accounts SET coins_transferable = coins_transferable + 50 WHERE id = " .. referrerAccountId
    )

    db.query(
        "INSERT INTO referral_rewards (referrer_id, referred_id, reward_date) VALUES (" ..
        referrerAccountId .. ", " .. accountId .. ", " .. currentTime .. ")"
    )

    print("[REFERRAL] ✅ " .. player:getName() .. " llego a nivel 500. Cuenta " .. referrerAccountId .. " recibio 50 coins.")

    -- Notificar al referido
    player:sendTextMessage(MESSAGE_EVENT_ADVANCE,
        "¡Felicidades! Tu referidor ha sido recompensado con 50 Tibia Coins.")

    -- Notificar al referidor si está online
    local refQuery = db.storeQuery(
        "SELECT id FROM players WHERE account_id = " .. referrerAccountId .. " LIMIT 1"
    )
    if refQuery then
        local refPlayerId = result.getNumber(refQuery, "id")
        result.free(refQuery)
        local refPlayer = Player(refPlayerId)
        if refPlayer then
            refPlayer:sendTextMessage(MESSAGE_EVENT_ADVANCE,
                "¡" .. player:getName() .. " llego a nivel 500! Recibiste 50 Tibia Coins por tu referido.")
        end
    end

    return true
end