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

    Debug.logMsg("All game data has been initialized.")
end
