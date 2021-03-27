TOC = {

    initialize = function()
        if BlzLoadTOCFile("UI\\FrameDef\\FrameDef.toc") then
            if DEBUG_MODE then
                print("|cFF00FF00DEBUG_MODE|r: the TOC library has been initialized.")
            end
        end
    end

}
