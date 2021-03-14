DummyUnit = {
    id = FourCC("h000"),

    ---@param owner player
    ---@param x real
    ---@param y real
    ---@param z real
    ---@param face real
    ---@return unit
    create = function(owner, x, y, z, face)
        if z == nil or z == 0.0 then
            return CreateUnit(owner, DummyUnit.id, x, y, face)

        else
            local u = CreateUnit(owner, DummyUnit.id, x, y, face)

            SetUnitFlyHeight(u, z, 0.0)

            return u
        end
    end

}
