WatchTower = {

    setInvulnerable = function(u, flag)
        SetUnitInvulnerable(u, flag)
        SetUnitVertexColor(u, 0xFF, 0xFF, 0xFF, IntegerTertiaryOp(flag, 0xA0, 0xFF))
    end,

    setInvulnerableAll = function(flag)
        ForGroup(WatchTower.group, function()
            WatchTower.setInvulnerable(GetEnumUnit(), flag)
        end)
    end,

    restore = function(u)
        if not UnitAlive(u) then
            ReviveUnit(u)
        end

        SetUnitState(u, UNIT_STATE_LIFE, BlzGetUnitMaxHP(u))
        SetUnitState(u, UNIT_STATE_MANA, BlzGetUnitMaxMana(u))
        DestroyEffect(AddSpecialEffectTarget("", u,"origin"))
    end,

    restoreAll = function()
        ForGroup(WatchTower.group, function()
            WatchTower.restore(GetEnumUnit())
        end)
    end,

    create = function(x, y)
        local unit = CreateUnit(WatchTower.owner, WatchTower.id, x, y, bj_UNIT_FACING)
        GroupAddUnit(WatchTower.group, unit)
        CreateMinimapIconOnUnit(unit, 0xFF, 0xFF, 0xFF, "UI\\MiniMap\\minimap-neutralbuilding.mdx", FOG_OF_WAR_VISIBLE)

        local splat = CreateUbersplat(x, y, "OLAR", 0xFF, 0xFF, 0xFF, 0xFF, true, true)
        SetUbersplatRenderAlways(splat, true)

        return unit
    end,

    createAll = function()
        WatchTower.create(0.0, 0.0)
    end,

    initialize = function()
        WatchTower.id = FourCC("t000")
        WatchTower.owner = Force.getPeonOwnerPlayer()
        WatchTower.group = CreateGroup()

        WatchTower.createAll()

        Debug.logMsg("WatchTower table successfully initialized.")
    end

}
