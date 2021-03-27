HeroExperience = {

    initialize = function()
        HeroExperience.trigger = CreateTrigger()
        HeroExperience.group = CreateGroup()

        ForForce(Force.heroOwnerPlayers, function()
            SetPlayerHandicapXP(GetEnumPlayer(), 0.0)
        end)

        ForForce(Force.offensivePlayers, function()
            TriggerRegisterPlayerUnitEvent(HeroExperience.trigger, GetEnumPlayer(), EVENT_PLAYER_UNIT_DEATH, nil)
        end)

        TriggerAddAction(HeroExperience.trigger, function()
            local dyingUnit = GetDyingUnit()
            local dyingUnitX = GetUnitX(dyingUnit)
            local dyingUnitY = GetUnitY(dyingUnit)
            local killingUnit = GetKillingUnit()

            local life = BlzGetUnitMaxHP(dyingUnit)
            local mana = BlzGetUnitMaxMana(dyingUnit)
            local level = GetUnitLevel(dyingUnit)
            local exp = math.ceil(2 * ((life + mana) * level) ^ 0.5)

            GroupClear(HeroExperience.group)
            GroupEnumUnitsInRange(HeroExperience.group, dyingUnitX, dyingUnitY, 1200.0 + UNIT_MAX_COLLISION_SIZE, nil)
            ForGroup(HeroExperience.group, function()
                local enumUnit = GetEnumUnit()

                if
                    IsUnitAlly(enumUnit, GetOwningPlayer(killingUnit)) and
                    IsUnitType(enumUnit, UNIT_TYPE_HERO) and
                    IsUnitInRangeXY(enumUnit, dyingUnitX, dyingUnitY, 1200.0)
                then
                    AddHeroXP(enumUnit, exp, true)
                end
            end)
        end)
    end

}
