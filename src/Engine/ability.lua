-----------------------------------------------------------------------------
--                                                                         --
-- A B I L I T Y :                                                         --
--                                                                         --
--   Warcraft III lua Script                                               --
--   Date: 2020-02-06                                                      --
--   Script Author: ScopteRectuS                                           --
--                                                                         --
-----------------------------------------------------------------------------

do
    Ability = { }

    function Ability.initialize( )
        local trig = CreateTrigger( )

        for _, value in pairs( Ability ) do
            if type( value ) == 'table' then
                if value.onInit and type( value.onInit ) == 'function' then
                    value:onInit( )
                end
            end
        end

        TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_HERO_SKILL )
        TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_CAST )
        TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_EFFECT )
        TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_ENDCAST )
        TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_CHANNEL )
        TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_SPELL_FINISH )

        TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_DAMAGING )
        TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_UNIT_DAMAGED )

        TriggerAddAction( trig, function( )
            local id = GetTriggerEventId( )

            if id == EVENT_PLAYER_HERO_SKILL then
                for _, value in pairs( Ability ) do
                    if type( value ) == 'table' then
                        if value.id and value.id == GetLearnedSkill( ) then
                            if value.onLearn and type( value.onLearn ) == 'function' then
                                value:onLearn( )
                            end
                        end
                    end
                end

            elseif id == EVENT_PLAYER_UNIT_SPELL_CAST then
                for _, value in pairs( Ability ) do
                    if type( value ) == 'table' then
                        if value.id and value.id == GetSpellAbilityId( ) then
                            if value.onCast and type( value.onCast ) == 'function' then
                                value:onCast( )
                            end
                        end
                    end
                end

            elseif id == EVENT_PLAYER_UNIT_SPELL_EFFECT then
                for _, value in pairs( Ability ) do
                    if type( value ) == 'table' then
                        if value.id and value.id == GetSpellAbilityId( ) then
                            if value.onEffect and type( value.onEffect ) == 'function' then
                                value:onEffect( )
                            end
                        end
                    end
                end

            elseif id ==EVENT_PLAYER_UNIT_SPELL_ENDCAST then
                for _, value in pairs( Ability ) do
                    if type( value ) == 'table' then
                        if value.id and value.id == GetSpellAbilityId( ) then
                            if value.onEndcast and type( value.onEndcast ) == 'function' then
                                value:onEndcast( )
                            end
                        end
                    end
                end

            elseif id == EVENT_PLAYER_UNIT_SPELL_CHANNEL then
                for _, value in pairs( Ability ) do
                    if type( value ) == 'table' then
                        if value.id and value.id == GetSpellAbilityId( ) then
                            if value.onChannel and type( value.onChannel ) == 'function' then
                                value:onChannel( )
                            end
                        end
                    end
                end

            elseif id == EVENT_PLAYER_UNIT_SPELL_FINISH then
                for _, value in pairs( Ability ) do
                    if type( value ) == 'table' then
                        if value.id and value.id == GetSpellAbilityId( ) then
                            if value.onFinish and type( value.onFinish ) == 'function' then
                                value:onFinish( )
                            end
                        end
                    end
                end

            elseif id == EVENT_PLAYER_UNIT_DAMAGING then
                for _, value in pairs( Ability ) do
                    if type( value ) == 'table' then
                        if value.onDamaging and type( value.onDamaging ) == 'function' then
                            value:onDamaging( )
                        end
                    end
                end

            elseif id == EVENT_PLAYER_UNIT_DAMAGED then
                for _, value in pairs( Ability ) do
                    if type( value ) == 'table' then
                        if value.onDamaged and type( value.onDamaged ) == 'function' then
                            value:onDamaged( )
                        end
                    end
                end
            end
        end )

        if DEBUG_MODE then
            print( 'DEBUG_MODE: the Ability library has been initialized.')
        end
    end

end
