STRING_CHOOSE_YOUR_HERO        = "Выберите героя"
STRING_HERO_DESCRIPTION        = "Описание героя"

TimerStart( CreateTimer( ), 0.0, false, function( )
    BlzLoadTOCFile( "UI\\FrameDef\\UI\\FrameDef.toc" )

    local game_ui             = BlzGetOriginFrame( ORIGIN_FRAME_GAME_UI, 0 )

    local hero_pick_dialog    = BlzCreateFrame( "HeroPickDialog", game_ui, 0, 0 )

    local heroPickTitleValue           = BlzGetFrameByName( "HeroPickTitleValue", 0 )
    local heroPickSubtitleValue        = BlzGetFrameByName( "HeroPickSubtitleValue", 0 )

    BlzFrameSetText( heroPickTitleValue, "Mok: Hero Defense" )
    BlzFrameSetText( heroPickSubtitleValue, "Выберите героя" )

    local heroListTitleValue           = BlzGetFrameByName( "HeroListTitleValue", 0 )
    local heroDescriptionTitleValue    = BlzGetFrameByName( "HeroDescriptionTitleValue", 0 )
    local abilityListTitleValue        = BlzGetFrameByName( "AbilityListTitleValue", 0 )
    local abilityDescriptionTitleValue = BlzGetFrameByName( "AbilityDescriptionTitleValue", 0 )

    BlzFrameSetText( heroListTitleValue, "Список героев" )
    BlzFrameSetText( heroDescriptionTitleValue, "Описание героя" )
    BlzFrameSetText( abilityListTitleValue, "Список способностей" )
    BlzFrameSetText( abilityDescriptionTitleValue, "Описание способности" )

    local hero_list_container = BlzGetFrameByName( "HeroListContainer", 0 )
    local hero_description    = BlzGetFrameByName( "HeroDescriptionArea", 0 )
    local abil_list_container = BlzGetFrameByName( "AbilityListContainer", 0 )
    local abil_description    = BlzGetFrameByName( "AbilityDescriptionArea", 0 )
    local button              = BlzGetFrameByName( "HeroPickOkButton", 0 )

    local hero_list_item_1    = BlzCreateFrame( "HeroListItem", hero_list_container, 0, 0 )

    BlzFrameSetTexture( BlzGetFrameByName( "HeroListItemIcon", 0 ), "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp", 0, true )
    BlzFrameSetText( BlzGetFrameByName( "HeroListItemTitle", 0 ), "Мастер клинка" )

    local hero_list_item_2    = BlzCreateFrame( "HeroListItem", hero_list_container, 0, 0 )

    BlzFrameSetTexture( BlzGetFrameByName( "HeroListItemIcon", 0 ), "ReplaceableTextures\\CommandButtons\\BTNShadowHunter.blp", 0, true )
    BlzFrameSetText( BlzGetFrameByName( "HeroListItemTitle", 0 ), "Темный охотник" )

    local hero_list_item_3    = BlzCreateFrame( "HeroListItem", hero_list_container, 0, 0 )

    BlzFrameSetTexture( BlzGetFrameByName( "HeroListItemIcon", 0 ), "ReplaceableTextures\\CommandButtons\\BTNThrall.blp", 0, true )
    BlzFrameSetText( BlzGetFrameByName( "HeroListItemTitle", 0 ), "Предсказатель" )

    BlzFrameSetPoint( hero_pick_dialog, FRAMEPOINT_CENTER, game_ui, FRAMEPOINT_CENTER, 0.0, 0.0 )
    BlzFrameSetPoint( hero_list_item_1, FRAMEPOINT_TOPLEFT, hero_list_container, FRAMEPOINT_TOPLEFT, 0.0, 0.0 )
    BlzFrameSetPoint( hero_list_item_2, FRAMEPOINT_TOPLEFT, hero_list_item_1, FRAMEPOINT_BOTTOMLEFT, 0.0, -0.0025 )
    BlzFrameSetPoint( hero_list_item_3, FRAMEPOINT_TOPLEFT, hero_list_item_2, FRAMEPOINT_BOTTOMLEFT, 0.0, -0.0025 )

    BlzFrameAddText( hero_description, "|cFF808080Базовый урон:|r 14-36" )
    BlzFrameAddText( hero_description, "|cFF808080БВА:|r 1.77" )
    BlzFrameAddText( hero_description, "|cFF808080Дальность атаки:|r 100 (melee)" )
    BlzFrameAddText( hero_description, "|cFF808080 - base hit points:|r 250" )
    BlzFrameAddText( hero_description, "|cFF808080 - base mana points:|r 250" )
    BlzFrameAddText( hero_description, "|cFF808080 - movement speed:|r 300" )
    BlzFrameAddText( hero_description, "|cFF808080 - strength:|r 36 ( +4.00 )" )
    BlzFrameAddText( hero_description, "|cFF808080 - agility ( primary attribute ):|r 46 ( +3.50 )" )
    BlzFrameAddText( hero_description, "|cFF808080 - inteligence:|r 32 ( +4.50 )" )
    BlzFrameAddText( hero_description, " " )
    BlzFrameAddText( hero_description, "Samuro once lived in a village with his brethren. Unfortunately for him, a bloodthirsty Wildkin known as Bloodbeak destroyed his village. With vengeance in mind, Samuro hunted Bloodbeak until he finally met with success. Bloodbeak was slain, and Samuro could pay attention to his newly assigned task of sabotaging a Kul Tiras base camp near the coast. Samuro was successful in this as well by using stealth to place demolition charges near vital structures of the Kul Tiras base ( likely Tiragarde Keep in World of Warcraft ). With his mission accomplished, Rexxar, Rokhan, and Chen Stormstout could continue with a mission of their own, and Samuro was free to continue as he wished." )
    BlzFrameAddText( hero_description, " " )
    BlzFrameAddText( hero_description, "|cFFFFCC00Attacks land units.|r" )

    BlzFrameAddText( abil_description, "|cFF808080Тип урона:|r |cFFFF2020Физический|r" )
    BlzFrameAddText( abil_description, "|cFF808080Урона в секунду:|r DMG" )
    BlzFrameAddText( abil_description, "|cFF808080Длительность:|r 4 + LVL" )
    BlzFrameAddText( abil_description, "|cFF808080Радиус действия:|r 320" )
    BlzFrameAddText( abil_description, "|cFF808080Перезарядка:|r 33 - 3 * LVL" )
    BlzFrameAddText( abil_description, " " )
    BlzFrameAddText( abil_description, "Causes a bladestorm of destructive force around the Blademaster, rendering him immune to magic and dealing damage to nearby enemy land units." )

    local trig = CreateTrigger( )
    BlzTriggerRegisterFrameEvent( trig, button, FRAMEEVENT_CONTROL_CLICK )
    TriggerAddAction( trig, function( )
        BlzDestroyFrame( hero_pick_dialog )
    end )
end )


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


-----------------------------------------------------------------------------
--  B U I L D I N G S                                                      --
-----------------------------------------------------------------------------

BUILDING_TOWN                                                       = FourCC( "o006" )
BUILDING_TOWER_T1                                                   = FourCC( "o003" )
BUILDING_TOWER_T2                                                   = FourCC( "o000" )
BUILDING_PIG_FARM                                                   = FourCC( "n008" )
BUILDING_SPAWN_CIRCLE                                               = FourCC( "n005" )
BUILDING_SENTRY_WARD                                                = FourCC( "oeye" )
BUILDING_GRAVE                                                      = FourCC( "h003" )
BUILDING_PIG_FARM                                                   = FourCC( "n008" )
BUILDING_TAVERN = {
    [0]                                                             = FourCC( "n000" ),
    [1]                                                             = FourCC( "n001" ),
    [2]                                                             = FourCC( "n002" ),
    [3]                                                             = FourCC( "n00A" ),
    [4]                                                             = FourCC( "n00B" ),
    [5]                                                             = FourCC( "n00C" ),
    [6]                                                             = FourCC( "n00K" ),
    [7]                                                             = FourCC( "n00K" ),
    [8]                                                             = FourCC( "n00K" )
}

-----------------------------------------------------------------------------
--  B U I L D I N G S :   T O W N                                          --
-----------------------------------------------------------------------------

function IsUnitTown( whichUnit )
    return GetUnitTypeId( whichUnit ) == BUILDING_TOWN
end

function GetTown( )
    return town
end

function CreateTown( )
    town = CreateUnit( DEFENSIVE_PLAYER, BUILDING_TOWN, 4288.0, - 4544.0, 270.0 )
    CreateUnit( Player( PLAYER_NEUTRAL_PASSIVE ), FourCC( "n012" ), GetUnitX( town ), GetUnitY( town ), GetUnitFacing( town ) )
end

function SetTownInvulnerable( flag )
    SetUnitInvulnerable( town, flag )
    SetUnitVertexColor( town, 0x96, 0x96, 0x96, IntegerTertiaryOp( flag, 0xA0, 0xFF ) )
end

-----------------------------------------------------------------------------
--  B U I L D I N G S :   T O W E R S                                      --
-----------------------------------------------------------------------------

function IsUnitTower( whichUnit )
    return
    GetUnitTypeId( whichUnit ) == BUILDING_TOWER_T1 or
            GetUnitTypeId( whichUnit ) == BUILDING_TOWER_T2
end

function CreateTowers( )
    tower = {
        -- Tier 1:
        [0] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_TOWER_T1, 3648.0, - 6848.0, 270.0 ),
        [1] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_TOWER_T1, 1856.0, - 5312.0, 270.0 ),
        [2] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_TOWER_T1, 1600.0, - 3136.0, 270.0 ),
        [3] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_TOWER_T1, 3392.0, - 2112.0, 270.0 ),
        [4] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_TOWER_T1, 5440.0, - 2624.0, 270.0 ),
        [5] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_TOWER_T1, 6208.0, - 4288.0, 270.0 ),

        -- Tier 2:
        [6] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_TOWER_T2, 4928.0, - 3904.0, 270.0 ),
        [7] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_TOWER_T2, 3776.0, - 5312.0, 270.0 ),
        [8] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_TOWER_T2, 3648.0, - 3904.0, 270.0 )
    }

    for i = 0, #tower do
        UnitSetUsesAltIcon( tower[i], true )
        SetUbersplatRenderAlways( CreateUbersplat( GetUnitX( tower[i] ), GetUnitY( tower[i] ), "OLAR", 0xFF, 0xFF, 0xFF, 0xFF, true, true ), true )
    end

    SetAltMinimapIcon( "UI\\Minimap\\MiniMap-Tower.tga" )
end

function SetTowersInvulnerable( flag )
    for i = 0, #tower do
        SetUnitInvulnerable( tower[i], flag )
        SetUnitVertexColor( tower[i], 0x96, 0x96, 0x96, IntegerTertiaryOp( flag, 0xA0, 0xFF ) )
    end
end

-----------------------------------------------------------------------------
--  B U I L D I N G S :   P I G   F A R M S                                --
-----------------------------------------------------------------------------

function IsUnitPigFarm( whichUnit )
    return GetUnitTypeId( whichUnit ) == BUILDING_PIG_FARM
end

function CreatePigFarms( )
    pigFarm = {
        [0] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_PIG_FARM, 4288.0, - 3776.0, 270.0 ),
        [1] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_PIG_FARM, 3584.0, - 4608.0, 270.0 ),
        [2] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_PIG_FARM, 5312.0, - 5568.0, 270.0 ),
        [3] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_PIG_FARM, 3072.0, - 7168.0, 270.0 ),
        [4] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_PIG_FARM, 1408.0, - 5632.0, 270.0 ),
        [5] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_PIG_FARM, 5760.0, - 2176.0, 270.0 ),
        [6] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_PIG_FARM, 6656.0, - 3968.0, 270.0 ),
        [7] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_PIG_FARM, 3584.0, - 1536.0, 270.0 ),
        [8] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_PIG_FARM, 1152.0, - 2944.0, 270.0 )
    }

    for i = 0, #pigFarm do
        SetUbersplatRenderAlways( CreateUbersplat( GetUnitX( pigFarm[i] ), GetUnitY( pigFarm[i] ), "OLAR", 0xFF, 0xFF, 0xFF, 0xFF, true, true ), true )
        SetUnitVertexColor( pigFarm[i], 0x96, 0x96, 0x96, IntegerTertiaryOp( flag, 0xA0, 0xFF ) )
    end
end

function SetPigFarmsInvulnerable( flag )
    for i = 0, #pigFarm do
        SetUnitInvulnerable( pigFarm[i], true )
        SetUnitVertexColor( pigFarm[i], 0x96, 0x96, 0x96, IntegerTertiaryOp( flag, 0xA0, 0xFF ) )
    end
end

-----------------------------------------------------------------------------
--  B U I L D I N G S :   S P A W N   C I R C L E S                        --
-----------------------------------------------------------------------------

function IsUnitSpawnCircle( whichUnit )
    return GetUnitTypeId( whichUnit ) == BUILDING_SPAWN_CIRCLE
end

function CreateSpawnCircles( )
    spawnCircle = {
        [0] = CreateUnit( OFFENSIVE_PLAYER, BUILDING_SPAWN_CIRCLE,    1280.0, - 7552.0, 270.0 ),
        [1] = CreateUnit( OFFENSIVE_PLAYER, BUILDING_SPAWN_CIRCLE,  -  896.0, - 4736.0, 270.0 ),
        [2] = CreateUnit( OFFENSIVE_PLAYER, BUILDING_SPAWN_CIRCLE,  -  640.0, - 1408.0, 270.0 ),
        [3] = CreateUnit( OFFENSIVE_PLAYER, BUILDING_SPAWN_CIRCLE,    2560.0,    256.0, 270.0 ),
        [4] = CreateUnit( OFFENSIVE_PLAYER, BUILDING_SPAWN_CIRCLE,    5504.0, -  256.0, 270.0 ),
        [5] = CreateUnit( OFFENSIVE_PLAYER, BUILDING_SPAWN_CIRCLE,    7296.0, - 2176.0, 270.0 )
    }

    for i = 1, #spawnCircle do
        SetUbersplatRenderAlways( CreateUbersplat( GetUnitX( spawnCircle[i] ), GetUnitY( spawnCircle[i] ), "OLAR", 0xFF, 0xFF, 0xFF, 0xFF, true, true ), true )
    end
end

-----------------------------------------------------------------------------
--  B U I L D I N G S :   S E N T R Y   W A R D S                          --
-----------------------------------------------------------------------------

function IsUnitSentryWard( whichUnit )
    return GetUnitTypeId( whichUnit ) == BUILDING_SENTRY_WARD
end

function CreateSentryWards( )
    sentryWard = {
        [0] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_SENTRY_WARD, 2688.0, - 8064.0, 270.0 ),
        [1] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_SENTRY_WARD,  768.0, - 4352.0, 270.0 ),
        [2] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_SENTRY_WARD,  896.0, - 1280.0, 270.0 ),
        [3] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_SENTRY_WARD, 2432.0, - 1408.0, 270.0 ),
        [4] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_SENTRY_WARD, 5760.0, - 1792.0, 270.0 ),
        [5] = CreateUnit( DEFENSIVE_PLAYER, BUILDING_SENTRY_WARD, 7552.0, - 3584.0, 270.0 )
    }

    for i = 0, #sentryWard do
        SetUbersplatRenderAlways( CreateUbersplat( GetUnitX( sentryWard[i] ), GetUnitY( sentryWard[i] ), "OSMA", 0xFF, 0xFF, 0xFF, 0xFF, true, true ), true )
    end
end

-----------------------------------------------------------------------------
--  B U I L D I N G S :   T A V E R N S                                    --
-----------------------------------------------------------------------------

function IsUnitTavern( whichUnit )
    local isTavern = false

    for i = 0, #BUILDING_TAVERN do
        if GetUnitTypeId( whichUnit ) == BUILDING_TAVERN[i] then
            isTavern = true

            break
        end
    end

    return isTavern
end

function CreateTaverns( )
    tavern = {
        [0] = CreateUnit( NEUTRAL_PASSIVE_PLAYER, BUILDING_TAVERN[0], 7680.0, - 8192.0, 270.0 ),
        [1] = CreateUnit( NEUTRAL_PASSIVE_PLAYER, BUILDING_TAVERN[1], 7936.0, - 8192.0, 270.0 ),
        [2] = CreateUnit( NEUTRAL_PASSIVE_PLAYER, BUILDING_TAVERN[2], 7680.0, - 8448.0, 270.0 ),
        [3] = CreateUnit( NEUTRAL_PASSIVE_PLAYER, BUILDING_TAVERN[3], 7936.0, - 8448.0, 270.0 ),
        [4] = CreateUnit( NEUTRAL_PASSIVE_PLAYER, BUILDING_TAVERN[4], 7936.0, - 7936.0, 270.0 ),
        [5] = CreateUnit( NEUTRAL_PASSIVE_PLAYER, BUILDING_TAVERN[5], 7424.0, - 8448.0, 270.0 ),
        [6] = CreateUnit( NEUTRAL_PASSIVE_PLAYER, BUILDING_TAVERN[6], 7424.0, - 8192.0, 270.0 ),
        [7] = CreateUnit( NEUTRAL_PASSIVE_PLAYER, BUILDING_TAVERN[7], 7424.0, - 7936.0, 270.0 ),
        [8] = CreateUnit( NEUTRAL_PASSIVE_PLAYER, BUILDING_TAVERN[8], 7680.0, - 7936.0, 270.0 )
    }

    for i = 0, #tavern do
        SetUnitColor( tavern[i], ConvertPlayerColor( i ) )
        SetUnitPathing( tavern[i], false )
        SetUnitVertexColor( tavern[i], 0xFF, 0xFF, 0xFF, 0xA0 )

        ForForce( HEROES_FORCE, function( )
            UnitShareVision( tavern[i], GetEnumPlayer( ), true )
        end )
    end
end

-----------------------------------------------------------------------------
--  B U I L D I N G S :   P O W E R U P S                                  --
-----------------------------------------------------------------------------

function CreatePowerUps( )
    for i = 0, 2 do
        local x = BlzGetLocalSpecialEffectX( powerCircle[i] )
        local y = BlzGetLocalSpecialEffectY( powerCircle[i] )
        local rect = Rect( x - 32.0, y - 32.0, x + 32.0, y + 32.0 )
        local count = 0

        EnumItemsInRect( rect, nil, function( )
            if GetItemType( GetEnumItem( ) ) == ITEM_TYPE_POWERUP then
                count = count + 1
            end
        end )

        if count == 0 then
            local item = CreateItem( ITEM_POWERUP[GetRandomInt( 0, #ITEM_POWERUP )], x, y )

            SetItemInvulnerable( item, true )
        end

        RemoveRect( rect )
    end
end

function CreatePowerupCircles( )
    TriggerRegisterForceUnitEvent( CreateTrigger( ), HEROES_FORCE, EVENT_PLAYER_UNIT_PICKUP_ITEM, nil, function( )
        local item = GetManipulatedItem( )

        if GetItemType( item ) == ITEM_TYPE_POWERUP  then
            RemoveItem( item )
        end
    end )

    local effectPath = "Abilities\\Spells\\NightElf\\Starfall\\StarfallCaster.mdl"

    powerCircle = {
        [0] = AddSpecialEffect( effectPath, 5888.0 + 256.0, - 3328.0 + 256.0 ),
        [1] = AddSpecialEffect( effectPath, 2688.0 - 128.0, - 2944.0 + 128.0 ),
        [2] = AddSpecialEffect( effectPath, 2944.0,         - 6272.0         )
    }

    for i = 0, #powerCircle do
        local x = BlzGetLocalSpecialEffectX( powerCircle[i] )
        local y = BlzGetLocalSpecialEffectY( powerCircle[i] )
        local a = 0.0

        SetUbersplatRenderAlways( CreateUbersplat( x, y, "OLAR", 0xFF, 0xFF, 0xFF, 0xFF, true, true ), true )

        local e = {
            [0] = AddSpecialEffect( "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes0.mdl", x + 144.0 * math.cos(   0.0 * bj_DEGTORAD ), y + 144.0 * math.sin(   0.0 * bj_DEGTORAD ) ),
            [1] = AddSpecialEffect( "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes1.mdl", x + 144.0 * math.cos(  45.0 * bj_DEGTORAD ), y + 144.0 * math.sin(  45.0 * bj_DEGTORAD ) ),
            [2] = AddSpecialEffect( "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes2.mdl", x + 144.0 * math.cos(  90.0 * bj_DEGTORAD ), y + 144.0 * math.sin(  90.0 * bj_DEGTORAD ) ),
            [3] = AddSpecialEffect( "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes3.mdl", x + 144.0 * math.cos( 135.0 * bj_DEGTORAD ), y + 144.0 * math.sin( 135.0 * bj_DEGTORAD ) ),
            [4] = AddSpecialEffect( "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes4.mdl", x + 144.0 * math.cos( 180.0 * bj_DEGTORAD ), y + 144.0 * math.sin( 180.0 * bj_DEGTORAD ) ),
            [5] = AddSpecialEffect( "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes5.mdl", x + 144.0 * math.cos( 225.0 * bj_DEGTORAD ), y + 144.0 * math.sin( 225.0 * bj_DEGTORAD ) ),
            [6] = AddSpecialEffect( "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes6.mdl", x + 144.0 * math.cos( 270.0 * bj_DEGTORAD ), y + 144.0 * math.sin( 270.0 * bj_DEGTORAD ) ),
            [7] = AddSpecialEffect( "Doodads\\Cinematic\\GlowingRunes\\GlowingRunes7.mdl", x + 144.0 * math.cos( 315.0 * bj_DEGTORAD ), y + 144.0 * math.sin( 315.0 * bj_DEGTORAD ) )
        }

        TimerStart( CreateTimer( ), 0.03125, true, function( )
            for i = 0, #e do
                BlzSetSpecialEffectX  ( e[i], x + ( 96.0 + 16.0 ) * math.cos( ( i*45 + a ) * bj_DEGTORAD ) )
                BlzSetSpecialEffectY  ( e[i], y + ( 96.0 + 16.0 ) * math.sin( ( i*45 + a ) * bj_DEGTORAD ) )
                BlzSetSpecialEffectZ  ( e[i], 216.0 )
                BlzSetSpecialEffectYaw( e[i], math.rad( a ) )
            end

            a = a + 2.0
        end )
    end
end

-----------------------------------------------------------------------------
--  B U I L D I N G S                                                      --
-----------------------------------------------------------------------------

function IsUnitBuilding( whichUnit )
    return
    IsUnitTown( whichUnit ) or
            IsUnitTower( whichUnit ) or
            IsUnitPigFarm( whichUnit ) or
            IsUnitSpawnCircle( whichUnit ) or
            IsUnitSentryWard( whichUnit )
end

function RestoreBuilding( whichUnit )
    if IsUnitBuilding( whichUnit ) then

        if UnitAlive( whichUnit ) then
            SetUnitState( whichUnit, UNIT_STATE_LIFE, GetUnitState( whichUnit, UNIT_STATE_MAX_LIFE ) )
            SetUnitState( whichUnit, UNIT_STATE_MANA, GetUnitState( whichUnit, UNIT_STATE_MAX_MANA ) )

        else
            if reviverUnit ~= nil then
                SetUnitX( reviverUnit, GetUnitX( whichUnit ) )
                SetUnitY( reviverUnit, GetUnitY( whichUnit ) )
                IssueImmediateOrderById( reviverUnit, 852094 )

            else
                reviverUnit = CreateUnit( NEUTRAL_PASSIVE_PLAYER, DUMMY_UNIT_ID, GetUnitX( whichUnit ), GetUnitY( whichUnit ), 0.0 )
                UnitAddAbility( reviverUnit, FourCC( "A00Q" ) )
                IssueImmediateOrderById( reviverUnit, 852094 )
            end
        end

        UnitResetCooldown( whichUnit )
        DestroyEffect( AddSpecialEffect(
                "Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl",
                GetUnitX( whichUnit ),
                GetUnitY( whichUnit )
        ) )
    end
end

function RestoreAllBuildings( )
    RestoreBuilding( town )

    for i = 0, #tower do
        RestoreBuilding( tower[i] )
    end
end

function CreateAllBuildings( )
    CreateTown( )
    CreateTowers( )
    CreatePigFarms( )
    CreateSpawnCircles( )
    CreatePowerupCircles( )
    CreateSentryWards( )
    CreateTaverns( )


    SetBuildingsInvulnerable( true )
end

function SetBuildingsInvulnerable( flag )
    SetTownInvulnerable( flag )
    SetTowersInvulnerable( flag )
    SetPigFarmsInvulnerable( flag )
end
