do

    WatchTower = {
        id = FourCC("t000"),
        owner = Player(22),
        group = CreateGroup(),

        create = function(x, y, face)
            local u = CreateUnit(WatchTower.owner, WatchTower.id, x, y, face)

            --SetUbersplatRenderAlways(CreateUbersplat(x, y, "OLAR", 0xFF, 0xFF, 0xFF, 0xFF, true, true), true)

            return u
        end,

        setInvulnerable = function(u, flag)
            SetUnitInvulnerable(u, flag)
            SetUnitVertexColor(u, 0xFF, 0xFF, 0xFF, IntegerTertiaryOp(flag, 0xA0, 0xFF))
        end

    }

end

-----------------------------------------------------------------------------
--  B U I L D I N G S :   T O W N                                          --
-----------------------------------------------------------------------------

function IsUnitTown(whichUnit)
    return GetUnitTypeId(whichUnit) == BUILDING_TOWN
end

function GetTown()
    return town
end

function CreateTown()
    town = CreateUnit(DEFENSIVE_PLAYER, BUILDING_TOWN, 4288.0, -4544.0, 270.0)
    CreateUnit(Player(PLAYER_NEUTRAL_PASSIVE), FourCC("n012"), GetUnitX(town), GetUnitY(town), GetUnitFacing(town))
end

function SetTownInvulnerable(flag)
    SetUnitInvulnerable(town, flag)
    SetUnitVertexColor(town, 0x96, 0x96, 0x96, IntegerTertiaryOp(flag, 0xA0, 0xFF))
end

-----------------------------------------------------------------------------
--  B U I L D I N G S :   T O W E R S                                      --
-----------------------------------------------------------------------------

function IsUnitTower(whichUnit)
    return
    GetUnitTypeId(whichUnit) == BUILDING_TOWER_T1 or
        GetUnitTypeId(whichUnit) == BUILDING_TOWER_T2
end

function CreateTowers()
    tower = {
        -- Tier 1:
        [0] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_TOWER_T1, 3648.0, -6848.0, 270.0),
        [1] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_TOWER_T1, 1856.0, -5312.0, 270.0),
        [2] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_TOWER_T1, 1600.0, -3136.0, 270.0),
        [3] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_TOWER_T1, 3392.0, -2112.0, 270.0),
        [4] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_TOWER_T1, 5440.0, -2624.0, 270.0),
        [5] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_TOWER_T1, 6208.0, -4288.0, 270.0),

        -- Tier 2:
        [6] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_TOWER_T2, 4928.0, -3904.0, 270.0),
        [7] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_TOWER_T2, 3776.0, -5312.0, 270.0),
        [8] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_TOWER_T2, 3648.0, -3904.0, 270.0)
    }

    for i = 0, #tower do
        UnitSetUsesAltIcon(tower[i], true)
        SetUbersplatRenderAlways(CreateUbersplat(GetUnitX(tower[i]), GetUnitY(tower[i]), "OLAR", 0xFF, 0xFF, 0xFF, 0xFF, true, true), true)
    end

    SetAltMinimapIcon("UI\\Minimap\\MiniMap-Tower.tga")
end

function SetTowersInvulnerable(flag)
    for i = 0, #tower do
        SetUnitInvulnerable(tower[i], flag)
        SetUnitVertexColor(tower[i], 0x96, 0x96, 0x96, IntegerTertiaryOp(flag, 0xA0, 0xFF))
    end
end

-----------------------------------------------------------------------------
--  B U I L D I N G S :   S E N T R Y   W A R D S                          --
-----------------------------------------------------------------------------

function IsUnitSentryWard(whichUnit)
    return GetUnitTypeId(whichUnit) == BUILDING_SENTRY_WARD
end

function CreateSentryWards()
    sentryWard = {
        [0] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_SENTRY_WARD, 2688.0, -8064.0, 270.0),
        [1] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_SENTRY_WARD, 768.0, -4352.0, 270.0),
        [2] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_SENTRY_WARD, 896.0, -1280.0, 270.0),
        [3] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_SENTRY_WARD, 2432.0, -1408.0, 270.0),
        [4] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_SENTRY_WARD, 5760.0, -1792.0, 270.0),
        [5] = CreateUnit(DEFENSIVE_PLAYER, BUILDING_SENTRY_WARD, 7552.0, -3584.0, 270.0)
    }

    for i = 0, #sentryWard do
        SetUbersplatRenderAlways(CreateUbersplat(GetUnitX(sentryWard[i]), GetUnitY(sentryWard[i]), "OSMA", 0xFF, 0xFF, 0xFF, 0xFF, true, true), true)
    end
end

-----------------------------------------------------------------------------
--  B U I L D I N G S                                                      --
-----------------------------------------------------------------------------

function IsUnitBuilding(whichUnit)
    return
    IsUnitTown(whichUnit) or
        IsUnitTower(whichUnit) or
        IsUnitPigFarm(whichUnit) or
        IsUnitSpawnCircle(whichUnit) or
        IsUnitSentryWard(whichUnit)
end

function RestoreBuilding(whichUnit)
    if IsUnitBuilding(whichUnit) then

        if UnitAlive(whichUnit) then
            SetUnitState(whichUnit, UNIT_STATE_LIFE, GetUnitState(whichUnit, UNIT_STATE_MAX_LIFE))
            SetUnitState(whichUnit, UNIT_STATE_MANA, GetUnitState(whichUnit, UNIT_STATE_MAX_MANA))

        else
            if reviverUnit ~= nil then
                SetUnitX(reviverUnit, GetUnitX(whichUnit))
                SetUnitY(reviverUnit, GetUnitY(whichUnit))
                IssueImmediateOrderById(reviverUnit, 852094)

            else
                reviverUnit = CreateUnit(NEUTRAL_PASSIVE_PLAYER, DUMMY_UNIT_ID, GetUnitX(whichUnit), GetUnitY(whichUnit), 0.0)
                UnitAddAbility(reviverUnit, FourCC("A00Q"))
                IssueImmediateOrderById(reviverUnit, 852094)
            end
        end

        UnitResetCooldown(whichUnit)
        DestroyEffect(AddSpecialEffect(
            "Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl",
            GetUnitX(whichUnit),
            GetUnitY(whichUnit)
        ))
    end
end

function RestoreAllBuildings()
    RestoreBuilding(town)

    for i = 0, #tower do
        RestoreBuilding(tower[i])
    end
end

function CreateAllBuildings()
    CreateTown()
    CreateTowers()
    CreatePigFarms()
    CreateSpawnCircles()
    CreatePowerupCircles()
    CreateSentryWards()
    CreateTaverns()

    SetBuildingsInvulnerable(true)
end

function SetBuildingsInvulnerable(flag)
    SetTownInvulnerable(flag)
    SetTowersInvulnerable(flag)
    SetPigFarmsInvulnerable(flag)
end
