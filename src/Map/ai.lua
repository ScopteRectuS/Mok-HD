Ai = { }

function Ai.start(forPlayer)
    StartMeleeAI(forPlayer, 'ai scripts\\anmok.lua')
end

function Ai.initialize()
    for _, value in pairs(Team.defensiveForce) do
        if GetPlayerSlotState(value) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(value) == MAP_CONTROL_COMPUTER then
            Ai.start(value)
        end
    end

    for _, value in pairs(Team.offensiveForce) do
        if GetPlayerSlotState(value) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController(value) == MAP_CONTROL_COMPUTER then
            Ai.start(value)
        end
    end
end