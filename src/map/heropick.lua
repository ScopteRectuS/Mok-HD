Hero = { }
HeroPick = {

    getSpawnX = function(id)
        return 5360.0
    end,

    getSpawnY = function(id)
        return -6300.0
    end,

    getSpawnFacing = function(id)
        return bj_UNIT_FACING
    end,

    initialize = function()
        BlzLoadTOCFile("war3mapImported\\Templates.toc")
        BlzHideOriginFrames(true)

        -- Hero pick dialog initialization: 0.48 - 0.2085 * 2 - 0.030 * 2
        local heroPickDialog = BlzCreateFrameByType("BACKDROP", "", BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), "EscMenuBackdrop", 0)
        BlzFrameSetSize(heroPickDialog, 0.48, 0.41875)
        BlzFrameSetSize(heroPickDialog, 0.48, 0.6)
        BlzFrameSetPoint(heroPickDialog, FRAMEPOINT_CENTER, BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), FRAMEPOINT_CENTER, 0.0, 0.0)

        local heroPickDialogTitle = BlzCreateFrameByType("TEXT", "", heroPickDialog, "EscMenuLabelTextTemplate", 0)
        BlzFrameSetPoint(heroPickDialogTitle, FRAMEPOINT_TOP, heroPickDialog, FRAMEPOINT_TOP, 0.0, -0.03)
        BlzFrameSetText(heroPickDialogTitle, "Mokk: Hero Defense")
        BlzFrameSetTextColor(heroPickDialogTitle, BlzConvertColor(0xFF, 0xFC, 0xD3, 0x12))

        local heroPickDialogSubtitle = BlzCreateFrameByType("TEXT", "", heroPickDialog, "EscMenuTitleTextTemplate", 0)
        BlzFrameSetPoint(heroPickDialogSubtitle, FRAMEPOINT_TOP, heroPickDialogTitle, FRAMEPOINT_BOTTOM, 0.0, -0.002)
        BlzFrameSetText(heroPickDialogSubtitle, "Выберите себе героя")
        BlzFrameSetTextColor(heroPickDialogSubtitle, BlzConvertColor(0xFF, 0xFF, 0xFF, 0xFF))



        -- Hero list container initialization:
        local heroListContainer = BlzCreateFrameByType("FRAME", "", heroPickDialog, "", 0)
        BlzFrameSetSize(heroListContainer, 0.2085, 0.11)
        BlzFrameSetPoint(heroListContainer, FRAMEPOINT_TOPLEFT, heroPickDialog, FRAMEPOINT_TOPLEFT,  0.030, -0.076125)
        BlzFrameSetPoint(heroListContainer, FRAMEPOINT_TOPLEFT, heroPickDialog, FRAMEPOINT_TOPLEFT,  0.030, -0.080)

        local heroListTitle = BlzCreateFrameByType("TEXT", "", heroListContainer, "EscMenuLabelTextTemplate", 0)
        BlzFrameSetPoint(heroListTitle, FRAMEPOINT_BOTTOMLEFT, heroListContainer, FRAMEPOINT_TOPLEFT, 0.003, 0.002)
        BlzFrameSetText(heroListTitle, "Cписок героев:")
        BlzFrameSetTextColor(heroListTitle, BlzConvertColor(0xFF, 0xFC, 0xD3, 0x12))

        local heroListContainerBackdrop = BlzCreateFrameByType("BACKDROP", "", heroListContainer, "EscMenuControlBackdropTemplate", 0)
        BlzFrameSetAllPoints(heroListContainerBackdrop, heroListContainer)

        local heroListScrollbar = BlzCreateFrameByType("SLIDER", "", heroListContainer, "EscMenuScrollBarTemplate", 0)
        local heroListScrollbarOffset = 0.010
        local heroListScrollbarHeight = BlzFrameGetHeight(heroListContainer) - heroListScrollbarOffset * 2
        BlzFrameSetSize(heroListScrollbar, 0.012, heroListScrollbarHeight)
        BlzFrameSetPoint(heroListScrollbar, FRAMEPOINT_TOPRIGHT, heroListContainer, FRAMEPOINT_TOPRIGHT, -heroListScrollbarOffset, -heroListScrollbarOffset)
        BlzFrameSetMinMaxValue(heroListScrollbar, 0, 4)
        BlzFrameSetStepSize(heroListScrollbar, 1)
        BlzFrameSetValue(heroListScrollbar, 0)



        -- Hero list item initialization:
        local heroListItem = BlzCreateFrameByType("FRAME", "", heroListContainer, "", 0)
        BlzFrameSetSize(heroListItem, 0.2085 - 0.010 * 2, 0.025)
        BlzFrameSetPoint(heroListItem, FRAMEPOINT_TOPLEFT, heroListContainer, FRAMEPOINT_TOPLEFT,  0.010, -0.010)

        local heroListItemIcon = BlzCreateFrameByType("BACKDROP", "", heroListItem, "", 0)
        BlzFrameSetSize(heroListItemIcon, 0.025, 0.025)
        BlzFrameSetPoint(heroListItemIcon, FRAMEPOINT_TOPLEFT, heroListItem, FRAMEPOINT_TOPLEFT,  0.0, 0.0)
        BlzFrameSetTexture(heroListItemIcon, "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.dds", 0, true)

        local heroListItemButton = BlzCreateFrameByType("BACKDROP", "", heroListItem, "", 0)
        BlzFrameSetSize(heroListItemButton, 0.2085 - 0.010 * 3 - 0.025, 0.025)
        BlzFrameSetPoint(heroListItemButton, FRAMEPOINT_TOPLEFT, heroListItemIcon, FRAMEPOINT_TOPRIGHT, 0.010, 0.0)
        BlzFrameSetTexture(heroListItemButton, "", 0, true)

        local heroListItemButtonText = BlzCreateFrameByType("TEXT", "", heroListItemButton, "QuestListItemTitle", 0)
        BlzFrameSetPoint(heroListItemButtonText, FRAMEPOINT_LEFT, heroListItemButton, FRAMEPOINT_LEFT, 0.002, 0.002)
        BlzFrameSetText(heroListItemButtonText, "Shadow Hunter")
        BlzFrameSetTextColor(heroListItemButtonText, BlzConvertColor(0xFF, 0xFF, 0xFF, 0xFF))



        local heroListItemIcon_2 = BlzCreateFrameByType("BACKDROP", "", heroListItem, "QuestListItemIconContainer", 0)
        BlzFrameSetSize(heroListItemIcon_2, 0.025, 0.025)
        BlzFrameSetPoint(heroListItemIcon_2, FRAMEPOINT_TOPLEFT, heroListItemIcon, FRAMEPOINT_BOTTOMLEFT,  0.0, -0.0075)
        BlzFrameSetTexture(heroListItemIcon_2, "ReplaceableTextures\\CommandButtons\\BTNThrall.dds", 0, true)

        local heroListItemIcon_3 = BlzCreateFrameByType("BACKDROP", "", heroListItem, "QuestListItemIconContainer", 0)
        BlzFrameSetSize(heroListItemIcon_3, 0.025, 0.025)
        BlzFrameSetPoint(heroListItemIcon_3, FRAMEPOINT_TOPLEFT, heroListItemIcon_2, FRAMEPOINT_BOTTOMLEFT,  0.0, -0.0075)
        BlzFrameSetTexture(heroListItemIcon_3, "ReplaceableTextures\\CommandButtons\\BTNThrall.dds", 0, true)



        -- Hero description container initialization:
        local heroDescriptionContainer = BlzCreateFrameByType("FRAME", "", heroPickDialog, "", 0)
        BlzFrameSetSize(heroDescriptionContainer, 0.2085, 0.11)
        BlzFrameSetPoint(heroDescriptionContainer, FRAMEPOINT_TOPRIGHT, heroPickDialog, FRAMEPOINT_TOPRIGHT, -0.030, -0.076125)
        BlzFrameSetPoint(heroDescriptionContainer, FRAMEPOINT_TOPRIGHT, heroPickDialog, FRAMEPOINT_TOPRIGHT, -0.030, -0.08)

        local heroDescriptionTitle = BlzCreateFrameByType("TEXT", "", heroDescriptionContainer, "EscMenuLabelTextTemplate", 0)
        BlzFrameSetPoint(heroDescriptionTitle, FRAMEPOINT_BOTTOMLEFT, heroDescriptionContainer, FRAMEPOINT_TOPLEFT, 0.003, 0.002)
        BlzFrameSetText(heroDescriptionTitle, "Описание героя:")
        BlzFrameSetTextColor(heroDescriptionTitle, BlzConvertColor(0xFF, 0xFC, 0xD3, 0x12))

        local heroDescriptionTextArea = BlzCreateFrameByType("TEXTAREA", "", heroDescriptionContainer, "EscMenuTextAreaTemplate", 0)
        BlzFrameSetAllPoints(heroDescriptionTextArea, heroDescriptionContainer)
        BlzFrameAddText(heroDescriptionTextArea, "Some text can be here. Some text can be here. Some text can be here. Some text can be here. Some text can be here. Some text can be here. Some text can be here. Some text can be here. Some text can be here. Some text can be here.")



        -- Ability list container initialization:
        local abilityListContainer = BlzCreateFrameByType("FRAME", "", heroPickDialog, "", 0)
        BlzFrameSetSize(abilityListContainer, 0.2085, 0.11)
        BlzFrameSetPoint(abilityListContainer, FRAMEPOINT_TOPLEFT, heroListContainer, FRAMEPOINT_BOTTOMLEFT,  0.0, -0.026375)

        local abilityListTitle = BlzCreateFrameByType("TEXT", "", abilityListContainer, "EscMenuLabelTextTemplate", 0)
        BlzFrameSetPoint(abilityListTitle, FRAMEPOINT_BOTTOMLEFT, abilityListContainer, FRAMEPOINT_TOPLEFT, 0.003, 0.002)
        BlzFrameSetText(abilityListTitle, "Cписок способностей:")
        BlzFrameSetTextColor(abilityListTitle, BlzConvertColor(0xFF, 0xFC, 0xD3, 0x12))

        local abilityListContainerBackdrop = BlzCreateFrameByType("BACKDROP", "", abilityListContainer, "EscMenuControlBackdropTemplate", 0)
        BlzFrameSetAllPoints(abilityListContainerBackdrop, abilityListContainer)

        local abilityListScrollbar = BlzCreateFrameByType("SLIDER", "", abilityListContainer, "EscMenuScrollBarTemplate", 0)
        local abilityListScrollbarOffset = 0.010
        local abilityListScrollbarHeight = BlzFrameGetHeight(abilityListContainer) - abilityListScrollbarOffset * 2
        BlzFrameSetSize(abilityListScrollbar, 0.012, abilityListScrollbarHeight)
        BlzFrameSetPoint(abilityListScrollbar, FRAMEPOINT_TOPRIGHT, abilityListContainer, FRAMEPOINT_TOPRIGHT, -abilityListScrollbarOffset, -abilityListScrollbarOffset)
        BlzFrameSetMinMaxValue(abilityListScrollbar, 0, 4)
        BlzFrameSetStepSize(abilityListScrollbar, 1)
        BlzFrameSetValue(abilityListScrollbar, 0)



        -- Ability description container initialization:
        local abilityDescriptionContainer = BlzCreateFrameByType("FRAME", "", heroPickDialog, "", 0)
        BlzFrameSetSize(abilityDescriptionContainer, 0.2085, 0.11)
        BlzFrameSetPoint(abilityDescriptionContainer, FRAMEPOINT_TOPRIGHT, heroDescriptionContainer, FRAMEPOINT_BOTTOMRIGHT, 0.0, -0.026375)

        local abilityDescriptionTitle = BlzCreateFrameByType("TEXT", "", abilityDescriptionContainer, "EscMenuLabelTextTemplate", 0)
        BlzFrameSetPoint(abilityDescriptionTitle, FRAMEPOINT_BOTTOMLEFT, abilityDescriptionContainer, FRAMEPOINT_TOPLEFT, 0.003, 0.002)
        BlzFrameSetText(abilityDescriptionTitle, "Описание способности:")
        BlzFrameSetTextColor(abilityDescriptionTitle, BlzConvertColor(0xFF, 0xFC, 0xD3, 0x12))

        local abilityDescriptionTextArea = BlzCreateFrameByType("TEXTAREA", "", abilityDescriptionContainer, "EscMenuTextAreaTemplate", 0)
        BlzFrameSetAllPoints(abilityDescriptionTextArea, abilityDescriptionContainer)
        BlzFrameAddText(abilityDescriptionTextArea, "Some text can be here. Some text can be here. Some text can be here. Some text can be here. Some text can be here. Some text can be here. Some text can be here. Some text can be here. Some text can be here. Some text can be here.")



        -- Chat log container initialization:
        local chatLogContainer = BlzCreateFrameByType("FRAME", "", heroPickDialog, "", 0)
        BlzFrameSetSize(chatLogContainer, 0.42, 0.11)
        BlzFrameSetPoint(chatLogContainer, FRAMEPOINT_TOPRIGHT, abilityDescriptionContainer, FRAMEPOINT_BOTTOMRIGHT, 0.0, -0.026375)

        local chatLogTitle = BlzCreateFrameByType("TEXT", "", chatLogContainer, "EscMenuLabelTextTemplate", 0)
        BlzFrameSetPoint(chatLogTitle, FRAMEPOINT_BOTTOMLEFT, chatLogContainer, FRAMEPOINT_TOPLEFT, 0.003, 0.002)
        BlzFrameSetText(chatLogTitle, "Журнал сообщений:")
        BlzFrameSetTextColor(chatLogTitle, BlzConvertColor(0xFF, 0xFC, 0xD3, 0x12))

        local chatLogTextArea = BlzCreateFrameByType("TEXTAREA", "", chatLogContainer, "EscMenuTextAreaTemplate", 0)
        BlzFrameSetAllPoints(chatLogTextArea, chatLogContainer)
        BlzFrameAddText(chatLogTextArea, "|cFFFF0303scopterectus|r: привет, модмейкеры!")
        BlzFrameAddText(chatLogTextArea, "|cFFFF0303scopterectus|r: хватит флудить в чат!")
        BlzFrameAddText(chatLogTextArea, "|cFF4E2A04ScorpioT1000|r: хочу и буду.")
        BlzFrameAddText(chatLogTextArea, "|cFF4E2A04ScorpioT1000|r: ты мне не указ!")
        BlzFrameAddText(chatLogTextArea, "|cFFFE8A0EBergi-bear|r: ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо!")
        BlzFrameAddText(chatLogTextArea, "|cFFFE8A0EBergi-bear|r: Peony i translit rulit!! )))]]]")
        BlzFrameAddText(chatLogTextArea, "|cFFFF0303scopterectus|r: ну всё, я обиделся...............")

        local chatLogEditBox = BlzCreateFrameByType("EDITBOX", "", chatLogContainer, "EscMenuEditBoxTemplate", 0)
        BlzFrameSetSize(chatLogEditBox, 0.42, 0.04)
        BlzFrameSetPoint(chatLogEditBox, FRAMEPOINT_TOPRIGHT, chatLogTextArea, FRAMEPOINT_BOTTOMRIGHT, 0.0, -0.0015)



        --
        local okButton = BlzCreateFrameByType("GLUETEXTBUTTON", "", heroPickDialog, "EscMenuButtonTemplate", 0)
        BlzFrameSetSize(okButton, 0.15, 0.03)
        BlzFrameSetPoint(okButton, FRAMEPOINT_BOTTOMRIGHT, heroPickDialog, FRAMEPOINT_BOTTOMRIGHT, -0.03, 0.03)

        local okButtonText = BlzCreateFrameByType("TEXT", "",okButton, "EscMenuButtonTextTemplate", 0)
        BlzFrameSetPoint(okButtonText, FRAMEPOINT_CENTER, okButton, FRAMEPOINT_CENTER, 0.0, 0.0)
        BlzFrameSetText(okButtonText, "OK")
        BlzFrameSetTextColor(okButtonText, BlzConvertColor(0xFF, 0xFC, 0xD3, 0x12))



        local tempButton = BlzCreateFrameByType("GLUETEXTBUTTON", "", heroPickDialog, "EscMenuButtonTemplate", 0)
        BlzFrameSetSize(tempButton, 0.15, 0.03)
        BlzFrameSetPoint(tempButton, FRAMEPOINT_TOPRIGHT, okButton, FRAMEPOINT_TOPLEFT, -0.003, 0.0)

        local tempButtonText = BlzCreateFrameByType("TEXT", "", tempButton, "EscMenuButtonTextTemplate", 0)
        BlzFrameSetPoint(tempButtonText, FRAMEPOINT_CENTER, tempButton, FRAMEPOINT_CENTER, 0.0, 0.0)
        BlzFrameSetText(tempButtonText, "CANCEL")
        BlzFrameSetTextColor(tempButtonText, BlzConvertColor(0xFF, 0xFC, 0xD3, 0x12))



        --[[local heroListItem_1 = BlzCreateFrame("QuestListItem", heroListContainer, 0, 0)
        BlzFrameSetPoint(heroListItem_1, FRAMEPOINT_TOPLEFT, heroListContainer, FRAMEPOINT_TOPLEFT,  0.0, 0.0)

        local heroListItemIconContainer_1 = BlzGetFrameByName("QuestListItemIconContainer", 0)
        BlzFrameSetTexture(heroListItemIconContainer_1, "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.dds", 0, true)

        local heroListItemButton_1 = BlzGetFrameByName("QuestListItemButton", 0)
        BlzFrameSetSize(heroListItemButton_1, 0.035, 0.035)

        local heroListItemTitle_1 = BlzGetFrameByName("QuestListItemTitle", 0)
        BlzFrameSetText(heroListItemTitle_1, "Blademaster")



        local heroListItem_2 = BlzCreateFrame("QuestListItem", heroListContainer, 0, 0)
        BlzFrameSetPoint(heroListItem_2, FRAMEPOINT_TOPLEFT, heroListItem_1, FRAMEPOINT_BOTTOMLEFT,  0.0, -0.0025)

        local heroListItemIconContainer_2 = BlzGetFrameByName("QuestListItemIconContainer", 0)
        BlzFrameSetTexture(heroListItemIconContainer_2, "ReplaceableTextures\\CommandButtons\\BTNShadowHunter.dds", 0, true)

        local heroListItemTitle_2 = BlzGetFrameByName("QuestListItemTitle", 0)
        BlzFrameSetText(heroListItemTitle_2, "Shadow Hunter")]]



        --[[local heroDescriptionTextArea = BlzCreateFrameByType("TEXTAREA", heroDescriptionBackdrop, "LogArea", 0)
        BlzFrameSetAllPoints(heroDescriptionTextArea, heroDescriptionBackdrop)
        BlzFrameSetTextColor(heroDescriptionTextArea, BlzConvertColor(0xFF, 0xFF, 0xFF, 0xFF))
        BlzFrameSetFont(heroDescriptionTextArea, "Fonts\\BLQ55Web.ttf", 0.011, 0)
        BlzFrameSetText(heroDescriptionTextArea, "Cunning Hero, adept at quickly killing individual units and creating confusion among enemies. Can learn Mirror Image, Wind Walk, Critical Strike and Bladestorm. Cunning Hero, adept at quickly killing individual units and creating confusion among enemies. Can learn Mirror Image, Wind Walk, Critical Strike and Bladestorm.")


        --[[local abilityListTitle = BlzCreateFrameByType("TEXT", "", heroPickDialog, "EscMenuTitleTextTemplate", 0)
        BlzFrameSetPoint(abilityListTitle, FRAMEPOINT_TOPLEFT, heroPickDialog, FRAMEPOINT_TOPLEFT, 0.033, -0.06475)
        BlzFrameSetText(abilityListTitle, "Cписок способностей героя:")
        BlzFrameSetTextColor(abilityListTitle, BlzConvertColor(0xFF, 0xFF, 0xFF, 0xFF))
        BlzFrameSetFont(abilityListTitle, "Fonts\\BLQ55Web.ttf", 0.015, 0)
        ]]

        --[[
                local heroListContainer = BlzCreateFrameByType("FRAME", "HeroListContainer", heroPickDialog, "", 0)
                BlzFrameSetSize(heroListContainer, 0.11, 0.21)
                BlzFrameSetPoint(heroListContainer, FRAMEPOINT_TOPLEFT, heroListTitleValue, FRAMEPOINT_BOTTOMLEFT, -0.003, -0.002)


                        local heroListItem = { }
                        local heroListItemIcon = { }
                        local heroListItemTitle = { }

                        heroListItem[1] = BlzCreateFrame("QuestListItem", heroListContainer, 0, 0)
                        heroListItemIcon[1] = BlzGetFrameByName("QuestListItemIconContainer", 0)
                        heroListItemTitle[1] = BlzGetFrameByName("QuestListItemTitle", 0)

                        BlzFrameSetTexture(heroListItemIcon[1], "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp", 0, true)
                        BlzFrameSetText(heroListItemTitle[1], "Мастер клинка")
                        BlzFrameSetPoint(heroListItem[1], FRAMEPOINT_TOPLEFT, heroListContainer, FRAMEPOINT_TOPLEFT, 0.0, 0.0)

                        heroListItem[2] = BlzCreateFrame("QuestListItem", heroListContainer, 0, 0)
                        heroListItemIcon[2] = BlzGetFrameByName("QuestListItemIconContainer", 0)
                        heroListItemTitle[2] = BlzGetFrameByName("QuestListItemTitle", 0)

                        BlzFrameSetTexture(heroListItemIcon[2], "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp", 0, true)
                        BlzFrameSetText(heroListItemTitle[2], "Мастер клинка")
                        BlzFrameSetPoint(heroListItem[2], FRAMEPOINT_TOPLEFT, heroListItem[1], FRAMEPOINT_BOTTOMLEFT, 0.0, -0.0025)

                        heroListItem[3] = BlzCreateFrame("QuestListItem", heroListContainer, 0, 0)
                        heroListItemIcon[3] = BlzGetFrameByName("QuestListItemIconContainer", 0)
                        heroListItemTitle[3] = BlzGetFrameByName("QuestListItemTitle", 0)

                        BlzFrameSetTexture(heroListItemIcon[3], "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp", 0, true)
                        BlzFrameSetText(heroListItemTitle[3], "Мастер клинка")
                        BlzFrameSetPoint(heroListItem[3], FRAMEPOINT_TOPLEFT, heroListItem[2], FRAMEPOINT_BOTTOMLEFT, 0.0, -0.0025)
                ]]

    end
}

function Hero.getByPlayer(whichPlayer)
    return Hero[whichPlayer]
end

function HeroPick.displayHint()
    local snd = CreateSoundFromLabel("Hint", false, false, false, 10000, 10000)
    local hint = "Choose the right character for your game. " ..
        "To complete the game, your team must have at least one hero from each class. " ..
        "For more information, click on the tavern you are interested in."

    DisplayTimedTextToPlayer(GetLocalPlayer(), 0.0, 0.0, 9.0, " ")
    DisplayTimedTextToPlayer(GetLocalPlayer(), 0.0, 0.0, 9.0, "|cff32CD32HINT|r – " .. hint)
    StartSound(snd)
    KillSoundWhenDone(snd)
end

function HeroPick.initializeTavernPick()
    local soldUnit = GetSoldUnit()
    local owner = GetOwningPlayer(soldUnit)

    for _, value in pairs(Team.defensiveForce) do
        SetPlayerTechMaxAllowed(value, GetUnitTypeId(soldUnit), IntegerTertiaryOp(value == owner, 1, 0))
    end

    UnitModifySkillPoints(soldUnit, -1)
    SetUnitX(soldUnit, HeroPick.getSpawnX(owner))
    SetUnitY(soldUnit, HeroPick.getSpawnY(owner))
    SetUnitFacing(soldUnit, HeroPick.getSpawnFacing(owner))
    SetUnitState(soldUnit, UNIT_STATE_LIFE, BlzGetUnitMaxHP(soldUnit))
    SetUnitState(soldUnit, UNIT_STATE_MANA, BlzGetUnitMaxMana(soldUnit))
    BlzSetHeroProperName(soldUnit, GetPlayerName(owner))

    if GetLocalPlayer() == owner then
        ClearSelection()
        ClearTextMessages()
        SelectUnit(soldUnit, true)
        BlzFrameSetVisible(topMsg, false)
        SetCameraPosition(GetUnitX(soldUnit), GetUnitY(soldUnit))
    end
end
