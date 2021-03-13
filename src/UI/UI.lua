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