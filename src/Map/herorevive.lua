do
    HeroRevive = { }

    function HeroRevive.initialize()
        local trig = CreateTrigger()

        for _, value in pairs(Team.defensiveForce) do
            TriggerRegisterPlayerUnitEvent(trig, value, EVENT_PLAYER_UNIT_DEATH, nil)
        end

        TriggerAddAction(trig, function()
            local dyingUnit = GetDyingUnit()

            if IsUnitType(dyingUnit, UNIT_TYPE_HERO) then
                local dyingUnitX = GetUnitX(dyingUnit)
                local dyingUnitY = GetUnitY(dyingUnit)
                local grave      = CreateUnit(GetOwningPlayer(dyingUnit), FourCC('h003'), dyingUnitX, dyingUnitY, 0.0)
                local timer      = CreateTimer()
                local graveLife  = 1.0

                SetWidgetLife(grave, 1.0)
                SetUnitPathing(grave, false)
                BlzSetUnitName(grave, GetHeroProperName(dyingUnit))

                if IsUnitSelected(dyingUnit, GetLocalPlayer()) then
                    SelectUnit(dyingUnit, false)
                    SelectUnit(grave, true)
                end

                TimerStart(timer, 0.1, true, function()
                    local curLife = GetWidgetLife(grave)

                    if curLife < 100.0 then
                        if curLife > graveLife then
                            graveLife = curLife
                        elseif curLife <= graveLife then
                            graveLife = 1.0
                            SetWidgetLife(grave, 1.0)
                        end

                    else
                        ReviveHero(dyingUnit, dyingUnitX, dyingUnitY, true)
                        SetUnitState(dyingUnit, UNIT_STATE_LIFE, BlzGetUnitMaxHP(dyingUnit))
                        SetUnitState(dyingUnit, UNIT_STATE_MANA, BlzGetUnitMaxMana(dyingUnit))

                        if IsUnitSelected(grave, GetLocalPlayer()) then
                            SelectUnit(grave, false)
                            SelectUnit(dyingUnit, true)
                        end

                        RemoveUnit(grave)
                        PauseTimer(timer)
                        DestroyTimer(timer)
                    end
                end)
            end
        end)
    end

end
