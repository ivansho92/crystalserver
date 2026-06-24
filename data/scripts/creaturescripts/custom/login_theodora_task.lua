print("[TheodoraTaskLogin] loaded")

local loginTheodora = CreatureEvent("TheodoraTaskLogin")

function loginTheodora.onLogin(player)
    player:registerEvent("TheodoraTaskDeath")
    return true
end

loginTheodora:register()