Peon = {

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
    end,

    initialize = function()
        Peon.id = FourCC("peon")
        Peon.owner = Force.getPeonOwnerPlayer()
        Peon.group = CreateGroup()

        Debug.logMsg("Peon table successfully initialized.")
    end

}
