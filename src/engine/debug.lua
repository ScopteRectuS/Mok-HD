Debug = {

    logMsg = function(str)
        if DEBUG_MODE then
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0.0, 0.0, 60.0, "[|cFF0FFF0FLOG|r] :  " .. str)
        end
    end,

    warnMsg = function(str)
        if DEBUG_MODE then
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0.0, 0.0, 60.0, "[|cFFFFFF0FWARN|r] :  " .. str)
        end
    end,

    errorMsg = function(str)
        if DEBUG_MODE then
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0.0, 0.0, 60.0, "[|cFFFF0F0FERROR|r] :  " .. str)
        end
    end

}
