Force = {

    -- function CreateForce() end
    -- function DestroyForce(whichForce) end

    -- function ForceAddPlayer(whichForce, whichPlayer) end
    -- function ForceRemovePlayer(whichForce, whichPlayer) end
    -- function BlzForceHasPlayer(whichForce, whichPlayer) end
    -- function ForceClear(whichForce) end

    -- function ForceEnumPlayers(whichForce, filter) end
    -- function ForceEnumPlayersCounted(whichForce, filter, countLimit) end
    -- function ForceEnumAllies(whichForce, whichPlayer, filter) end
    -- function ForceEnumEnemies(whichForce, whichPlayer, filter) end
    -- function ForForce(whichForce, callback) end

    offensivePlayers = CreateForce(),
    defensivePlayers = CreateForce(),
    heroOwnerPlayers = CreateForce(),
    peonOwnerPlayers = CreateForce(),

    allMapPlayers = CreateForce(),

    getMokkOwnerPlayer = function()
        return Player(0x00)
    end,

    getPeonOwnerPlayer = function()
        return Player(0x16)
    end,

    initialize = function()
        -- Initialize offensive players:
        ForceAddPlayer(Force.offensivePlayers, Player(0x00))

        -- Initialize defensive players:
        ForceAddPlayer(Force.defensivePlayers, Player(0x02))
        ForceAddPlayer(Force.defensivePlayers, Player(0x03))
        ForceAddPlayer(Force.defensivePlayers, Player(0x04))
        ForceAddPlayer(Force.defensivePlayers, Player(0x05))
        ForceAddPlayer(Force.defensivePlayers, Player(0x16))

        -- Initialize hero owner players:
        ForceAddPlayer(Force.heroOwnerPlayers, Player(0x02))
        ForceAddPlayer(Force.heroOwnerPlayers, Player(0x03))
        ForceAddPlayer(Force.heroOwnerPlayers, Player(0x04))
        ForceAddPlayer(Force.heroOwnerPlayers, Player(0x05))

        -- Initialize peon owner players:
        ForceAddPlayer(Force.peonOwnerPlayers, Player(0x00))

        SetPlayerOnScoreScreen(Player(0x00), false)
        SetPlayerOnScoreScreen(Player(0x16), false)
    end

}
