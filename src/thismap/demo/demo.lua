Debug = {

    onEsc = function()
        local group = CreateGroup()

        GroupEnumUnitsOfPlayer(group, GetTriggerPlayer(), nil)

        for i = 1, BlzGroupGetSize(group) do
            local enumUnit = BlzGroupUnitAt(group, i - 1)

            if IsUnitType(enumUnit, UNIT_TYPE_HERO) then
                SetHeroLevel(enumUnit, GetHeroLevel(enumUnit) + 1, true)
                UnitResetCooldown(enumUnit)
            end
        end

        DestroyGroup(group)
    end,

    initialize = function()
        Debug.trigger = CreateTrigger()

        for i = 0, bj_MAX_PLAYERS - 1 do
            BlzTriggerRegisterPlayerKeyEvent(Debug.trigger, Player(i), OSKEY_ESCAPE, 0, true)
        end

        TriggerAddAction(Debug.trigger, Debug.onEsc)
    end

}

TimerStart(CreateTimer(), 0.0, false, function()
    bj_lastCreatedQuest = CreateQuest()
    QuestSetTitle(bj_lastCreatedQuest, "title")
    QuestSetDescription(bj_lastCreatedQuest, "description")
    QuestSetIconPath(bj_lastCreatedQuest, "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp")
    QuestSetRequired(bj_lastCreatedQuest, true)
    QuestSetDiscovered(bj_lastCreatedQuest, true)
    QuestSetCompleted(bj_lastCreatedQuest, false)

    bj_lastCreatedQuest = CreateQuest()
    QuestSetTitle(bj_lastCreatedQuest, "title")
    QuestSetDescription(bj_lastCreatedQuest, "description")
    QuestSetIconPath(bj_lastCreatedQuest, "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp")
    QuestSetRequired(bj_lastCreatedQuest, true)
    QuestSetDiscovered(bj_lastCreatedQuest, true)
    QuestSetCompleted(bj_lastCreatedQuest, false)

    bj_lastCreatedQuest = CreateQuest()
    QuestSetTitle(bj_lastCreatedQuest, "title")
    QuestSetDescription(bj_lastCreatedQuest, "description")
    QuestSetIconPath(bj_lastCreatedQuest, "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp")
    QuestSetRequired(bj_lastCreatedQuest, true)
    QuestSetDiscovered(bj_lastCreatedQuest, true)
    QuestSetCompleted(bj_lastCreatedQuest, false)

    bj_lastCreatedQuest = CreateQuest()
    QuestSetTitle(bj_lastCreatedQuest, "title")
    QuestSetDescription(bj_lastCreatedQuest, "description")
    QuestSetIconPath(bj_lastCreatedQuest, "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp")
    QuestSetRequired(bj_lastCreatedQuest, true)
    QuestSetDiscovered(bj_lastCreatedQuest, true)
    QuestSetCompleted(bj_lastCreatedQuest, false)

    bj_lastCreatedQuest = CreateQuest()
    QuestSetTitle(bj_lastCreatedQuest, "title")
    QuestSetDescription(bj_lastCreatedQuest, "description")
    QuestSetIconPath(bj_lastCreatedQuest, "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp")
    QuestSetRequired(bj_lastCreatedQuest, true)
    QuestSetDiscovered(bj_lastCreatedQuest, true)
    QuestSetCompleted(bj_lastCreatedQuest, false)

    bj_lastCreatedQuest = CreateQuest()
    QuestSetTitle(bj_lastCreatedQuest, "title")
    QuestSetDescription(bj_lastCreatedQuest, "description")
    QuestSetIconPath(bj_lastCreatedQuest, "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp")
    QuestSetRequired(bj_lastCreatedQuest, true)
    QuestSetDiscovered(bj_lastCreatedQuest, true)
    QuestSetCompleted(bj_lastCreatedQuest, false)

    bj_lastCreatedQuest = CreateQuest()
    QuestSetTitle(bj_lastCreatedQuest, "title")
    QuestSetDescription(bj_lastCreatedQuest, "description")
    QuestSetIconPath(bj_lastCreatedQuest, "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp")
    QuestSetRequired(bj_lastCreatedQuest, false)
    QuestSetDiscovered(bj_lastCreatedQuest, true)
    QuestSetCompleted(bj_lastCreatedQuest, false)

    bj_lastCreatedQuest = CreateQuest()
    QuestSetTitle(bj_lastCreatedQuest, "title")
    QuestSetDescription(bj_lastCreatedQuest, "description")
    QuestSetIconPath(bj_lastCreatedQuest, "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp")
    QuestSetRequired(bj_lastCreatedQuest, false)
    QuestSetDiscovered(bj_lastCreatedQuest, true)
    QuestSetCompleted(bj_lastCreatedQuest, false)

    bj_lastCreatedQuest = CreateQuest()
    QuestSetTitle(bj_lastCreatedQuest, "title")
    QuestSetDescription(bj_lastCreatedQuest, "description")
    QuestSetIconPath(bj_lastCreatedQuest, "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp")
    QuestSetRequired(bj_lastCreatedQuest, false)
    QuestSetDiscovered(bj_lastCreatedQuest, true)
    QuestSetCompleted(bj_lastCreatedQuest, false)
end)
