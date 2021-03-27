PlayerColor = {

    getPlayerColoredString = function(index, str)
        local color = {
            [ 0] = "|cFFFF0303" .. str .. "|r",
            [ 1] = "|cFF0042FF" .. str .. "|r",
            [ 2] = "|cFF1CE6B9" .. str .. "|r",
            [ 3] = "|cFF540081" .. str .. "|r",
            [ 4] = "|cFFFFFF01" .. str .. "|r",
            [ 5] = "|cFFFE8A0E" .. str .. "|r",
            [ 6] = "|cFF20C000" .. str .. "|r",
            [ 7] = "|cFFE55BB0" .. str .. "|r",
            [ 8] = "|cFF959697" .. str .. "|r",
            [ 9] = "|cFF7EBFF1" .. str .. "|r",
            [10] = "|cFF106246" .. str .. "|r",
            [11] = "|cFF4E2A04" .. str .. "|r",
            [12] = "|cFF9B0000" .. str .. "|r",
            [13] = "|cFF0000C3" .. str .. "|r",
            [14] = "|cFF00EAFF" .. str .. "|r",
            [15] = "|cFFBE00FE" .. str .. "|r",
            [16] = "|cFFEBCD87" .. str .. "|r",
            [17] = "|cFFF8A48B" .. str .. "|r",
            [18] = "|cFFBFFF80" .. str .. "|r",
            [19] = "|cFFDCB9EB" .. str .. "|r",
            [20] = "|cFF282828" .. str .. "|r",
            [21] = "|cFFEBF0FF" .. str .. "|r",
            [22] = "|cFF00781E" .. str .. "|r",
            [23] = "|cFFA46F33" .. str .. "|r"
        }

        return color[index]
    end

}
