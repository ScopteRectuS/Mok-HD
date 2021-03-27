TOC = {

    initialize = function()
        if BlzLoadTOCFile("UI\\FrameDef\\FrameDef.toc") then
            if DEBUG_MODE then
                print("DEBUG_MODE: the TOC library has been initialized.")
            end
        end
    end

}
