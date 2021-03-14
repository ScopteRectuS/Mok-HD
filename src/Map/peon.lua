Peon = {

    protectTarget = function(target)
    end,

    restore = function(u)
    end,

    setInvulnerable = function(u, flag)
        SetUnitInvulnerable(u, flag)
    end,

    remove = function(u)
    end,

    create = function(x, y, face)
        return CreateUnit(Player(0x16), FourCC("opeo"), x, y, face)
    end

}
