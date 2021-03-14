do
    PowerUp = { }

    function PowerUp.initialize()
        local circle = { }
        local item   = { }
        local trig   = CreateTrigger()

        table.insert(circle, AddSpecialEffect('Abilities\\Spells\\NightElf\\Starfall\\StarfallCaster.mdl', 4736.0, -8320.0))
        table.insert(circle, AddSpecialEffect('Abilities\\Spells\\NightElf\\Starfall\\StarfallCaster.mdl', 7296.0, -5760.0))

        for _, value in pairs(circle) do
            CreateUnit(Player(22), FourCC('n005'), BlzGetLocalSpecialEffectX(value), BlzGetLocalSpecialEffectY(value), bj_UNIT_FACING)
        end

        table.insert(item, FourCC('manh'))
        table.insert(item, FourCC('tdx2'))
        table.insert(item, FourCC('texp'))
        table.insert(item, FourCC('tin2'))
        table.insert(item, FourCC('tpow'))
        table.insert(item, FourCC('tst2'))

        for _, value in pairs(Team.defensiveForce) do
            TriggerRegisterPlayerUnitEvent(trig, value, EVENT_PLAYER_UNIT_PICKUP_ITEM, nil)
        end

        TriggerAddAction(trig, function()
            local it = GetManipulatedItem()
            local id = GetItemTypeId(it)

            for _, value in pairs(item) do
                if id == value then
                    RemoveItem(it)
                    break
                end
            end
        end)

        TimerStart(CreateTimer(), 60.0, true, function()
            for _, value in pairs(circle) do
                local x = BlzGetLocalSpecialEffectX(value)
                local y = BlzGetLocalSpecialEffectY(value)
                local r = Rect(x - 32.0, y - 32.0, x + 32.0, y + 32.0)
                local i = 0

                EnumItemsInRect(r, nil, function()
                    for _, value in pairs(item) do
                        if GetItemTypeId(GetEnumItem()) == value then
                            i = i + 1
                        end
                    end
                end)

                if i == 0 then
                    SetItemInvulnerable(CreateItem(item[GetRandomInt(1, #item)], x, y), true)
                end

                RemoveRect(r)
            end
        end)
    end

end

TimerStart(CreateTimer(), 0.0, false, PowerUp.initialize)
