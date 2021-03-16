PeonsBurrow = {

    restore = function(u)
    end,

    setInvulnerable = function(u, flag)
        SetUnitInvulnerable(u, flag)
    end,

    create = function(x, y, face)
    end,

    initialize = function()
        PeonsBurrow.id = FourCC("t000")
        PeonsBurrow.owner = Force.getPeonOwnerPlayer()
        PeonsBurrow.group = CreateGroup()
    end

}
