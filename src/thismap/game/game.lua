Game = {

    startDefeat = function()
    end,

    startVictory = function()
    end,

    setStartingVisibility = function()
        FogEnable(true)
        FogMaskEnable(true)
    end,

    setStartingResources = function()
    end,

    createStartingUnits = function()
        for _, value in pairs(Team.computerForce) do
            local id = GetPlayerId(value)
            local startLocX = GetStartLocationX(id)
            local startLocY = GetStartLocationY(id)

            local unitSpacing = 64.00
            local peonX = startLocX
            local peonY = startLocY - 224.00

            --  Spawn Great Hall at the start location.
            CreateUnit(value, FourCC("o002"), startLocX, startLocY, bj_UNIT_FACING)

            --  Spawn Peons directly south of the town hall.
            CreateUnit(value, FourCC("opeo"), peonX + 2.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
            CreateUnit(value, FourCC("opeo"), peonX + 1.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
            CreateUnit(value, FourCC("opeo"), peonX + 0.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
            CreateUnit(value, FourCC("opeo"), peonX - 1.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
            CreateUnit(value, FourCC("opeo"), peonX - 2.00 * unitSpacing, peonY + 0.00 * unitSpacing, bj_UNIT_FACING)
        end
    end,

    setStartingHeroLimit = function()
    end,

    setPlayerAllianceStateAlly = function(sourcePlayer, otherPlayer, flag)
        SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_PASSIVE, flag)
        SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_HELP_REQUEST, flag)
        SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_HELP_RESPONSE, flag)
        SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_SHARED_XP, flag)
        SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_SHARED_SPELLS, flag)
        SetPlayerAlliance(sourcePlayer, otherPlayer, ALLIANCE_SHARED_VISION, flag)
    end,
    
    setAllPlayersAlliance = function()
        Game.setPlayerAllianceStateAlly(Player(0x00), Player(0x02), false)
        Game.setPlayerAllianceStateAlly(Player(0x00), Player(0x03), false)
        Game.setPlayerAllianceStateAlly(Player(0x00), Player(0x04), false)
        Game.setPlayerAllianceStateAlly(Player(0x00), Player(0x05), false)
        Game.setPlayerAllianceStateAlly(Player(0x00), Player(0x16), false)

        Game.setPlayerAllianceStateAlly(Player(0x02), Player(0x00), false)
        Game.setPlayerAllianceStateAlly(Player(0x03), Player(0x00), false)
        Game.setPlayerAllianceStateAlly(Player(0x04), Player(0x00), false)
        Game.setPlayerAllianceStateAlly(Player(0x05), Player(0x00), false)
        Game.setPlayerAllianceStateAlly(Player(0x16), Player(0x00), false)
        
        Game.setPlayerAllianceStateAlly(Player(0x02), Player(0x03), true)
        Game.setPlayerAllianceStateAlly(Player(0x02), Player(0x04), true)
        Game.setPlayerAllianceStateAlly(Player(0x02), Player(0x05), true)
        Game.setPlayerAllianceStateAlly(Player(0x02), Player(0x16), true)

        Game.setPlayerAllianceStateAlly(Player(0x03), Player(0x02), true)
        Game.setPlayerAllianceStateAlly(Player(0x03), Player(0x04), true)
        Game.setPlayerAllianceStateAlly(Player(0x03), Player(0x05), true)
        Game.setPlayerAllianceStateAlly(Player(0x03), Player(0x16), true)

        Game.setPlayerAllianceStateAlly(Player(0x04), Player(0x02), true)
        Game.setPlayerAllianceStateAlly(Player(0x04), Player(0x03), true)
        Game.setPlayerAllianceStateAlly(Player(0x04), Player(0x05), true)
        Game.setPlayerAllianceStateAlly(Player(0x04), Player(0x16), true)

        Game.setPlayerAllianceStateAlly(Player(0x05), Player(0x02), true)
        Game.setPlayerAllianceStateAlly(Player(0x05), Player(0x03), true)
        Game.setPlayerAllianceStateAlly(Player(0x05), Player(0x04), true)
        Game.setPlayerAllianceStateAlly(Player(0x05), Player(0x16), true)

        Game.setPlayerAllianceStateAlly(Player(0x16), Player(0x02), true)
        Game.setPlayerAllianceStateAlly(Player(0x16), Player(0x03), true)
        Game.setPlayerAllianceStateAlly(Player(0x16), Player(0x04), true)
        Game.setPlayerAllianceStateAlly(Player(0x16), Player(0x05), true)
    end,

    setCameraBounds = function()
        local marginX = 1024.0 + 512.0 + 512.0
        local marginY = 1024.0 + 512.0 + 256.0

        local maxX = GetRectMaxX(GetWorldRect())
        local minX = GetRectMinX(GetWorldRect())
        local maxY = GetRectMaxY(GetWorldRect())
        local minY = GetRectMinY(GetWorldRect())

        SetCameraBounds(
            minX + marginX,
            minY + marginY,
            maxX - marginX,
            maxY - marginY,
            minX + marginX,
            maxY - marginY,
            maxX - marginX,
            minY + marginY
        )
    end,

    setCameraTargetDistance = function()
        local cameraDist = 1785.0

        SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, cameraDist, 0.0)

        TimerStart(CreateTimer(), 0.001, true, function()
            SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, cameraDist, 0.0)
        end)
    end,

    initialize = function()
        --[[
        Game.setStartingVisibility()
        Game.setStartingResources()
        Game.setStartingHeroLimit()


        Game.setCameraTargetDistance()
        Game.createStartingUnits()
        ]]

        Game.setCameraBounds()
        Game.setAllPlayersAlliance()

        if DEBUG_MODE then
            print("DEBUG_MODE: the Game library has been initialized.")
        end
    end

}

function displayTopMsg(msg)
    local frame = BlzCreateFrameByType("TEXT", "", BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), "", 0)

    BlzFrameSetPoint(frame, FRAMEPOINT_TOP, BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0), FRAMEPOINT_TOP, 0.0, -0.0195)
    BlzFrameSetText(frame, msg)
    BlzFrameSetScale(frame, 2.6)
    BlzFrameSetVisible(frame, true)
end
