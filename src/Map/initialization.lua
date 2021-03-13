InitGlobals = function( )

end




Map = {

    initializeTeams = function( )
        SetPlayerAllianceStateAllyBJ( Player( 0x02 ), Player( 0x03 ), true )
        SetPlayerAllianceStateAllyBJ( Player( 0x02 ), Player( 0x04 ), true )
        SetPlayerAllianceStateAllyBJ( Player( 0x02 ), Player( 0x05 ), true )
        SetPlayerAllianceStateAllyBJ( Player( 0x02 ), Player( 0x16 ), true )

        SetPlayerAllianceStateAllyBJ( Player( 0x03 ), Player( 0x02 ), true )
        SetPlayerAllianceStateAllyBJ( Player( 0x03 ), Player( 0x04 ), true )
        SetPlayerAllianceStateAllyBJ( Player( 0x03 ), Player( 0x05 ), true )
        SetPlayerAllianceStateAllyBJ( Player( 0x03 ), Player( 0x16 ), true )

        SetPlayerAllianceStateAllyBJ( Player( 0x04 ), Player( 0x02 ), true )
        SetPlayerAllianceStateAllyBJ( Player( 0x04 ), Player( 0x03 ), true )
        SetPlayerAllianceStateAllyBJ( Player( 0x04 ), Player( 0x05 ), true )
        SetPlayerAllianceStateAllyBJ( Player( 0x04 ), Player( 0x16 ), true )

        SetPlayerAllianceStateAllyBJ( Player( 0x05 ), Player( 0x02 ), true )
        SetPlayerAllianceStateAllyBJ( Player( 0x05 ), Player( 0x03 ), true )
        SetPlayerAllianceStateAllyBJ( Player( 0x05 ), Player( 0x04 ), true )
        SetPlayerAllianceStateAllyBJ( Player( 0x05 ), Player( 0x16 ), true )

        SetPlayerAllianceStateVisionBJ( Player( 0x02 ), Player( 0x03 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x02 ), Player( 0x04 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x02 ), Player( 0x05 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x02 ), Player( 0x16 ), true )

        SetPlayerAllianceStateVisionBJ( Player( 0x03 ), Player( 0x02 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x03 ), Player( 0x04 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x03 ), Player( 0x05 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x03 ), Player( 0x16 ), true )

        SetPlayerAllianceStateVisionBJ( Player( 0x04 ), Player( 0x02 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x04 ), Player( 0x03 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x04 ), Player( 0x05 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x04 ), Player( 0x16 ), true )

        SetPlayerAllianceStateVisionBJ( Player( 0x05 ), Player( 0x02 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x05 ), Player( 0x03 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x05 ), Player( 0x04 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x05 ), Player( 0x16 ), true )

        SetPlayerAllianceStateVisionBJ( Player( 0x16 ), Player( 0x02 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x16 ), Player( 0x03 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x16 ), Player( 0x04 ), true )
        SetPlayerAllianceStateVisionBJ( Player( 0x16 ), Player( 0x05 ), true )
    end

}

