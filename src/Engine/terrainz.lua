do

    ---@type location
    local loc = Location(MAP_HIDDEN_X, MAP_HIDDEN_Y)

    ---@type function
    ---@param x real
    ---@param y real
    ---@return real
    GetTerrainZ = function(x, y)
        MoveLocation(loc, x, y)

        return GetLocationZ(loc)
    end

end
