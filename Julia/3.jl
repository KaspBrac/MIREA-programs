using HorizonSideRobots
function mark_evr(robot) 
    tW = 0 
    tS = 0
    for side in (Sud, West)
        while !isborder(robot, side)
            move!(robot, side)
            if side == Sud
                tS += 1
            else
                tW += 1
            end
        end
    end
    putmarker!(robot)        
    side = Ost # - начальное направление движения "змейкой"
    while !isborder(robot, side)
        move!(robot, side)
        putmarker!(robot)
    end    
    while !isborder(robot,Nord)
        move!(robot, Nord)
        putmarker!(robot)
        if side == Ost
            side = West
        else
            side = Ost
        end
        while !isborder(robot, side)
            move!(robot, side)
            putmarker!(robot)
        end
    end
    #УТВ: робот - где-то у северной границы поля
    while !isborder(robot, Sud)
        move!(robot,Sud)
    end
    while !isborder(robot, West)
        move!(robot, West)
    end
#блок который вернет робота на место   
    for _ in 1:tW
        move!(robot, Ost)
    end
    for _ in 1:tS
        move!(robot, Nord)
    end
end
mark_evr(Robot("pole1.sit", animate=true))