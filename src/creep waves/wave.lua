do
    Wave = { }

    local round = 1
    local name = { }
    local stylizedName = { }
    local tip = { }
    local prepare = { }
    local count = { }
    local limit = { }
    local spawnCamp = { }
    local startSound = { }
    local endSound = { }
    local pool = { }

    local tickSound = nil
    local hintSound = nil
    local timer = nil
    local timerWindow = nil

    function Wave.displayTopMsg()
        local gameui = BlzGetOriginFrame(ORIGIN_FRAME_GAME_UI, 0)
        local frame = BlzCreateFrameByType('TEXT', '', gameui, '', 0)
        local alpha = 0xFF

        BlzFrameSetPoint(frame, FRAMEPOINT_TOP, gameui, FRAMEPOINT_TOP, 0.0, -0.0195)
        BlzFrameSetVisible(frame, true)
        BlzFrameSetScale(frame, 2.6)

        if pool[round + 1] ~= nil then
            BlzFrameSetText(frame, '|cFFFFFF00Р А У Н Д   ' .. tostring(round) .. ' :|r   ' .. tostring(stylizedName[round]))
        elseif pool[round + 1] == nil then
            BlzFrameSetText(frame, '|cFFFFFF00Ф И Н А Л Ь Н Ы Й   Р А У Н Д :|r   ' .. tostring(stylizedName[round]))
        end

        TimerStart(CreateTimer(), 10.0, false, function()
            TimerStart(GetExpiredTimer(), 0.03125, true, function()
                alpha = alpha - 0x04

                if alpha > 0x00 then
                    BlzFrameSetAlpha(frame, alpha)
                else
                    PauseTimer(GetExpiredTimer())
                    DestroyTimer(GetExpiredTimer())
                    BlzDestroyFrame(frame)
                end
            end)
        end)
    end

    function Wave.displayTip()
        if tip[round] ~= '' then
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0.0, 0.0, bj_TEXT_DELAY_ALWAYSHINT, ' ')
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0.0, 0.0, bj_TEXT_DELAY_ALWAYSHINT, '|cFF32CD32HINT|r - ' .. tip[round])
            StartSound(hintSound)
        end
    end

    function Wave.getCount()
        local n = 0

        for _, value in pairs(Team.offensiveForce) do
            n = n + GetPlayerState(value, PLAYER_STATE_RESOURCE_FOOD_USED)
        end

        return n
    end

    function Wave.playSound(soundHandle)
        if soundHandle ~= nil then
            StartSound(soundHandle)
        end
    end

    function Wave.endRound()
        round = round + 1

        if pool[round] ~= nil then
            Wave.playSound(endSound[round])
            Wave.startSpawnTimeout()
            --  Scoreboard.show(true)
            PowerUp.create()
        else
            Game.startVictory()
            Scoreboard.show(true)
        end
    end

    function Wave.startRound()
        TimerDialogDisplay(timerWindow, false)

        SpawnCircle.pingMinimap(spawnCamp[round])
        Wave.displayTopMsg()
        Wave.displayTip()
        Wave.playSound(startSound[round])
        Wave.startSpawn()
        --  Scoreboard.show(false)
        PowerUp.create()
    end

    function Wave.startSpawn()
        if count[round] > 0 then
            TimerStart(timer, 0.75, false, Wave.startSpawn)
            for i = 0, 3 do
                if Wave.getCount() > limit[round] or count[round] == 0 then
                    break
                end

                local circle = SpawnCircle.getRandom(spawnCamp[round])
                local owner = GetOwningPlayer(circle)
                local x = GetUnitX(circle) + GetRandomReal(-16.0, 16.0)
                local y = GetUnitY(circle) + GetRandomReal(-16.0, 16.0)
                local unit = PlaceRandomUnit(pool[round], owner, x, y, 0.0)

                for _, value in pairs(Team.defensiveForce) do
                    UnitShareVision(unit, value, true)
                end

                IssuePointOrderById(unit, OrderId('attack'), 4096.0, -5120.0)
                SetUnitColor(unit, PLAYER_COLOR_COAL)
                --  DestroyEffect(AddSpecialEffectTarget('Abilities\\Spells\\Human\\MassTeleport\\MassTeleportCaster.mdl', unit, 'origin'))

                count[round] = count[round] - 1
            end

        elseif count[round] == 0 and Wave.getCount() > 0 then
            TimerStart(timer, 2.75, false, Wave.startSpawn)

        elseif count[round] == 0 and Wave.getCount() == 0 then
            Wave.endRound()
        end
    end

    function Wave.startSpawnTimeout()
        if timer == nil then
            timer = CreateTimer()
            timerWindow = CreateTimerDialog(timer)

            TimerDialogSetTitleColor(timerWindow, 0xFF, 0xFF, 0xFF, 0xFF)
            TimerDialogSetTimeColor(timerWindow, 0xFF, 0xFF, 0xFF, 0xFF)
        end

        if pool[round - 1] == nil then
            TimerDialogSetTitle(timerWindow, 'Первая волна:')
        elseif pool[round + 1] == nil then
            TimerDialogSetTitle(timerWindow, 'Последняя волна:')
        else
            TimerDialogSetTitle(timerWindow, 'Следующая волна:')
        end

        TimerDialogDisplay(timerWindow, true)
        TimerStart(timer, prepare[round], false, Wave.startRound)

        if prepare[round] >= 3.0 then
            TimerStart(CreateTimer(), prepare[round] - 3.0, false, function()
                StartSound(tickSound)
                TimerStart(GetExpiredTimer(), 1.0, false, function()
                    StartSound(tickSound)
                    TimerStart(GetExpiredTimer(), 1.0, false, function()
                        StartSound(tickSound)
                        PauseTimer(GetExpiredTimer())
                        DestroyTimer(GetExpiredTimer())
                    end)
                end)
            end)
        end
    end

    function Wave.initialize()
        tickSound = CreateSound('Sound\\Interface\\BattleNetTick.wav', false, false, false, 10, 10, 'DefaultEAXON')
        hintSound = CreateSoundFromLabel('Hint', false, false, false, 10000, 10000)

        for _, offensivePlayer in pairs(Team.offensiveForce) do
            for _, defensivePlayer in pairs(Team.defensiveForce) do
                --  SetPlayerAlliance(offensivePlayer, defensivePlayer, ALLIANCE_SHARED_VISION, true)
                --  SetPlayerAlliance(defensivePlayer, offensivePlayer, ALLIANCE_SHARED_VISION, true)
            end
        end

        local trig = CreateTrigger()
        for _, value in pairs(Team.offensiveForce) do
            TriggerRegisterPlayerUnitEvent(trig, value, EVENT_PLAYER_UNIT_SPELL_ENDCAST, nil)
        end
        TriggerAddAction(trig, function()
            IssuePointOrderById(GetSpellAbilityUnit(), OrderId('attack'), 4096.0, -5120.0)
        end)

        TimerStart(CreateTimer(), 0.0, false, function()
            DestroyTimer(GetExpiredTimer())
            Wave.startSpawnTimeout()
        end)

        local data = { }

        for _, value in pairs(Creep) do
            if type(value) == "table" and value.initialize ~= nil then
                value:initialize()
            end
        end

        for _, value in pairs(Creep) do
            if type(value) == "table" and value.round ~= nil then
                if data[value.round] == nil then
                    data[value.round] = { }
                end

                table.insert(data[value.round], value)
            end
        end

        for key, value in pairs(data) do
            local i = math.random(1, #value)

            name[key] = value[i].name
            stylizedName[key] = value[i].stylizedName
            tip[key] = value[i].tip
            prepare[key] = value[i].prepare
            count[key] = value[i].count
            limit[key] = value[i].limit
            spawnCamp[key] = value[i].spawnCamp
            startSound[key] = value[i].startSound
            endSound[key] = value[i].endSound
            pool[key] = value[i].pool

            --  print('Round ' .. key .. ': ' .. name[ key ])
        end

        if DEBUG_MODE then
            print('DEBUG_MODE: the Wave library has been initialized.')
        end
    end

end
