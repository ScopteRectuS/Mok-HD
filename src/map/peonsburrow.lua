PeonsBurrow = {
    id = FourCC("t000"),
    owner = Player(0x16),
    group = CreateGroup(),

    restore = function(u)
    end,

    setInvulnerable = function(u, flag)
        SetUnitInvulnerable(u, flag)
    end,

    create = function(x, y, face)
    end

}
