Debug = {

    logMsg = function(str)
        if DEBUG_MODE then
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0.0, 0.0, 60.0, "[|cFFFFFFFFLOG MSG|r] :  " .. str)
        end
    end,

    warnMsg = function(str)
        if DEBUG_MODE then
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0.0, 0.0, 60.0, "[|cFFFF851BWARNING MSG|r] :  " .. str)
        end
    end,

    errorMsg = function(str)
        if DEBUG_MODE then
            DisplayTimedTextToPlayer(GetLocalPlayer(), 0.0, 0.0, 60.0, "[|cFFFF4136ERROR MSG|r] :  " .. str)
        end
    end

}
TimerStart(CreateTimer(),0,false,function()
    Debug.logMsg("asd gar asdf asdf ")
    Debug.warnMsg("asd gar asdf asdf ")
    Debug.errorMsg("asd gar asdf asdf ")
end)