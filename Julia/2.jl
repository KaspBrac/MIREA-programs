function mark_perimetr!(r::Robot)#задача 2
    steps_ld = [0, 0] # (шаги_вниз, шаги_влево)
    steps_ld[1] = move_until_border!(r, Sud)
    steps_ld[2] = move_until_border!(r, West)
    for side in (Nord, Ost, Sud, West)
        putmarkers_until_border!(r, side)
    end
    moves!(r, Ost, steps_ld[2])
    moves!(r, Nord, steps_ld[1])
end

function move_until_border!(r::Robot, side::HorizonSide)::Int
    n_steps = 0
    while !isborder(r, side)
        n_steps += 1
        move!(r, side)
    end
    return n_steps
end

function putmarkers_until_border!(r::Robot, side::HorizonSide)::Int
    n_steps = 0
    while !isborder(r, side) 
        move!(r, side)
        putmarker!(r)
        n_steps += 1
    end 
    return n_steps
end

r=Robot("pole69.sit"; animate=true)

mark_perimetr!(r)
Footer

