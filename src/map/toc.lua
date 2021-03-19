TOC = {

    initialize = function()
        if BlzLoadTOCFile("war3mapImported\\FrameDef.toc") then
            if DEBUG_MODE then
                print("DEBUG_MODE: the TOC library has been initialized.")
            end
        end
    end

}
