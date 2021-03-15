WatchTower = {
    id = FourCC("t000"),
    owner = Force.getPeonOwnerPlayer(),
    group = CreateGroup(),

    setInvulnerable = function(u, flag)
        SetUnitInvulnerable(u, flag)
        SetUnitVertexColor(u, 0xFF, 0xFF, 0xFF, IntegerTertiaryOp(flag, 0xA0, 0xFF))
    end,

    restore = function(u)
        if not UnitAlive(u) then
            ReviveUnit(u)
        end

        SetUnitState(u, UNIT_STATE_LIFE, BlzGetUnitMaxHP(u))
        SetUnitState(u, UNIT_STATE_MANA, BlzGetUnitMaxMana(u))
        DestroyEffect(AddSpecialEffectTarget("", u,"origin"))
    end,

    createUbersplat = function(x, y)
        SetUbersplatRenderAlways(CreateUbersplat(x, y, "OLAR", 0xFF, 0xFF, 0xFF, 0xFF, true, true), true)
    end,

    create = function(x, y, face)
        --UnitSetUsesAltIcon(tower[i], true)
        --SetAltMinimapIcon("UI\\Minimap\\MiniMap-Tower.tga")

        return CreateUnit(WatchTower.owner, WatchTower.id, x, y, face)
    end

}
