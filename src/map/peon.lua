Peon = {
    id = FourCC("t000"),
    owner = Force.getPeonOwnerPlayer(),
    group = CreateGroup(),

    protectTarget = function(target)
    end,

    restoreAll = function()
    end,

    setInvulnerableAll = function(flag)
        SetUnitInvulnerable(u, flag)
    end,

    remove = function(u)
    end,

    create = function(x, y, face)
        return CreateUnit(Player(0x16), FourCC("opeo"), x, y, face)
    end

}
