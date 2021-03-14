Preload = {

    dummyUnit = nil,

    unit = function(id)
        RemoveUnit(CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), id, MAP_HIDDEN_X, MAP_HIDDEN_Y, 0.0))
    end,

    item = function(id)
        RemoveItem(CreateItem(id, MAP_HIDDEN_X, MAP_HIDDEN_Y))
    end,

    effect = function(path)
        DestroyEffect(AddSpecialEffect(path, MAP_HIDDEN_X, MAP_HIDDEN_Y))
    end,

    lightning = function(name)
        DestroyLightning(AddLightning(name, true, MAP_HIDDEN_X, MAP_HIDDEN_Y, MAP_HIDDEN_X, MAP_HIDDEN_Y))
    end,

    sound = function(path)
        local sound = CreateSound(path, false, false, false, 10, 10, "")

        SetSoundVolume(sound, 0)
        StartSound(sound)
        KillSoundWhenDone(sound)
    end,

    ability = function(id)
        if Preload.dummyUnit == nil then
            Preload.dummyUnit = DummyUnit.create(Player(PLAYER_NEUTRAL_PASSIVE), MAP_HIDDEN_X, MAP_HIDDEN_Y, MAP_HIDDEN_Z, 0.0)
        end

        return UnitAddAbility(Preload.dummyUnit, id) and UnitRemoveAbility(Preload.dummyUnit, id)
    end

}
