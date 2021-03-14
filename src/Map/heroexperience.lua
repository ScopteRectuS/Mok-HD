do
    HeroExperience = {

        onPlayerUnitDeath = function()
            local dyingUnit = GetDyingUnit()
            local dyingUnitX = GetUnitX(dyingUnit)
            local dyingUnitY = GetUnitY(dyingUnit)
            local killingUnit = GetKillingUnit()

            GroupClear(HeroExperience.group)
            GroupEnumUnitsInRange(HeroExperience.group, dyingUnitX, dyingUnitY, 1200.0 + UNIT_MAX_COLLISION_SIZE, nil)

            local life = BlzGetUnitMaxHP(dyingUnit)
            local mana = BlzGetUnitMaxMana(dyingUnit)
            local level = GetUnitLevel(dyingUnit)
            local exp = R2I(2 * math.sqrt((life + mana) * level))

            for i = 1, BlzGroupGetSize(HeroExperience.group) do
                local enumUnit = BlzGroupUnitAt(HeroExperience.group, i - 1)

                if IsUnitAlly(enumUnit, GetOwningPlayer(killingUnit)) and IsUnitType(enumUnit, UNIT_TYPE_HERO) and IsUnitInRangeXY(enumUnit, dyingUnitX, dyingUnitY, 1200.0) then
                    AddHeroXP(enumUnit, exp, true)
                end
            end
        end,

        initialize = function()
            HeroExperience.trigger = CreateTrigger()
            HeroExperience.group = CreateGroup()

            SetPlayerHandicapXP(Player(0x02), 0.0)
            SetPlayerHandicapXP(Player(0x03), 0.0)
            SetPlayerHandicapXP(Player(0x04), 0.0)
            SetPlayerHandicapXP(Player(0x05), 0.0)

            TriggerRegisterPlayerUnitEvent(HeroExperience.trigger, Player(0x00), EVENT_PLAYER_UNIT_DEATH, nil)
            TriggerAddAction(HeroExperience.trigger, HeroExperience.onPlayerUnitDeath)
        end

    }

end