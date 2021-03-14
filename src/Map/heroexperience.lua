do
    HeroExperience = { }

    function HeroExperience.initialize()
        local trig  = CreateTrigger()
        local group = CreateGroup()

        for _, value in pairs(Team.defensiveForce) do
            SetPlayerHandicapXP(value, 0.0)
        end

        for _, value in pairs(Team.offensiveForce) do
            TriggerRegisterPlayerUnitEvent(trig, value, EVENT_PLAYER_UNIT_DEATH, nil)
        end

        TriggerAddAction(trig, function()
            local dyingUnit   = GetDyingUnit()
            local dyingUnitX  = GetUnitX(dyingUnit)
            local dyingUnitY  = GetUnitY(dyingUnit)
            local killingUnit = GetKillingUnit()

            GroupClear(group)
            GroupEnumUnitsInRange(group, dyingUnitX, dyingUnitY, 1200.0 + MAX_COLLISION_SIZE, nil)

            local life  = BlzGetUnitMaxHP(dyingUnit)
            local mana  = BlzGetUnitMaxMana(dyingUnit)
            local level = GetUnitLevel(dyingUnit)
            local exp   = R2I(2 * math.sqrt((life + mana) * level))

            for i = 1, BlzGroupGetSize(group) do
                local enumUnit = BlzGroupUnitAt(group, i - 1)

                if IsUnitAlly(enumUnit, GetOwningPlayer(killingUnit)) and IsUnitType(enumUnit, UNIT_TYPE_HERO) and IsUnitInRangeXY(enumUnit, dyingUnitX, dyingUnitY, 1200.0) then
                    AddHeroXP(enumUnit, exp, true)
                end
            end
        end)
    end

end