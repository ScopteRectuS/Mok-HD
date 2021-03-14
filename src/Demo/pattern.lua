--[[
COLOR
if     i ==  0 then return "|cFFFF0303" .. s .. "|r"
elseif i ==  1 then return "|cFF0042FF" .. s .. "|r"
elseif i ==  2 then return "|cFF1CE6B9" .. s .. "|r"
elseif i ==  3 then return "|cFF540081" .. s .. "|r"
elseif i ==  4 then return "|cFFFFFF01" .. s .. "|r"
elseif i ==  5 then return "|cFFFE8A0E" .. s .. "|r"
elseif i ==  6 then return "|cFF20C000" .. s .. "|r"
elseif i ==  7 then return "|cFFE55BB0" .. s .. "|r"
elseif i ==  8 then return "|cff959697" .. s .. "|r"
elseif i ==  9 then return "|cFF7EBFF1" .. s .. "|r"
elseif i == 10 then return "|cFF106246" .. s .. "|r"
elseif i == 11 then return "|cFF4E2A04" .. s .. "|r"
elseif i == 12 then return "|cFF282828" .. s .. "|r"
elseif i == 13 then return "|cFF282828" .. s .. "|r"
elseif i == 14 then return "|cFF282828" .. s .. "|r"
elseif i == 15 then return "|cFF282828" .. s .. "|r"
elseif i >= 16 then return "|cFFFFFFFF" .. s .. "|r"




    DAMAGE_TYPE_PHYSICAL
    UnitDamageTarget( source, target, amount, true, false, ATTACK_TYPE_MELEE, DAMAGE_TYPE_NORMAL, null )
    DAMAGE_TYPE_PHYSICAL_EX
    UnitDamageTarget( source, target, amount, true, false, ATTACK_TYPE_MELEE, DAMAGE_TYPE_UNIVERSAL, null )

    DAMAGE_TYPE_MAGICAL
    UnitDamageTarget( source, target, amount, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_MAGIC, null )
    DAMAGE_TYPE_MAGICAL_EX
    UnitDamageTarget( source, target, amount, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_ENHANCED, null )

    DAMAGE_TYPE_PURE
    UnitDamageTarget( source, target, amount, true, false, ATTACK_TYPE_CHAOS, DAMAGE_TYPE_UNIVERSAL, null )
    DAMAGE_TYPE_COMPOSITE
    UnitDamageTarget( source, target, amount, true, false, ATTACK_TYPE_NORMAL, DAMAGE_TYPE_NORMAL, null )




    FLOATING_TEXTTAG_GOLD                                   FLOATING_TEXTTAG_LUMBER
    SetTextTagText( tt, value, 0.023 )                      SetTextTagText( tt, value, 0.023 )
    SetTextTagPosUnit( tt, whichUnit, 0.0 )                 SetTextTagPosUnit( tt, whichUnit, 0.0 )
    SetTextTagColor( tt, 255, 220, 0, 255 )                 SetTextTagColor( tt, 0, 200, 80, 255 )
    SetTextTagVisibility ( tt, true )                       SetTextTagVisibility( tt, true )
    SetTextTagPermanent( tt, false )                        SetTextTagPermanent( tt, false )
    SetTextTagVelocity( tt, 0.0, 0.029 )                    SetTextTagVelocity( tt, 0.0, 0.029 )
    SetTextTagLifespan( tt, 2.0 )                           SetTextTagLifespan( tt, 2.0 )
    SetTextTagFadepoint( tt, 1.0 )                          SetTextTagFadepoint( tt, 1.0 )

    FLOATING_TEXTTAG_MISS                                   FLOATING_TEXTTAG_CRITICAL_STRIKE
    SetTextTagText( tt, value, 0.023 )                      SetTextTagText( tt, value, 0.023 )
    SetTextTagPosUnit( tt, whichUnit, 0.0 )                 SetTextTagPosUnit( tt, whichUnit, 0.0 )
    SetTextTagColor( tt, 255, 0, 0, 255 )                   SetTextTagColor( tt, 255, 0, 0, 255 )
    SetTextTagVisibility( tt, true )                        SetTextTagVisibility( tt, true )
    SetTextTagPermanent( tt, false )                        SetTextTagPermanent( tt, false )
    SetTextTagVelocity( tt, 0.0, 0.03993 )                  SetTextTagVelocity( tt, 0.0, 0.03993 )
    SetTextTagLifespan( tt, 3.0 )                           SetTextTagLifespan( tt, 5.0 )
    SetTextTagFadepoint( tt, 1.0 )                          SetTextTagFadepoint( tt, 2.0 )

    FLOATING_TEXTTAG_SHADOW_STRIKE                          FLOATING_TEXTTAG_MANA_BURN
    SetTextTagText( tt, value, 0.023 )                      SetTextTagText( tt, value, 0.023 )
    SetTextTagPosUnit( tt, whichUnit, 0.0 )                 SetTextTagPosUnit( tt, whichUnit, 0.0 )
    SetTextTagColor( tt, 158, 255, 0, 255 )                 SetTextTagColor( tt, 81, 81, 255, 255 )
    SetTextTagVisibility( tt, true )                        SetTextTagVisibility( tt, true )
    SetTextTagPermanent( tt, false )                        SetTextTagPermanent( tt, false )
    SetTextTagVelocity( tt, 0.0, 0.03993 )                  SetTextTagVelocity( tt, 0.0, 0.03993 )
    SetTextTagLifespan( tt, 5.0 )                           SetTextTagLifespan( tt, 5.0 )
    SetTextTagFadepoint( tt, 2.0 )                          SetTextTagFadepoint( tt, 2.0 )









    QUESTMESSAGE_DISCOVERED
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUEST, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUEST, "|cFFFFCC00" .. "MAIN QUEST" .. "|r" )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUEST, message )
    StartSound( QUEST_DISCOVERED_SOUND )
    FlashQuestDialogButton( )

    QUESTMESSAGE_OPT_DISCOVERED
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUEST, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUEST, "|cFFFFCC00" .. "OPTIONAL QUEST" .. "|r" )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUEST, message )
    StartSound( QUEST_DISCOVERED_SOUND)
    FlashQuestDialogButton( )

    QUESTMESSAGE_UPDATED
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTUPDATE, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTUPDATE, "|cffffcc00" .. "MAIN QUEST UPDATE" .. "|r" )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTUPDATE, message )
    StartSound( QUEST_UPDATED_SOUND )
    FlashQuestDialogButton( )

    QUESTMESSAGE_OPT_UPDATED
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTUPDATE, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTUPDATE, "|cFFFFCC00" .. "OPTIONAL QUEST UPDATE" .. "|r" )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTUPDATE, message )
    StartSound( QUEST_UPDATED_SOUND )
    FlashQuestDialogButton( )

    QUESTMESSAGE_COMPLETED
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTDONE, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTDONE, "|cFFFFCC00" .. "MAIN QUEST COMPLETED" .. "|r" )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTDONE, message )
    StartSound( QUEST_COMPLETED_SOUND )
    FlashQuestDialogButton( )

    QUESTMESSAGE_OPT_COMPLETED
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTDONE, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTDONE, "|cFFFFCC00" .. "OPTIONAL QUEST COMPLETED" .. "|r" )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTDONE, message )
    StartSound( QUEST_COMPLETED_SOUND )
    FlashQuestDialogButton( )

    QUESTMESSAGE_FAILED
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTFAILED, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTFAILED, "|cFFFFCC00" .. "QUEST FAILED" .. "|r" )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTFAILED, message )
    StartSound( QUEST_FAILED_SOUND )
    FlashQuestDialogButton( )

    QUESTMESSAGE_OPT_FAILED
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTFAILED, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTFAILED, "|cFFFFCC00" .. "OPTIONAL QUEST FAILED" .. "|r" )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTFAILED, message )
    StartSound( QUEST_FAILED_SOUND )
    FlashQuestDialogButton( )

    QUESTMESSAGE_REQUIREMENT
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTREQUIREMENT, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_QUESTREQUIREMENT, message )

    QUESTMESSAGE_MISSIONFAILED
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_MISSIONFAILED, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_MISSIONFAILED, "|cFFFFCC00" .. "MISSION FAILED" .. "|r" )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_MISSIONFAILED, message )
    StartSound( QUEST_FAILED_SOUND )

    QUESTMESSAGE_HINT
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_HINT, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_HINT, "|cff32CD32" .. "КРАТКАЯ ПОДСКАЗКА:" .. "|r " .. message )
    StartSound( QUEST_HINT_SOUND )

    QUESTMESSAGE_ALWAYSHINT
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_ALWAYSHINT, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_ALWAYSHINT, "|cff32CD32" .. "HINT" .. "|r " .. " – " .. message )
    StartSound( QUEST_HINT_SOUND )

    QUESTMESSAGE_SECRET
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_SECRET, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_SECRET, "|cff32CD32" .. "SECRET FOUND" .. "|r " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_SECRET, message )
    StartSound( QUEST_SECRET_SOUND )

    QUESTMESSAGE_UNITACQUIRED
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_UNITACQUIRED, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_UNITACQUIRED, "|cff87ceeb" .. "ВЫ ПОЛУЧИЛИ ПОДКРЕПЛЕНИЕ" .. "|r" )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_UNITACQUIRED, message )
    StartSound( QUEST_HINT_SOUND )

    QUESTMESSAGE_UNITAVAILABLE
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_UNITAVAILABLE, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_UNITAVAILABLE, "|cff87ceeb" .. "NEW UNIT AVAILABLE" .. "|r" )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_UNITAVAILABLE, message )
    StartSound( QUEST_HINT_SOUND )

    QUESTMESSAGE_ITEMACQUIRED
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_ITEMACQUIRED, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_ITEMACQUIRED, "|cff87ceeb" .. "ПОЛУЧЕНЫ ПРЕДМЕТЫ:" .. "|r " .. message )
    StartSound( QUEST_ITEM_ACQUIRED_SOUND )

    QUESTMESSAGE_WARNING
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_WARNING, " " )
    DisplayTimedTextToPlayer( GetLocalPlayer( ),  0.0,  0.0, bj_TEXT_DELAY_WARNING, "|cff32cd32" .. "ВНИМАНИЕ:" .. "|r " .. message )
    StartSound( QUEST_WARNING_SOUND )



    SOUND_PING_MINIMAP                                                  = CreateSoundFromLabel( "AutoCastButtonClick",         false, false, false, 10000, 10000 )
    SOUND_RESCUE                                                        = CreateSoundFromLabel( "Rescue",                      false, false, false, 10000, 10000 )
    SOUND_QUEST_DISCOVERED                                              = CreateSoundFromLabel( "QuestNew",                    false, false, false, 10000, 10000 )
    SOUND_QUEST_UPDATED                                                 = CreateSoundFromLabel( "QuestUpdate",                 false, false, false, 10000, 10000 )
    SOUND_QUEST_COMPLETED                                               = CreateSoundFromLabel( "QuestCompleted",              false, false, false, 10000, 10000 )
    SOUND_QUEST_FAILED                                                  = CreateSoundFromLabel( "QuestFailed",                 false, false, false, 10000, 10000 )
    SOUND_QUEST_HINT                                                    = CreateSoundFromLabel( "Hint",                        false, false, false, 10000, 10000 )
    SOUND_QUEST_SECRET                                                  = CreateSoundFromLabel( "SecretFound",                 false, false, false, 10000, 10000 )
    SOUND_QUEST_ITEM_ACQUIRED                                           = CreateSoundFromLabel( "ItemReward",                  false, false, false, 10000, 10000 )
    SOUND_QUEST_WARNING                                                 = CreateSoundFromLabel( "Warning",                     false, false, false, 10000, 10000 )
    SOUND_VICTORY_DIALOG                                                = CreateSoundFromLabel( "QuestCompleted",              false, false, false, 10000, 10000 )
    SOUND_DEFEAT_DIALOG                                                 = CreateSoundFromLabel( "QuestFailed",                 false, false, false, 10000, 10000 )
    SOUND_DAWN                                                          = CreateSound( "Sound\\Time\\DaybreakRooster.wav",     false, false, false, 10, 10, "DefaultEAXON" )
    SOUND_DUSK                                                          = CreateSound( "Sound\\Time\\DuskWolf.wav",            false, false, false, 10, 10, "DefaultEAXON" )
    SOUND_BATTLE_NET_TICK                                               = CreateSound( "Sound\\Interface\\BattleNetTick.wav",  false, false, false, 10, 10, "DefaultEAXON" )
    SOUND_GOOD_JOB                                                      = CreateSound( "Sound\\Interface\\GoodJob.wav",        false, false, false, 10, 10, "DefaultEAXON" )
    SOUND_CLAN_INVITATION                                               = CreateSound( "Sound\\Interface\\ClanInvitation.wav", false, false, false, 10, 10, "DefaultEAXON" )



    ITEM_POWERUP = {
        [0]                                                             = FourCC( "manh" ),
        [1]                                                             = FourCC( "tdx2" ),
        [2]                                                             = FourCC( "texp" ),
        [3]                                                             = FourCC( "tin2" ),
        [4]                                                             = FourCC( "tpow" ),
        [5]                                                             = FourCC( "tst2" )
    }

    TIP = {
        [0x00]                                                          = "выберите подходящего для вашего стиля игры героя.",
        [0x01]                                                          = "каждый раз, когда вы успешно проходите волну, богиня благословляет вас, исцеляя всех раненных воинов и воскрешая всех, кто пал в бою.",
        [0x02]                                                          = "когда погибает один из героев, его могут воскресить другие герои, которые остались в живых. Для этого щёлкните |cFFFED312ПРАВОЙ КНОПКОЙ МЫШИ|r на могиле погибшего героя. Если погибнут все герои, то вы проиграете.",
        [0x03]                                                          = "за убийство боссов иногда могут выпдать различные артефакты",
        [0x04]                                                          = "Choose the right character for your game. To complete the game, your team must have at least one hero from each class. For more information, click on the tavern you are interested in.",
        [0x05]                                                          = "|cFFFED312Ability Power:|r  Ability Power гладиаторы в битве полагаются в основном на урон с заклинаний, при этом сами обладают небольшим количеством брони и здоровья.",
        [0x06]                                                          = "|cFFFED312Attack Damage:|r  oписание находится в разработке.",
        [0x07]                                                          = "|cFFFED312Support:|r  сами Support'ы по себе не сильны, однако очень полезны для команды. Они могут как лечить раненных в бою союзников, так и усиливать огневую мощь атакующих.",
        [0x08]                                                          = "|cFFFED312Tank:|r  гладиаторы класса Tank отвлекают в бою внимание противника на себя, предотвращая нанесение урона слобозащищённым персонажам. Могут также перехватить часть повреждений, нацеленных на союзников. Для выполнения поставленных задач Tank'и имеют хорошую защиту и большой запас здоровья."
    }

]]