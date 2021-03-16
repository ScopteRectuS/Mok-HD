InitGlobals = function()

    -- Map initialization:
    TOC.initialize()
    Force.initialize()

    -- Game data initialization:
    Game.initialize()
    Ai.initialize()

    -- Hero data initialization:
    HeroPick.initialize()
    HeroRevive.initialize()
    HeroExperience.initialize()
    SkillPoints.initialize()

    -- Peon data initialization:
    WatchTower.initialize()
    SentryWard.initialize()
    PeonsBurrow.initialize()
    Peon.initialize()

    -- Mokk data initialization:

    if DEBUG_MODE then
        print("DEBUG_MODE: all game data has been initialized.")
    end
end
