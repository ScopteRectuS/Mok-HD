TimerStart(CreateTimer(), 0.0, false, function()
    DestroyTimer(GetExpiredTimer())

    -- body:
end)

do
    Debug = { }

    function Debug.onEsc()
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
    end

    function Debug.initialize()
        local trig = CreateTrigger()

        for i = 0, bj_MAX_PLAYERS - 1 do
            BlzTriggerRegisterPlayerKeyEvent(trig, Player(i), OSKEY_ESCAPE, 0, true)
        end

        TriggerAddAction(trig, Debug.onEsc)
    end

end
