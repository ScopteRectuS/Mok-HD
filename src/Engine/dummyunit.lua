DummyUnit = {
    id = UNIT_DUMMY_TYPE_ID,

    create = function( owner, x, y, z, face )
        if z == nil then
            return CreateUnit( owner, DummyUnit.id, x, y, face )

        else
            local u = CreateUnit( owner, DummyUnit.id, x, y, face )

            SetUnitFlyHeight( u, z, 0.0 )

            return u
        end
    end

}

