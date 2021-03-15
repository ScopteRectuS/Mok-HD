SentryWard = {
    id = FourCC("t000"),
    owner = Force.getPeonOwnerPlayer(),
    group = CreateGroup(),

    create = function(x, y, face)
        return CreateUnit(SentryWard.owner, SentryWard.id, x, y, face)
    end

}
