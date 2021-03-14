-----------------------------------------------------------------------------
--
-- S C O R E B O A R D :
--
--   Warcraft III lua script
--   Date: 2020-01-30
--   Script Author: ScopteRectuS
--
-----------------------------------------------------------------------------

do
    Scoreboard = { }

    local board             = nil
    local unitsProduced     = { }
    local unitsKilled       = { }
    local unitsLost         = { }
    local buildingsProduced = { }
    local buildingsRazed    = { }
    local buildingsLost     = { }
    local damageDealt       = { }
    local damageReceived    = { }
    local goldMined         = { }
    local lumberHarvested   = { }
    local techPercentage    = { }
    local column            = { }
    local lostToUpkeep      = { }

    function Scoreboard.show( flag )
        MultiboardDisplay( board, flag )
        MultiboardMinimize( board, not flag )
    end

    function Scoreboard.setItem( row, column, iconfilename, val, width, red, green, blue, alpha )
        local mbi = MultiboardGetItem( board, row, column )

        MultiboardSetItemStyle( mbi, val ~= "", iconfilename ~= "" )
        MultiboardSetItemIcon( mbi, iconfilename )
        MultiboardSetItemValue( mbi, val )
        MultiboardSetItemWidth( mbi, width )
        MultiboardSetItemValueColor( mbi, red, green, blue, alpha )
        MultiboardReleaseItem( mbi )
    end

    function Scoreboard.addPlayerColumn( p )
        column[p] = MultiboardGetColumnCount( board )
        MultiboardSetColumnCount( board, column[p] + 1 )
    end

    function Scoreboard.updatePlayerInfo( p )
        local pIcon = ""
        local pName = ""
        local hIcon = ""
        local hName = ""

        --  if Player.isHero( p ) then
        pIcon = "ReplaceableTextures\\CommandButtons\\BTNHoldPosition.tga"
        pName = GetPlayerName( p )

        if hero[p]~= nil then
            hIcon = "UI\\Widgets\\Console\\Human\\CommandButton\\human-multipleselection-heroglow123.blp"
            hName = GetUnitName( p )
        else
            hIcon = "UI\\Widgets\\Console\\Human\\CommandButton\\human-multipleselection-heroglow.blp"
            hName = "no hero"
        end

        --[[  elseif Player.isBuilder( p ) then
                  pIcon = "ReplaceableTextures\\CommandButtons\\BTNBasicStruct.blp"
                  pName = GetPlayerName( p )

                  hIcon = "ReplaceableTextures\\CommandButtons\\BTNPeon.tga"
                  hName = "Builder"
              end ]]

        Scoreboard.setItem( 0, column[p], pIcon,      pName,                                    0.103125, 0xFF, 0xCC, 0x00, 0xFF )
        Scoreboard.setItem( 1, column[p], hIcon,      hName,                                    0.103125, 0x80, 0x80, 0x80, 0xFF )
    end

    function Scoreboard.updatePlayerUnits( p )
        Scoreboard.setItem( 2, column[p], "",         "",                                       0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 3, column[p], "",         tostring( unitsProduced[p]    ),         0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 4, column[p], "",         tostring( unitsKilled[p]      ),         0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 5, column[p], "",         tostring( unitsLost[p]        ),         0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 6, column[p], "",         "",                                       0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
    end

    function Scoreboard.updatePlayerBuildings( p )
        Scoreboard.setItem( 7, column[p], "",         "",                                       0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 8, column[p], "",         tostring( buildingsProduced[p] ),         0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 9, column[p], "",         tostring( buildingsRazed[p]   ),         0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 10, column[p], "",         tostring( buildingsLost[p]    ),         0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 11, column[p], "",         "",                                       0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
    end

    function Scoreboard.updatePlayerCombat( p )
        Scoreboard.setItem( 12, column[p], "",         "",                                       0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 13, column[p], "",         tostring( damageDealt[p] ),               0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 14, column[p], "",         tostring( damageReceived[p] ),            0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 15, column[p], "",         "",                                       0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
    end

    function Scoreboard.updatePlayerResources( p )
        Scoreboard.setItem( 16, column[p], "",         "",                                       0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 17, column[p], "",         tostring( goldMined[p]        ),         0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 18, column[p], "",         tostring( lumberHarvested[p]  ),         0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 19, column[p], "",         tostring( techPercentage[p]   ),         0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 20, column[p], "",         tostring( lostToUpkeep[p]     ),         0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
        Scoreboard.setItem( 21, column[p], "",         "",                                       0.103125, 0xFF, 0xFF, 0xFF, 0xFF )
    end

    function Scoreboard.initialize( )
        TimerStart( CreateTimer( ), 0.0, false, function( )
            DestroyTimer( GetExpiredTimer( ) )

            local unitsIcon     = "ReplaceableTextures\\CommandButtons\\BTNGrunt.tga"
            local buildingsIcon = "ReplaceableTextures\\CommandButtons\\BTNOrcTower.tga"
            local combatIcon    = "ReplaceableTextures\\CommandButtons\\BTNAttack.tga"
            local resourcesIcon = "ReplaceableTextures\\CommandButtons\\BTNPillage.tga"

            board = CreateMultiboard( )
            MultiboardSetTitleText     ( board, "Статистика:" )
            MultiboardSetTitleTextColor( board, 0xFF, 0xFF, 0xFF, 0xFF )
            MultiboardSetRowCount      ( board, 24 )
            MultiboardSetColumnCount   ( board, 1 )
            MultiboardDisplay          ( board, true )
            MultiboardMinimize         ( board, false )
            MultiboardMinimize         ( board, true )

            Scoreboard.setItem(  0, 0, "",            "",                                      0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem(  1, 0, "",            "",                                      0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem(  2, 0, unitsIcon,     "В О Й С К А :",                         0.175, 0xFF, 0xCC, 0x00, 0xFF )
            Scoreboard.setItem(  3, 0, "",            "     Units Produced",                   0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem(  4, 0, "",            "     Units Killed",                     0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem(  5, 0, "",            "     Units Lost",                       0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem(  6, 0, "",            "",                                      0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem(  7, 0, buildingsIcon, "З Д А Н И Я :",                         0.175, 0xFF, 0xCC, 0x00, 0xFF )
            Scoreboard.setItem(  8, 0, "",            "     Buildings Produced",               0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem(  9, 0, "",            "     Buildings Razed",                  0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem( 10, 0, "",            "     Buildings Lost",                   0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem( 11, 0, "",            "",                                      0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem( 12, 0, combatIcon,    "Б О Й :",                               0.175, 0xFF, 0xCC, 0x00, 0xFF )
            Scoreboard.setItem( 13, 0, "",            "     Нанесено урона",                   0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem( 14, 0, "",            "     Получено урона",                   0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem( 15, 0, "",            "     Восстановлено здоровья",           0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem( 16, 0, "",            "     Восстановлено маны",               0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem( 17, 0, "",            "",                                      0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem( 18, 0, resourcesIcon, "Р Е С У Р С Ы :",                       0.175, 0xFF, 0xCC, 0x00, 0xFF )
            Scoreboard.setItem( 19, 0, "",            "     Добыто золота",                    0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem( 20, 0, "",            "     Добыто древесины",                 0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem( 21, 0, "",            "     Прогресс технологий",              0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem( 22, 0, "",            "     Потрачено на расходы",             0.175, 0xFF, 0xFF, 0xFF, 0xFF )
            Scoreboard.setItem( 23, 0, "",            "",                                      0.175, 0xFF, 0xFF, 0xFF, 0xFF )

            for _, val in pairs( Team.defensiveForce ) do
                unitsProduced    [ val ] = 0
                unitsKilled      [ val ] = 0
                unitsLost        [ val ] = 0
                buildingsProduced[ val ] = 0
                buildingsRazed   [ val ] = 0
                buildingsLost    [ val ] = 0
                damageDealt      [ val ] = 0
                damageReceived   [ val ] = 0
                goldMined        [ val ] = 0
                lumberHarvested  [ val ] = 0
                techPercentage   [ val ] = 0
                column           [ val ] = 0
                lostToUpkeep     [ val ] = 0

                Scoreboard.addPlayerColumn( val )
                Scoreboard.updatePlayerInfo( val )
                Scoreboard.updatePlayerUnits( val )
                Scoreboard.updatePlayerBuildings( val )
                Scoreboard.updatePlayerCombat( val )
                Scoreboard.updatePlayerResources( val )
            end
        end )
    end

end
