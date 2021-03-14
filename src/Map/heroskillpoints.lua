-----------------------------------------------------------------------------
--                                                                         --
-- S K I L L   P O I N T S :                                               --
--                                                                         --
--   Warcraft III lua script                                               --
--   Date: 2020-01-26                                                      --
--   Script Author: ScopteRectuS                                           --
--                                                                         --
-----------------------------------------------------------------------------

do
    SkillPoints = { }

    function SkillPoints.initialize( )
        local trig = CreateTrigger( )

        TriggerRegisterAnyUnitEventBJ( trig, EVENT_PLAYER_HERO_LEVEL )
        TriggerAddAction( trig, function( )
            local hero  = GetLevelingUnit( )
            local level = GetHeroLevel( hero )

            if     level ==  1 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level ==  2 then UnitModifySkillPoints( hero,  0 ) -- 1
            elseif level ==  3 then UnitModifySkillPoints( hero,  0 ) -- 1
            elseif level ==  4 then UnitModifySkillPoints( hero,  1 ) -- 2
            elseif level ==  5 then UnitModifySkillPoints( hero,  0 ) -- 1
            elseif level ==  6 then UnitModifySkillPoints( hero,  2 ) -- 3
            elseif level ==  7 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level ==  8 then UnitModifySkillPoints( hero,  1 )
            elseif level ==  9 then UnitModifySkillPoints( hero,  0 )
            elseif level == 10 then UnitModifySkillPoints( hero,  0 )
            elseif level == 11 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level == 12 then UnitModifySkillPoints( hero,  2 )
            elseif level == 13 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level == 14 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level == 15 then UnitModifySkillPoints( hero,  0 )
            elseif level == 16 then UnitModifySkillPoints( hero,  0 )
            elseif level == 17 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level == 18 then UnitModifySkillPoints( hero,  0 )
            elseif level == 19 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level == 20 then UnitModifySkillPoints( hero,  0 )
            elseif level == 21 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level == 22 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level == 23 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level == 24 then UnitModifySkillPoints( hero,  0 )
            elseif level == 25 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level == 26 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level == 27 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level == 28 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level == 29 then UnitModifySkillPoints( hero, -1 ) -- empty
            elseif level == 30 then UnitModifySkillPoints( hero,  0 )
            end
        end )
    end

end
