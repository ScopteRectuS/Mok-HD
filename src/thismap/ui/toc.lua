TOC = {

    initialize = function()
        if BlzLoadTOCFile("UI\\FrameDef\\FrameDef.toc") then
            Debug.logMsg("TOC table successfully initialized.")
        else
            Debug.errorMsg("TOC table failed to initialize.")
        end
    end

}
