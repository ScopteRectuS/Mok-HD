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
        local game_ui = BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0)

        local heroPickDialog = BlzCreateFrame("HeroPickDialog", game_ui, 0, 0)

        BlzFrameSetPoint(heroPickDialog, FRAMEPOINT_CENTER, game_ui, FRAMEPOINT_CENTER, 0.0, 0.0)

        BlzFrameSetText(BlzGetFrameByName("HeroPickTitleValue", 0), MAP_NAME)
        BlzFrameSetText(BlzGetFrameByName("HeroPickSubtitleValue", 0), "Выберите себе героя")
        BlzFrameSetText(BlzGetFrameByName("HeroListTitleValue", 0), "Список героев")
        BlzFrameSetText(BlzGetFrameByName("HeroDescriptionTitleValue", 0), "Описание героя")
        BlzFrameSetText(BlzGetFrameByName("AbilityListTitleValue", 0), "Cпособности героя")
        BlzFrameSetText(BlzGetFrameByName("AbilityDescriptionTitleValue", 0), "Описание способности")

        local heroListContainer = BlzGetFrameByName("HeroListContainer", 0)
        local heroListItem = { }
        local heroListItemIcon = { }
        local heroListItemTitle = { }

        heroListItem[1] = BlzCreateFrame("HeroListItem", heroListContainer, 0, 0)
        heroListItemIcon[1] = BlzGetFrameByName("HeroListItemIcon", 0)
        heroListItemTitle[1] = BlzGetFrameByName("HeroListItemTitle", 0)

        heroListItem[2] = BlzCreateFrame("HeroListItem", heroListContainer, 0, 0)
        heroListItemIcon[2] = BlzGetFrameByName("HeroListItemIcon", 0)
        heroListItemTitle[2] = BlzGetFrameByName("HeroListItemTitle", 0)

        heroListItem[3] = BlzCreateFrame("HeroListItem", heroListContainer, 0, 0)
        heroListItemIcon[3] = BlzGetFrameByName("HeroListItemIcon", 0)
        heroListItemTitle[3] = BlzGetFrameByName("HeroListItemTitle", 0)

        BlzFrameSetTexture(heroListItemIcon[1], "ReplaceableTextures\\CommandButtons\\BTNHeroBlademaster.blp", 0, true)
        BlzFrameSetTexture(heroListItemIcon[2], "ReplaceableTextures\\CommandButtons\\BTNShadowHunter.blp", 0, true)
        BlzFrameSetTexture(heroListItemIcon[3], "ReplaceableTextures\\CommandButtons\\BTNThrall.blp", 0, true)

        BlzFrameSetText(heroListItemTitle[1], "Мастер клинка")
        BlzFrameSetText(heroListItemTitle[2], "Темный охотник")
        BlzFrameSetText(heroListItemTitle[3], "Предсказатель")

        BlzFrameSetPoint(heroListItem[1], FRAMEPOINT_TOPLEFT, heroListContainer, FRAMEPOINT_TOPLEFT, 0.0, 0.0)
        BlzFrameSetPoint(heroListItem[2], FRAMEPOINT_TOPLEFT, heroListItem[1], FRAMEPOINT_BOTTOMLEFT, 0.0, -0.0025)
        BlzFrameSetPoint(heroListItem[3], FRAMEPOINT_TOPLEFT, heroListItem[2], FRAMEPOINT_BOTTOMLEFT, 0.0, -0.0025)

        local heroDescriptionArea = BlzGetFrameByName("HeroDescriptionArea", 0)

        BlzFrameSetText(heroDescriptionArea, "Cunning Hero, adept at quickly killing individual units and creating confusion among enemies. Can learn Mirror Image, Wind Walk, Critical Strike and Bladestorm.")

        local abilityListContainer = BlzGetFrameByName("AbilityListContainer", 0)
        local abilityDescriptionArea = BlzGetFrameByName("AbilityDescriptionArea", 0)
        local heroPickOkButton = BlzGetFrameByName("HeroPickOkButton", 0)



        BlzFrameSetText(abilityDescriptionArea, "Causes a bladestorm of destructive force around the Blademaster, rendering him immune to magic and dealing damage to nearby enemy land units.")

        local trig = CreateTrigger()
        BlzTriggerRegisterFrameEvent(trig, heroPickOkButton, FRAMEEVENT_CONTROL_CLICK)
        TriggerAddAction(trig, function()
            BlzDestroyFrame(heroPickDialog)
        end)
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
