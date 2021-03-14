Camera = {

    initializeBounds = function()
        local marginX = 1024.0 + 512.0         
        local marginY = 1024.0 + 256.0

        local maxX = GetRectMaxX(GetWorldRect())
        local minX = GetRectMinX(GetWorldRect())
        local maxY = GetRectMaxY(GetWorldRect())
        local minY = GetRectMinY(GetWorldRect())

        SetCameraBounds(
                minX + marginX,
                minY + marginY,
                maxX - marginX,
                maxY - marginY,
                minX + marginX,
                maxY - marginY,
                maxX - marginX,
                minY + marginY
       )
    end,
     
    initializeTargetDistance = function()
        local cameraDist = 1785.0
             
        SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, cameraDist, 0.0)
    
        TimerStart(CreateTimer(), 0.001, true, function ()
            SetCameraField(CAMERA_FIELD_TARGET_DISTANCE, cameraDist, 0.0)
        end)
    end,

    initialize = function()
        Camera.initializeBounds()
        Camera.initializeTargetDistance()
            
        if DEBUG_MODE then
            print('DEBUG_MODE: The Camera library has been initialized.')
        end
    end

}

