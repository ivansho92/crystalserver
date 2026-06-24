local globalevent = GlobalEvent("vip_only")

function globalevent.onThink(interval)
    for _, player in ipairs(Game.getPlayers()) do
        if not player:getGroup():getAccess() and player:isVip() then
            player:say("VIP", TALKTYPE_MONSTER_SAY)
        end
    end
    return true
end

globalevent:interval(5000)
globalevent:register()
