PeonsBurrow = {
    id = FourCC("t000"),
    owner = Force.getPeonOwnerPlayer(),
    group = CreateGroup(),

    restore = function(u)
    end,

    setInvulnerable = function(u, flag)
        SetUnitInvulnerable(u, flag)
    end,

    create = function(x, y, face)
    end

}
