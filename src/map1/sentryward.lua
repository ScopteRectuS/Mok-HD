SentryWard = {
    id = FourCC("t000"),
    owner = Player(0x16),
    group = CreateGroup(),

    create = function(x, y, face)
        return CreateUnit(SentryWard.owner, SentryWard.id, x, y, face)
    end

}
