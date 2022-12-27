
function move_recursive!(r::Robot, side::HorizonSide)#перемещение робота до упора рекурсивно 
    if !isborder(r, side)
        move!(r, side)
        move_recursive!(r, side)
    end
end

r = Robot("pole.sit", animate=true)
move_recursive!(r, Nord)
