function putmarker_at_border_and_back!(robot::Robot, side::HorizonSide, n_steps::Int = 0)#двигает робота до перегородки, ставит маркер и возвращает в исходную точку
    if !isborder(r, side)
        move!(r, side)
        n_steps += 1
        putmarker_at_border_and_back!(r, side, n_steps)
    else
        putmarker!(r)
        along!(robot, inverse_side(side), n_steps)
    end
end

function inverse_side(side::HorizonSide)::HorizonSide #инверсирование сторон света
    inv_side = HorizonSide((Int(side) + 2) % 4)
    return inv_side
end

function along!(robot, side, num_steps)#движение до упора
    n_steps = 0
    while !isborder(robot, side) && n_steps < num_steps
        move!(robot, side)
        n_steps += 1
    end
end

r = Robot("pole.sit", animate=true)
putmarker_at_border_and_back!(r, Nord)
