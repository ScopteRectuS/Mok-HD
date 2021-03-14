FloatingTextTag = {

    ---@type function
    ---@param forPlayer player
    ---@param whichUnit unit
    ---@param value string
    ---@return nothing
    gold = function(forPlayer, whichUnit, value)
        if GetLocalPlayer() == forPlayer then
            local tt = CreateTextTag()

            SetTextTagText(tt, value, 0.023)
            SetTextTagPosUnit(tt, whichUnit, 0.0)
            SetTextTagColor(tt, 255, 220, 0, 255)
            SetTextTagVisibility(tt, true)
            SetTextTagPermanent(tt, false)
            SetTextTagVelocity(tt, 0.0, 0.029)
            SetTextTagLifespan(tt, 2.0)
            SetTextTagFadepoint(tt, 1.0)
        end
    end,

    lumber = function(forPlayer, whichUnit, value)
        if GetLocalPlayer() == forPlayer then
            local tt = CreateTextTag()

            SetTextTagText(tt, value, 0.023)
            SetTextTagPosUnit(tt, whichUnit, 0.0)
            SetTextTagColor(tt, 0, 200, 80, 255)
            SetTextTagVisibility(tt, true)
            SetTextTagPermanent(tt, false)
            SetTextTagVelocity(tt, 0.0, 0.029)
            SetTextTagLifespan(tt, 2.0)
            SetTextTagFadepoint(tt, 1.0)
        end
    end,

    miss = function(whichUnit, value)
        local tt = CreateTextTag()

        SetTextTagText(tt, value, 0.023)
        SetTextTagPosUnit(tt, whichUnit, 0.0)
        SetTextTagColor(tt, 255, 0, 0, 255)
        SetTextTagVisibility(tt, true)
        SetTextTagPermanent(tt, false)
        SetTextTagVelocity(tt, 0.0, 0.03993)
        SetTextTagLifespan(tt, 3.0)
        SetTextTagFadepoint(tt, 1.0)
    end,

    criticalstrike = function(whichUnit, value)
        local tt = CreateTextTag()

        SetTextTagText(tt, value, 0.023)
        SetTextTagPosUnit(tt, whichUnit, 0.0)
        SetTextTagColor(tt, 255, 0, 0, 255)
        SetTextTagVisibility(tt, true)
        SetTextTagPermanent(tt, false)
        SetTextTagVelocity(tt, 0.0, 0.03993)
        SetTextTagLifespan(tt, 5.0)
        SetTextTagFadepoint(tt, 2.0)
    end,

    shadowstrike = function(whichUnit, value)
        local tt = CreateTextTag()

        SetTextTagText(tt, value, 0.023)
        SetTextTagPosUnit(tt, whichUnit, 0.0)
        SetTextTagColor(tt, 158, 255, 0, 255)
        SetTextTagVisibility(tt, true)
        SetTextTagPermanent(tt, false)
        SetTextTagVelocity(tt, 0.0, 0.03993)
        SetTextTagLifespan(tt, 5.0)
        SetTextTagFadepoint(tt, 2.0)
    end,

    manaburn = function(whichUnit, value)
        local tt = CreateTextTag()

        SetTextTagText(tt, value, 0.023)
        SetTextTagPosUnit(tt, whichUnit, 0.0)
        SetTextTagColor(tt, 81, 81, 255, 255)
        SetTextTagVisibility(tt, true)
        SetTextTagPermanent(tt, false)
        SetTextTagVelocity(tt, 0.0, 0.03993)
        SetTextTagLifespan(tt, 5.0)
        SetTextTagFadepoint(tt, 2.0)
    end

}

