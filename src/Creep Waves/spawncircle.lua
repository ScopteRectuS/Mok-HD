do
    SpawnCircle      = { }

    local campGround = { }
    local campAir    = { }
    local campWater  = { }

    local red        = { }
    local green      = { }
    local blue       = { }

    function SpawnCircle.getGroundCamp()
        return campGround
    end

    function SpawnCircle.getAirCamp()
        return campAir
    end

    function SpawnCircle.getWaterCamp()
        return campWater
    end

    function SpawnCircle.getRandom(whichTable)
        local camp = whichTable[math.random(1, #whichTable)]

        return camp[math.random(1, #camp)]
    end

    function SpawnCircle.pingMinimap(whichTable)
        for _, camp in pairs(whichTable) do
            for _, circle in pairs(camp) do
                local id = GetPlayerId(GetOwningPlayer(circle))

                PingMinimapEx(GetUnitX(circle), GetUnitY(circle), 12.0, red[id], green[id], blue[id], false)
            end
        end
    end

    function SpawnCircle.create(forPlayer, x, y)
        local circle = CreateUnit(forPlayer, FourCC('n005'), x, y, 270.0)
        --  local icon    = CreateMinimapIcon(x, y, 0xFF, 0xFF, 0xFF, 'UI\\Minimap\\MinimapIconCircleOfPower.mdl', true)

        UnitSetUsesAltIcon(circle, true)

        for _, player in pairs(Team.defensiveForce) do
            UnitShareVision(circle, player, true)
        end

        return circle
    end

    function SpawnCircle.initialize()
        SetAltMinimapIcon('UI\\Minimap\\MinimapIconCircleOfPower.dds')

        red[0x00]   = 0xFF;
        green[0x00] = 0x03;
        blue[0x00]  = 0x03;
        red[0x01]   = 0x00;
        green[0x01] = 0x42;
        blue[0x01]  = 0xFF;
        red[0x02]   = 0x1C;
        green[0x02] = 0xE6;
        blue[0x02]  = 0xB9;
        red[0x03]   = 0x54;
        green[0x03] = 0x00;
        blue[0x03]  = 0x81;

        red[0x04]   = 0xFF;
        green[0x04] = 0xFF;
        blue[0x04]  = 0x01;
        red[0x05]   = 0xFE;
        green[0x05] = 0x8A;
        blue[0x05]  = 0x0E;
        red[0x06]   = 0x20;
        green[0x06] = 0xC0;
        blue[0x06]  = 0x00;
        red[0x07]   = 0xE5;
        green[0x07] = 0x5B;
        blue[0x07]  = 0xB0;

        red[0x08]   = 0x95;
        green[0x08] = 0x96;
        blue[0x08]  = 0x97;
        red[0x09]   = 0x7E;
        green[0x09] = 0xBF;
        blue[0x09]  = 0xF1;
        red[0x0A]   = 0x10;
        green[0x0A] = 0x62;
        blue[0x0A]  = 0x46;
        red[0x0B]   = 0x4E;
        green[0x0B] = 0x2A;
        blue[0x0B]  = 0x04;

        table.insert(campGround, SpawnCircle.create(Player(0x00), 2944.0, -1664.0)) -- Red Color Player
        table.insert(campGround, SpawnCircle.create(Player(0x01), 640.0, -3968.0)) -- Blue Color Player
        table.insert(campGround, SpawnCircle.create(Player(0x02), 7168.0, -1024.0)) -- Teal Color Player
        table.insert(campGround, SpawnCircle.create(Player(0x03), 0.0, -8192.0)) -- Purple Color Player

        table.insert(campWater, SpawnCircle.create(Player(0x04), 5888.0, 1280.0)) -- Yellow Color Player
        table.insert(campWater, SpawnCircle.create(Player(0x05), -2304.0, -6912.0)) -- Orange Color Player
        table.insert(campWater, SpawnCircle.create(Player(0x06), 9472.0, -6400.0)) -- Green Color Player
        table.insert(campWater, SpawnCircle.create(Player(0x07), 5376.0, -10496.0)) -- Pink Color Player

        table.insert(campAir, SpawnCircle.create(Player(0x08), 8448.0, -9472.0)) -- Gray Color Player
        table.insert(campAir, SpawnCircle.create(Player(0x09), 0.0, -1024.0)) -- Light Blue Color Player
        table.insert(campAir, SpawnCircle.create(Player(0x0A), 10752.0, 2560.0)) -- Dark Green Player
        table.insert(campAir, SpawnCircle.create(Player(0x0B), -3584.0, -11776.0)) -- Brown Color Player

        if DEBUG_MODE then
            print('DEBUG_MODE: the SpawnCircle library has been initialized.')
        end
    end

end
