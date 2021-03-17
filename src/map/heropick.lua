Hero = { }
HeroPick = {

    getSpawnX = function()
        return 5360.0
    end,

    getSpawnY = function()
        return -6300.0
    end,

    getSpawnFacing = function()
        return bj_UNIT_FACING
    end,

    initialize = function()
        BlzHideOriginFrames(true)

        -- Hero pick dialog initialization: 0.48 - 0.2085 * 2 - 0.030 * 2
        local heroPickDialog = BlzCreateFrameByType("BACKDROP", "", BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), "EscMenuBackdrop", 0)
        --BlzFrameSetSize(heroPickDialog, 0.48, 0.41875)
        --BlzFrameSetSize(heroPickDialog, 0.48, 0.6) -- 0.003 0.026375 0,503375  |   0.024
        --BlzFrameSetSize(heroPickDialog, 0.503375, 0.6)
        BlzFrameSetSize(heroPickDialog, 0.497, 0.6)
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
        local heroListContainer = BlzCreateFrameByType("LISTBOX", "", heroPickDialog, "", 0)
        local heroListContainerWidth = 0.2085
        local heroListContainerHeight = 0.11
        BlzFrameSetSize(heroListContainer, heroListContainerWidth, heroListContainerHeight)
        BlzFrameSetPoint(heroListContainer, FRAMEPOINT_TOPLEFT, heroPickDialog, FRAMEPOINT_TOPLEFT,  0.030, -0.076125)
        BlzFrameSetPoint(heroListContainer, FRAMEPOINT_TOPLEFT, heroPickDialog, FRAMEPOINT_TOPLEFT,  0.030, -0.080)

        local heroListTitle = BlzCreateFrameByType("TEXT", "", heroListContainer, "EscMenuLabelTextTemplate", 0)
        BlzFrameSetPoint(heroListTitle, FRAMEPOINT_BOTTOMLEFT, heroListContainer, FRAMEPOINT_TOPLEFT, 0.003, 0.002)
        BlzFrameSetPoint(heroListTitle, FRAMEPOINT_BOTTOMLEFT, heroListContainer, FRAMEPOINT_TOPLEFT, 0.006, 0.002)
        BlzFrameSetText(heroListTitle, "Cписок героев:")
        BlzFrameSetTextColor(heroListTitle, BlzConvertColor(0xFF, 0xFC, 0xD3, 0x12))

        local heroListScrollbar = BlzCreateFrameByType("SLIDER", "", heroListContainer, "EscMenuScrollBarTemplate", 0)
        local heroListScrollbarOffset = 0.010
        local heroListScrollbarHeight = BlzFrameGetHeight(heroListContainer) - heroListScrollbarOffset * 2
        local heroListScrollbarWidth = 0.012
        BlzFrameSetSize(heroListScrollbar, heroListScrollbarWidth, heroListScrollbarHeight)
        BlzFrameSetPoint(heroListScrollbar, FRAMEPOINT_TOPRIGHT, heroListContainer, FRAMEPOINT_TOPRIGHT, 0.0, -heroListScrollbarOffset)
        BlzFrameSetMinMaxValue(heroListScrollbar, 1, 5)
        BlzFrameSetStepSize(heroListScrollbar, 1)
        BlzFrameSetValue(heroListScrollbar, 5)

        local trig = CreateTrigger()
        BlzTriggerRegisterFrameEvent(trig, heroListContainer, FRAMEEVENT_MOUSE_WHEEL)
        TriggerAddAction(trig, function()
            if BlzGetTriggerFrameValue() > 0.0 then
                BlzFrameSetValue(heroListScrollbar, BlzFrameGetValue(heroListScrollbar) + 1)
            elseif BlzGetTriggerFrameValue() < 0.0 then
                BlzFrameSetValue(heroListScrollbar, BlzFrameGetValue(heroListScrollbar) - 1)
            end
        end)



        -- Hero list item initialization:
        local heroListItem = BlzCreateFrame("QuestListItem", heroListContainer, 0, 0)
        local heroListItemStepOffset = 0.0025 -- Расстояние между кнпоками.
        local heroListItemWidth = heroListContainerWidth - heroListScrollbarWidth - heroListItemStepOffset
        local heroListItemHeight = 0.035
        BlzFrameSetSize(heroListItem, heroListItemWidth, heroListItemHeight)
        BlzFrameSetPoint(heroListItem, FRAMEPOINT_TOPLEFT, heroListContainer, FRAMEPOINT_TOPLEFT,  0.0, 0.0)

        local heroListItemIcon = BlzGetFrameByName("QuestListItemIconContainer", 0)
        local heroListItemIconWidth = 0.035
        local heroListItemIconHeight = 0.035
        BlzFrameSetSize(heroListItemIcon, heroListItemIconWidth, heroListItemIconHeight)
        BlzFrameSetPoint(heroListItemIcon, FRAMEPOINT_TOPLEFT, heroListItem, FRAMEPOINT_TOPLEFT,  0.0, 0.0)
        BlzFrameSetTexture(heroListItemIcon, "ReplaceableTextures\\CommandButtons\\BTNPeon", 0, true)

        local heroListItemButton = BlzGetFrameByName("QuestListItemButton", 0)
        local heroListItemButtonOffset = -0.003 -- Смещение по оси "х" относительно "heroListItemIcon".
        local heroListItemButtonWidth = heroListContainerWidth - heroListItemIconWidth - heroListItemButtonOffset - heroListScrollbarWidth - heroListItemStepOffset
        local heroListItemButtonHeight = 0.035
        BlzFrameClearAllPoints(heroListItemButton)
        BlzFrameSetSize(heroListItemButton, heroListItemButtonWidth, heroListItemButtonHeight)
        BlzFrameSetPoint(heroListItemButton, FRAMEPOINT_TOPLEFT, heroListItemIcon, FRAMEPOINT_TOPRIGHT, heroListItemButtonOffset, 0.0)

        local heroListItemButtonText = BlzGetFrameByName("QuestListItemTitle", 0)
        BlzFrameSetPoint(heroListItemButtonText, FRAMEPOINT_LEFT, heroListItemButton, FRAMEPOINT_LEFT, 0.002, 0.002)
        BlzFrameSetText(heroListItemButtonText, "Пеон, Король Батраков")
        BlzFrameSetTextColor(heroListItemButtonText, BlzConvertColor(0xFF, 0xFF, 0xFF, 0xFF))

        local heroListItemButtonStatusText = BlzGetFrameByName("QuestListItemComplete", 0)
        local heroListItemButtonStatusTextWidth = BlzFrameGetWidth(heroListItemButtonText)
        local heroListItemButtonStatusTextHeight = BlzFrameGetHeight(heroListItemButtonStatusText)
        BlzFrameClearAllPoints(heroListItemButtonStatusText)
        BlzFrameSetSize(heroListItemButtonStatusText, heroListItemButtonStatusTextWidth, heroListItemButtonStatusTextHeight)
        BlzFrameSetPoint(heroListItemButtonStatusText, FRAMEPOINT_BOTTOMLEFT, heroListItemButton, FRAMEPOINT_BOTTOMLEFT, 0.012, 0.008)
        BlzFrameSetText(heroListItemButtonStatusText, "герой уже выбран")
        BlzFrameSetTextColor(heroListItemButtonStatusText, BlzConvertColor(0xFF, 0x80, 0x80, 0x80))



        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        local heroListItem = BlzCreateFrame("QuestListItem", heroListContainer, 0, 0)
        local heroListItemStepOffset = 0.0025 -- Расстояние между кнпоками.
        local heroListItemWidth = heroListContainerWidth - heroListScrollbarWidth - heroListItemStepOffset
        local heroListItemHeight = 0.035
        BlzFrameSetSize(heroListItem, heroListItemWidth, heroListItemHeight)
        BlzFrameSetPoint(heroListItem, FRAMEPOINT_TOPLEFT, heroListContainer, FRAMEPOINT_TOPLEFT,  0.0, -(heroListItemHeight + heroListItemStepOffset) )

        local heroListItemIcon = BlzGetFrameByName("QuestListItemIconContainer", 0)
        local heroListItemIconWidth = 0.035
        local heroListItemIconHeight = 0.035
        BlzFrameSetSize(heroListItemIcon, heroListItemIconWidth, heroListItemIconHeight)
        BlzFrameSetPoint(heroListItemIcon, FRAMEPOINT_TOPLEFT, heroListItem, FRAMEPOINT_TOPLEFT,  0.0, 0.0)
        BlzFrameSetTexture(heroListItemIcon, "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster", 0, true)

        local heroListItemButton = BlzGetFrameByName("QuestListItemButton", 0)
        local heroListItemButtonOffset = -0.003 -- Смещение по оси "х" относительно "heroListItemIcon".
        local heroListItemButtonWidth = heroListContainerWidth - heroListItemIconWidth - heroListItemButtonOffset - heroListScrollbarWidth - heroListItemStepOffset
        local heroListItemButtonHeight = 0.035
        BlzFrameClearAllPoints(heroListItemButton)
        BlzFrameSetSize(heroListItemButton, heroListItemButtonWidth, heroListItemButtonHeight)
        BlzFrameSetPoint(heroListItemButton, FRAMEPOINT_TOPLEFT, heroListItemIcon, FRAMEPOINT_TOPRIGHT, heroListItemButtonOffset, 0.0)

        local heroListItemButtonText = BlzGetFrameByName("QuestListItemTitle", 0)
        BlzFrameSetPoint(heroListItemButtonText, FRAMEPOINT_LEFT, heroListItemButton, FRAMEPOINT_LEFT, 0.002, 0.002)
        BlzFrameSetText(heroListItemButtonText, "Самуро, Мастер Клинка")
        BlzFrameSetTextColor(heroListItemButtonText, BlzConvertColor(0xFF, 0xFF, 0xFF, 0xFF))

        local heroListItemButtonStatusText = BlzGetFrameByName("QuestListItemComplete", 0)
        local heroListItemButtonStatusTextWidth = BlzFrameGetWidth(heroListItemButtonText)
        local heroListItemButtonStatusTextHeight = BlzFrameGetHeight(heroListItemButtonStatusText)
        BlzFrameClearAllPoints(heroListItemButtonStatusText)
        BlzFrameSetSize(heroListItemButtonStatusText, heroListItemButtonStatusTextWidth, heroListItemButtonStatusTextHeight)
        BlzFrameSetPoint(heroListItemButtonStatusText, FRAMEPOINT_BOTTOMLEFT, heroListItemButton, FRAMEPOINT_BOTTOMLEFT, 0.012, 0.008)
        BlzFrameSetText(heroListItemButtonStatusText, "")
        BlzFrameSetTextColor(heroListItemButtonStatusText, BlzConvertColor(0xFF, 0x80, 0x80, 0x80))
        ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
        ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------





        --[[
        -------------------------------------------------------------------------------------------------------------------------
        BlzFrameSetVisible(heroListItemButton, false)

        local heroListItemButton = BlzCreateFrameByType("GLUEBUTTON", "", heroListItem, "QuestButtonTemplate", 0)
        local heroListItemButtonWidth = 0.2085 - 0.035 + 0.003 - 0.012 - 0.0025
        local heroListItemButtonHeight = 0.035
        BlzFrameClearAllPoints(heroListItemButton)
        BlzFrameSetSize(heroListItemButton, heroListItemButtonWidth, heroListItemButtonHeight)
        BlzFrameSetPoint(heroListItemButton, FRAMEPOINT_TOPLEFT, heroListItemIcon, FRAMEPOINT_TOPRIGHT, -0.003, 0.0)
        -------------------------------------------------------------------------------------------------------------------------
        ]]



        -- Hero description container initialization:
        local heroDescriptionContainer = BlzCreateFrameByType("FRAME", "", heroPickDialog, "", 0)
        BlzFrameSetSize(heroDescriptionContainer, 0.2085, 0.11)
        BlzFrameSetPoint(heroDescriptionContainer, FRAMEPOINT_TOPRIGHT, heroPickDialog, FRAMEPOINT_TOPRIGHT, -0.030, -0.076125)
        BlzFrameSetPoint(heroDescriptionContainer, FRAMEPOINT_TOPRIGHT, heroPickDialog, FRAMEPOINT_TOPRIGHT, -0.030, -0.08)

        local heroDescriptionTitle = BlzCreateFrameByType("TEXT", "", heroDescriptionContainer, "EscMenuLabelTextTemplate", 0)
        BlzFrameSetPoint(heroDescriptionTitle, FRAMEPOINT_BOTTOMLEFT, heroDescriptionContainer, FRAMEPOINT_TOPLEFT, 0.003, 0.002)
        BlzFrameSetPoint(heroDescriptionTitle, FRAMEPOINT_BOTTOMLEFT, heroDescriptionContainer, FRAMEPOINT_TOPLEFT, 0.006, 0.002)
        BlzFrameSetText(heroDescriptionTitle, "Описание героя:")
        BlzFrameSetTextColor(heroDescriptionTitle, BlzConvertColor(0xFF, 0xFC, 0xD3, 0x12))

        local heroDescriptionTextArea = BlzCreateFrameByType("TEXTAREA", "", heroDescriptionContainer, "EscMenuTextAreaTemplate", 0)
        BlzFrameSetAllPoints(heroDescriptionTextArea, heroDescriptionContainer)
        BlzFrameAddText(heroDescriptionTextArea, "Базовый рабочий. Добывает золото и древесину, а также строит и ремонтирует здания. Может оборонять базу, засев в землянке.")



        -- Ability list container initialization:
        local abilityListContainer = BlzCreateFrameByType("LISTBOX", "", heroPickDialog, "", 0)
        BlzFrameSetSize(abilityListContainer, 0.2085, 0.11)
        BlzFrameSetPoint(abilityListContainer, FRAMEPOINT_TOPLEFT, heroListContainer, FRAMEPOINT_BOTTOMLEFT,  0.0, -0.020)

        local abilityListTitle = BlzCreateFrameByType("TEXT", "", abilityListContainer, "EscMenuLabelTextTemplate", 0)
        BlzFrameSetPoint(abilityListTitle, FRAMEPOINT_BOTTOMLEFT, abilityListContainer, FRAMEPOINT_TOPLEFT, 0.006, 0.002)
        BlzFrameSetText(abilityListTitle, "Cписок способностей:")
        BlzFrameSetTextColor(abilityListTitle, BlzConvertColor(0xFF, 0xFC, 0xD3, 0x12))

        local abilityListScrollbar = BlzCreateFrameByType("SLIDER", "", abilityListContainer, "EscMenuScrollBarTemplate", 0)
        local abilityListScrollbarOffset = 0.010
        local abilityListScrollbarHeight = BlzFrameGetHeight(abilityListContainer) - abilityListScrollbarOffset * 2
        BlzFrameSetSize(abilityListScrollbar, 0.012, abilityListScrollbarHeight)
        BlzFrameSetPoint(abilityListScrollbar, FRAMEPOINT_TOPRIGHT, abilityListContainer, FRAMEPOINT_TOPRIGHT, 0.0, -abilityListScrollbarOffset)
        BlzFrameSetMinMaxValue(abilityListScrollbar, 0, 4)
        BlzFrameSetStepSize(abilityListScrollbar, 1)
        BlzFrameSetValue(abilityListScrollbar, 4)

        local trig = CreateTrigger()
        BlzTriggerRegisterFrameEvent(trig, abilityListContainer, FRAMEEVENT_MOUSE_WHEEL)
        TriggerAddAction(trig, function()
            if BlzGetTriggerFrameValue() > 0.0 then
                BlzFrameSetValue(abilityListScrollbar, BlzFrameGetValue(abilityListScrollbar) + 1)
            elseif BlzGetTriggerFrameValue() < 0.0 then
                BlzFrameSetValue(abilityListScrollbar, BlzFrameGetValue(abilityListScrollbar) - 1)
            end
        end)

        -----------------------------
        local heroListItem = BlzCreateFrame("QuestListItem", abilityListContainer, 0, 0)
        local heroListItemStepOffset = 0.0025 -- Расстояние между кнпоками.
        local heroListItemWidth = heroListContainerWidth - heroListScrollbarWidth - heroListItemStepOffset
        local heroListItemHeight = 0.035
        BlzFrameSetSize(heroListItem, heroListItemWidth, heroListItemHeight)
        BlzFrameSetPoint(heroListItem, FRAMEPOINT_TOPLEFT, abilityListContainer, FRAMEPOINT_TOPLEFT,  0.0, 0.0)

        local heroListItemIcon = BlzGetFrameByName("QuestListItemIconContainer", 0)
        local heroListItemIconWidth = 0.035
        local heroListItemIconHeight = 0.035
        BlzFrameSetSize(heroListItemIcon, heroListItemIconWidth, heroListItemIconHeight)
        BlzFrameSetPoint(heroListItemIcon, FRAMEPOINT_TOPLEFT, heroListItem, FRAMEPOINT_TOPLEFT,  0.0, 0.0)
        BlzFrameSetTexture(heroListItemIcon, "ReplaceableTextures\\CommandButtons\\BTNWindWalkOn.blp", 0, true)

        local heroListItemButton = BlzGetFrameByName("QuestListItemButton", 0)
        local heroListItemButtonOffset = -0.003 -- Смещение по оси "х" относительно "heroListItemIcon".
        local heroListItemButtonWidth = heroListContainerWidth - heroListItemIconWidth - heroListItemButtonOffset - heroListScrollbarWidth - heroListItemStepOffset
        local heroListItemButtonHeight = 0.035
        BlzFrameClearAllPoints(heroListItemButton)
        BlzFrameSetSize(heroListItemButton, heroListItemButtonWidth, heroListItemButtonHeight)
        BlzFrameSetPoint(heroListItemButton, FRAMEPOINT_TOPLEFT, heroListItemIcon, FRAMEPOINT_TOPRIGHT, heroListItemButtonOffset, 0.0)

        local heroListItemButtonText = BlzGetFrameByName("QuestListItemTitle", 0)
        BlzFrameSetPoint(heroListItemButtonText, FRAMEPOINT_LEFT, heroListItemButton, FRAMEPOINT_LEFT, 0.002, 0.002)
        BlzFrameSetText(heroListItemButtonText, "Shadow Walk")
        BlzFrameSetTextColor(heroListItemButtonText, BlzConvertColor(0xFF, 0xFF, 0xFF, 0xFF))

        local heroListItemButtonStatusText = BlzGetFrameByName("QuestListItemComplete", 0)
        local heroListItemButtonStatusTextWidth = BlzFrameGetWidth(heroListItemButtonText)
        local heroListItemButtonStatusTextHeight = BlzFrameGetHeight(heroListItemButtonStatusText)
        BlzFrameClearAllPoints(heroListItemButtonStatusText)
        BlzFrameSetSize(heroListItemButtonStatusText, heroListItemButtonStatusTextWidth, heroListItemButtonStatusTextHeight)
        BlzFrameSetPoint(heroListItemButtonStatusText, FRAMEPOINT_BOTTOMLEFT, heroListItemButton, FRAMEPOINT_BOTTOMLEFT, 0.012, 0.008)
        BlzFrameSetText(heroListItemButtonStatusText, "")
        BlzFrameSetTextColor(heroListItemButtonStatusText, BlzConvertColor(0xFF, 0x80, 0x80, 0x80))


        local heroListItem = BlzCreateFrame("QuestListItem", abilityListContainer, 0, 0)
        local heroListItemStepOffset = 0.0025 -- Расстояние между кнпоками.
        local heroListItemWidth = heroListContainerWidth - heroListScrollbarWidth - heroListItemStepOffset
        local heroListItemHeight = 0.035
        BlzFrameSetSize(heroListItem, heroListItemWidth, heroListItemHeight)
        BlzFrameSetPoint(heroListItem, FRAMEPOINT_TOPLEFT, abilityListContainer, FRAMEPOINT_TOPLEFT,  0.0, -1 * (heroListItemHeight + heroListItemStepOffset))

        local heroListItemIcon = BlzGetFrameByName("QuestListItemIconContainer", 0)
        local heroListItemIconWidth = 0.035
        local heroListItemIconHeight = 0.035
        BlzFrameSetSize(heroListItemIcon, heroListItemIconWidth, heroListItemIconHeight)
        BlzFrameSetPoint(heroListItemIcon, FRAMEPOINT_TOPLEFT, heroListItem, FRAMEPOINT_TOPLEFT,  0.0, 0.0)
        BlzFrameSetTexture(heroListItemIcon, "ReplaceableTextures\\CommandButtons\\BTNMirrorImage.blp", 0, true)

        local heroListItemButton = BlzGetFrameByName("QuestListItemButton", 0)
        local heroListItemButtonOffset = -0.003 -- Смещение по оси "х" относительно "heroListItemIcon".
        local heroListItemButtonWidth = heroListContainerWidth - heroListItemIconWidth - heroListItemButtonOffset - heroListScrollbarWidth - heroListItemStepOffset
        local heroListItemButtonHeight = 0.035
        BlzFrameClearAllPoints(heroListItemButton)
        BlzFrameSetSize(heroListItemButton, heroListItemButtonWidth, heroListItemButtonHeight)
        BlzFrameSetPoint(heroListItemButton, FRAMEPOINT_TOPLEFT, heroListItemIcon, FRAMEPOINT_TOPRIGHT, heroListItemButtonOffset, 0.0)

        local heroListItemButtonText = BlzGetFrameByName("QuestListItemTitle", 0)
        BlzFrameSetPoint(heroListItemButtonText, FRAMEPOINT_LEFT, heroListItemButton, FRAMEPOINT_LEFT, 0.002, 0.002)
        BlzFrameSetText(heroListItemButtonText, "Mirror Image")
        BlzFrameSetTextColor(heroListItemButtonText, BlzConvertColor(0xFF, 0xFF, 0xFF, 0xFF))

        local heroListItemButtonStatusText = BlzGetFrameByName("QuestListItemComplete", 0)
        local heroListItemButtonStatusTextWidth = BlzFrameGetWidth(heroListItemButtonText)
        local heroListItemButtonStatusTextHeight = BlzFrameGetHeight(heroListItemButtonStatusText)
        BlzFrameClearAllPoints(heroListItemButtonStatusText)
        BlzFrameSetSize(heroListItemButtonStatusText, heroListItemButtonStatusTextWidth, heroListItemButtonStatusTextHeight)
        BlzFrameSetPoint(heroListItemButtonStatusText, FRAMEPOINT_BOTTOMLEFT, heroListItemButton, FRAMEPOINT_BOTTOMLEFT, 0.012, 0.008)
        BlzFrameSetText(heroListItemButtonStatusText, "")
        BlzFrameSetTextColor(heroListItemButtonStatusText, BlzConvertColor(0xFF, 0x80, 0x80, 0x80))


        local heroListItem = BlzCreateFrame("QuestListItem", abilityListContainer, 0, 0)
        local heroListItemStepOffset = 0.0025 -- Расстояние между кнпоками.
        local heroListItemWidth = heroListContainerWidth - heroListScrollbarWidth - heroListItemStepOffset
        local heroListItemHeight = 0.035
        BlzFrameSetSize(heroListItem, heroListItemWidth, heroListItemHeight)
        BlzFrameSetPoint(heroListItem, FRAMEPOINT_TOPLEFT, abilityListContainer, FRAMEPOINT_TOPLEFT,  0.0, -2 * (heroListItemHeight + heroListItemStepOffset))

        local heroListItemIcon = BlzGetFrameByName("QuestListItemIconContainer", 0)
        local heroListItemIconWidth = 0.035
        local heroListItemIconHeight = 0.035
        BlzFrameSetSize(heroListItemIcon, heroListItemIconWidth, heroListItemIconHeight)
        BlzFrameSetPoint(heroListItemIcon, FRAMEPOINT_TOPLEFT, heroListItem, FRAMEPOINT_TOPLEFT,  0.0, 0.0)
        BlzFrameSetTexture(heroListItemIcon, "ReplaceableTextures\\CommandButtons\\BTNCriticalStrike.blp", 0, true)

        local heroListItemButton = BlzGetFrameByName("QuestListItemButton", 0)
        local heroListItemButtonOffset = -0.003 -- Смещение по оси "х" относительно "heroListItemIcon".
        local heroListItemButtonWidth = heroListContainerWidth - heroListItemIconWidth - heroListItemButtonOffset - heroListScrollbarWidth - heroListItemStepOffset
        local heroListItemButtonHeight = 0.035
        BlzFrameClearAllPoints(heroListItemButton)
        BlzFrameSetSize(heroListItemButton, heroListItemButtonWidth, heroListItemButtonHeight)
        BlzFrameSetPoint(heroListItemButton, FRAMEPOINT_TOPLEFT, heroListItemIcon, FRAMEPOINT_TOPRIGHT, heroListItemButtonOffset, 0.0)

        local heroListItemButtonText = BlzGetFrameByName("QuestListItemTitle", 0)
        BlzFrameSetPoint(heroListItemButtonText, FRAMEPOINT_LEFT, heroListItemButton, FRAMEPOINT_LEFT, 0.002, 0.002)
        BlzFrameSetText(heroListItemButtonText, "Critical Strike")
        BlzFrameSetTextColor(heroListItemButtonText, BlzConvertColor(0xFF, 0xFF, 0xFF, 0xFF))

        local heroListItemButtonStatusText = BlzGetFrameByName("QuestListItemComplete", 0)
        local heroListItemButtonStatusTextWidth = BlzFrameGetWidth(heroListItemButtonText)
        local heroListItemButtonStatusTextHeight = BlzFrameGetHeight(heroListItemButtonStatusText)
        BlzFrameClearAllPoints(heroListItemButtonStatusText)
        BlzFrameSetSize(heroListItemButtonStatusText, heroListItemButtonStatusTextWidth, heroListItemButtonStatusTextHeight)
        BlzFrameSetPoint(heroListItemButtonStatusText, FRAMEPOINT_BOTTOMLEFT, heroListItemButton, FRAMEPOINT_BOTTOMLEFT, 0.012, 0.008)
        BlzFrameSetText(heroListItemButtonStatusText, "")
        BlzFrameSetTextColor(heroListItemButtonStatusText, BlzConvertColor(0xFF, 0x80, 0x80, 0x80))
        -----------------------------
        -----------------------------



        -- Ability description container initialization:
        local abilityDescriptionContainer = BlzCreateFrameByType("FRAME", "", heroPickDialog, "", 0)
        BlzFrameSetSize(abilityDescriptionContainer, 0.2085, 0.11)
        --BlzFrameSetPoint(abilityDescriptionContainer, FRAMEPOINT_TOPRIGHT, heroDescriptionContainer, FRAMEPOINT_BOTTOMRIGHT, 0.0, -0.026375)
        BlzFrameSetPoint(abilityDescriptionContainer, FRAMEPOINT_TOPRIGHT, heroDescriptionContainer, FRAMEPOINT_BOTTOMRIGHT, 0.0, -0.020)

        local abilityDescriptionTitle = BlzCreateFrameByType("TEXT", "", abilityDescriptionContainer, "EscMenuLabelTextTemplate", 0)
        BlzFrameSetPoint(abilityDescriptionTitle, FRAMEPOINT_BOTTOMLEFT, abilityDescriptionContainer, FRAMEPOINT_TOPLEFT, 0.003, 0.002)
        BlzFrameSetPoint(abilityDescriptionTitle, FRAMEPOINT_BOTTOMLEFT, abilityDescriptionContainer, FRAMEPOINT_TOPLEFT, 0.006, 0.002)
        BlzFrameSetText(abilityDescriptionTitle, "Описание способности:")
        BlzFrameSetTextColor(abilityDescriptionTitle, BlzConvertColor(0xFF, 0xFC, 0xD3, 0x12))

        local abilityDescriptionTextArea = BlzCreateFrameByType("TEXTAREA", "", abilityDescriptionContainer, "EscMenuTextAreaTemplate", 0)
        BlzFrameSetAllPoints(abilityDescriptionTextArea, abilityDescriptionContainer)
        BlzFrameAddText(abilityDescriptionTextArea, "Some text can be here. Some text can be here. Some text can be here.")



        -- Chat log container initialization:
        local chatLogContainer = BlzCreateFrameByType("FRAME", "", heroPickDialog, "", 0)
        BlzFrameSetSize(chatLogContainer, 0.42, 0.11)
        --BlzFrameSetPoint(chatLogContainer, FRAMEPOINT_TOPRIGHT, abilityDescriptionContainer, FRAMEPOINT_BOTTOMRIGHT, 0.0, -0.026375)
        BlzFrameSetPoint(chatLogContainer, FRAMEPOINT_TOPRIGHT, abilityDescriptionContainer, FRAMEPOINT_BOTTOMRIGHT, 0.0, -0.020)
        BlzFrameSetPoint(chatLogContainer, FRAMEPOINT_TOPLEFT, abilityListContainer, FRAMEPOINT_BOTTOMLEFT, 0.0, -0.020)

        local chatLogTitle = BlzCreateFrameByType("TEXT", "", chatLogContainer, "EscMenuLabelTextTemplate", 0)
        BlzFrameSetPoint(chatLogTitle, FRAMEPOINT_BOTTOMLEFT, chatLogContainer, FRAMEPOINT_TOPLEFT, 0.003, 0.002)
        BlzFrameSetPoint(chatLogTitle, FRAMEPOINT_BOTTOMLEFT, chatLogContainer, FRAMEPOINT_TOPLEFT, 0.006, 0.002)
        BlzFrameSetText(chatLogTitle, "Журнал сообщений:")
        BlzFrameSetTextColor(chatLogTitle, BlzConvertColor(0xFF, 0xFC, 0xD3, 0x12))

        local chatLogTextArea = BlzCreateFrameByType("TEXTAREA", "", chatLogContainer, "EscMenuTextAreaTemplate", 0)
        BlzFrameSetAllPoints(chatLogTextArea, chatLogContainer)

        BlzFrameAddText(chatLogTextArea, "|cff32CD32HINT|r – Выбор правильного персонажа поможет вам проще пройти игру. Обратите внимание на то, чтобы в вашей команде был хотя бы один герой из каждого класса.")
        BlzFrameAddText(chatLogTextArea, " ")
        BlzFrameAddText(chatLogTextArea, "|cFFFF0303scopterectus|r: привет, модмейкеры!")
        BlzFrameAddText(chatLogTextArea, "|cFFFE8A0EBergi-bear|r: ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо! ха-хо-хо!")
        BlzFrameAddText(chatLogTextArea, "|cFFFE8A0EBergi-bear|r: Peony i translit rulit!! )))]]]")
        BlzFrameAddText(chatLogTextArea, "|cFFFF0303scopterectus|r: ну всё, я обиделся...............")

        local chatLogEditBox = BlzCreateFrameByType("EDITBOX", "", chatLogContainer, "EscMenuEditBoxTemplate", 0)
        BlzFrameSetSize(chatLogEditBox, 0.42, 0.04)
        BlzFrameSetPoint(chatLogEditBox, FRAMEPOINT_TOPRIGHT, chatLogTextArea, FRAMEPOINT_BOTTOMRIGHT, 0.0, -0.0010)
        BlzFrameSetPoint(chatLogEditBox, FRAMEPOINT_TOPLEFT, chatLogTextArea, FRAMEPOINT_BOTTOMLEFT, 0.0, -0.0010)



        -- Exit button initialization:
        local okButton = BlzCreateFrameByType("GLUETEXTBUTTON", "", heroPickDialog, "EscMenuButtonTemplate", 0)
        BlzFrameSetSize(okButton, 0.15, 0.03)
        BlzFrameSetPoint(okButton, FRAMEPOINT_BOTTOMRIGHT, heroPickDialog, FRAMEPOINT_BOTTOMRIGHT, -0.03, 0.03)
        BlzFrameSetEnable(okButton, false)

        local okButtonText = BlzCreateFrameByType("TEXT", "",okButton, "EscMenuButtonTextTemplate", 0)
        BlzFrameSetPoint(okButtonText, FRAMEPOINT_CENTER, okButton, FRAMEPOINT_CENTER, 0.0, 0.0)
        BlzFrameSetText(okButtonText, "OK")
        BlzFrameSetTextColor(okButtonText, BlzConvertColor(0xFF, 0x80, 0x80, 0x80))

        local tempButton = BlzCreateFrameByType("GLUETEXTBUTTON", "", heroPickDialog, "EscMenuButtonTemplate", 0)
        BlzFrameSetSize(tempButton, 0.15, 0.03)
        BlzFrameSetPoint(tempButton, FRAMEPOINT_TOPRIGHT, okButton, FRAMEPOINT_TOPLEFT, -0.003, 0.0)
        BlzFrameSetEnable(tempButton, false)

        local tempButtonText = BlzCreateFrameByType("TEXT", "", tempButton, "EscMenuButtonTextTemplate", 0)
        BlzFrameSetPoint(tempButtonText, FRAMEPOINT_CENTER, tempButton, FRAMEPOINT_CENTER, 0.0, 0.0)
        BlzFrameSetText(tempButtonText, "CANCEL")
        BlzFrameSetTextColor(tempButtonText, BlzConvertColor(0xFF, 0x80, 0x80, 0x80))
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
