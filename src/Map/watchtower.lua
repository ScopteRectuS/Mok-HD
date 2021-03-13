do

    WatchTower = {
        id = FourCC( "t000" ),
        owner = Player( 22 ),
        group = CreateGroup( ),

        create = function( x, y, face )
            local u = CreateUnit( WatchTower.owner, WatchTower.id, x, y, face )

            --SetUbersplatRenderAlways( CreateUbersplat( x, y, "OLAR", 0xFF, 0xFF, 0xFF, 0xFF, true, true ), true )

            return u
        end,

        setInvulnerable = function( u, flag )
            SetUnitInvulnerable( u, flag )
            SetUnitVertexColor( u, 0xFF, 0xFF, 0xFF, IntegerTertiaryOp( flag, 0xA0, 0xFF ) )
        end

    }

end

