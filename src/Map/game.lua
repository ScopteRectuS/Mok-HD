do
    Game = { }

    function Game.displayVictoryMsg( msg )
        local frame = BlzCreateFrameByType( 'TEXT', '', BlzGetOriginFrame( ORIGIN_FRAME_GAME_UI, 0 ), '', 0 )

        BlzFrameSetPoint( frame, FRAMEPOINT_TOP, BlzGetOriginFrame( ORIGIN_FRAME_GAME_UI, 0 ), FRAMEPOINT_TOP, 0.0, -0.0195 )
        BlzFrameSetText( frame, msg )
        BlzFrameSetScale( frame, 2.6 )
        BlzFrameSetVisible( frame, true )
    end

    function Game.startDefeat( )
        Game.displayVictoryMsg( "|cFFFF0303 O F F E N S I V E   F O R C E   V I C T O R Y ! |r" )
    end

    function Game.startVictory( )
        Game.displayVictoryMsg( "|cFF03FF03 D E F E N S I V E   F O R C E   V I C T O R Y ! |r" )
    end

    local function setStartingVisibility( )
    end

    local function setStartingResources( )
    end

    local function createStartingUnits( )
        for _, value in pairs( Team.computerForce ) do
            local id        = GetPlayerId( value )
            local startLocX = GetStartLocationX( id )
            local startLocY = GetStartLocationY( id )

            local unitSpacing = 64.00
            local peonX       = startLocX
            local peonY       = startLocY - 224.00

            --  Spawn Great Hall at the start location.
            CreateUnit( value, FourCC( 'o002' ), startLocX, startLocY, bj_UNIT_FACING )

            --  Spawn Peons directly south of the town hall.
            CreateUnit( value, FourCC( 'opeo' ), peonX + 2.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING )
            CreateUnit( value, FourCC( 'opeo' ), peonX + 1.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING )
            CreateUnit( value, FourCC( 'opeo' ), peonX + 0.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING )
            CreateUnit( value, FourCC( 'opeo' ), peonX - 1.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING )
            CreateUnit( value, FourCC( 'opeo' ), peonX - 2.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING )
        end
    end

    local function setStartingHeroLimit( )
    end

    function Game.initialize( )
        --  FogEnable( false )
        --  FogMaskEnable( false )
        EnableMinimapFilterButtons( true, false )

        setStartingVisibility( )
        setStartingResources( )
        createStartingUnits( )
        setStartingHeroLimit( )

        if DEBUG_MODE then
            print( 'DEBUG_MODE: The Game library has been initialized.')
        end
    end

end

do
    Ai = { }

    function Ai.start( forPlayer )
        StartMeleeAI( forPlayer, 'ai scripts\\anmok.lua' )
    end

    function Ai.initialize( )
        for _, value in pairs( Team.defensiveForce ) do
            if GetPlayerSlotState( value ) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController( value ) == MAP_CONTROL_COMPUTER then
                Ai.start( value )
            end
        end

        for _, value in pairs( Team.offensiveForce ) do
            if GetPlayerSlotState( value ) == PLAYER_SLOT_STATE_PLAYING and GetPlayerController( value ) == MAP_CONTROL_COMPUTER then
                Ai.start( value )
            end
        end
    end

end
