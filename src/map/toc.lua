TOC = {

    initialize = function()
        if BlzLoadTOCFile("war3mapImported\\FrameDefTemplates.toc") then
            if DEBUG_MODE then
                print("DEBUG_MODE: the TOC library has been initialized.")
            end
        end
    end

}
