local effects = {
    {position = Position(32369, 32241, 7), text = 'Welcome to Draconic!', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32365, 32236, 7), text = 'Trainers', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(32373, 32236, 7), text = 'Events rooms', effect = CONST_ME_GROUNDSHAKER},    
    {position = Position(1055, 1009, 7), text = 'NPC room ', effect = CONST_ME_GROUNDSHAKER},
    {position = Position(1058, 1005, 7), text = 'Training room', effect = CONST_ME_GROUNDSHAKER},  
    {position = Position(1062, 1000, 7), text = 'Adventurer island', effect = CONST_ME_GROUNDSHAKER},  
    {position = Position(1067, 1005, 7), text = 'Invasion island', effect = CONST_ME_GROUNDSHAKER},  
    {position = Position(1075, 1006, 7), text = 'Invasion VIP', effect = CONST_ME_GROUNDSHAKER},  
    {position = Position(1071, 1010, 7), text = 'Roulette', effect = CONST_ME_GROUNDSHAKER},  
    {position = Position(1063, 1010, 7), text = 'Trade island', effect = CONST_ME_GROUNDSHAKER},  
    {position = Position(32373, 32232, 7), text = 'TP Zone VIP', effect = CONST_ME_GROUNDSHAKER},  	
}

local animatedText = GlobalEvent("AnimatedText") 
function animatedText.onThink(interval)
    for i = 1, #effects do
        local settings = effects[i]
        local spectators = Game.getSpectators(settings.position, false, true, 7, 7, 5, 5)
        if #spectators > 0 then
            if settings.text then
                for i = 1, #spectators do
                    spectators[i]:say(settings.text, TALKTYPE_MONSTER_SAY, false, spectators[i], settings.position)
                end
            end
            if settings.effect then
                settings.position:sendMagicEffect(settings.effect)
            end
        end
    end
   return true
end

animatedText:interval(4000)
animatedText:register()