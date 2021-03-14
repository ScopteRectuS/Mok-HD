

    S2FourCC = function(value)
        return string.unpack(">I4", id)
    end

    FourCC2S = function(value)
        return string.pack(">I4", id)
    end

do
    local worldRect   = nil
    local worldRegion = nil

    function GetWorldRect( )
        if worldRect == nil then
            worldRect = GetWorldBounds( )
        end
        return worldRect
    end

    function GetWorldRegion( )
        if worldRegion == nil then
            worldRegion = CreateRegion( )
            RegionAddRect( worldRegion, GetWorldRect( ) )
        end
        return worldRegion
    end
end

function GetParabolaZ( maxHeight, maxRange, currentRange )
    return ( 4 * maxHeight / maxRange ) * ( maxRange - currentRange ) * ( currentRange / maxRange )
end

do
    local tempGroup   = CreateGroup( )

    function RestoreDestructable( whichDestructable )
        local curLife = GetWidgetLife( whichDestructable )
        local maxLife = GetDestructableMaxLife( whichDestructable )

        if curLife <= 0.0 then
            GroupClear( tempGroup )
            GroupEnumUnitsInRange( tempGroup, GetDestructableX( whichDestructable ), GetDestructableY( whichDestructable ), 256.0, nil )
            if BlzGroupGetSize( tempGroup ) == 0 then
                DestructableRestoreLife( whichDestructable, maxLife, false )
            end
        elseif curLife < maxLife and curLife > 0.0 then
            DestructableRestoreLife( whichDestructable, maxLife, false )
        end
    end

    function RestoreAllDestructables( )
        EnumDestructablesInRect( GetWorldRect( ), nil, function( )
            RestoreDestructable( GetEnumDestructable( ) )
        end )
    end
end

function UnitRestoreLife( source, target, amount )
    local curLife = GetUnitState( target, UNIT_STATE_LIFE )
    local newLife = curLife + amount

    SetUnitState( target, UNIT_STATE_LIFE, newLife )
end

function UnitRestoreMana( source, target, amount )
    local curMana = GetUnitState( target, UNIT_STATE_MANA )
    local newMana = curMana + amount

    SetUnitState( target, UNIT_STATE_MANA, newMana )
end
