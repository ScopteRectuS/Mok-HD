SentryWard = {

    create = function(x, y, face)
        return CreateUnit(SentryWard.owner, SentryWard.id, x, y, face)
    end,

    initialize = function()
        SentryWard.id = FourCC("t000")
        SentryWard.owner = Force.getPeonOwnerPlayer()
        SentryWard.group = CreateGroup()
    end

}
