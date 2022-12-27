#а
function get_fibbonachi(n::Int)::Int #возвращение n-ного члена последовательности без рекурсии
    if n == 1 || n == 2
        return 1
    end

    a = 1
    b = 1
    for i in 3:n
        tmp = a + b
        a, b = b, tmp
    end

    return b
end

#б

function get_fibbonachi_rec(n::Int)::Int #c рекурсией
    if n == 1 || n == 2
        return 1
    end

    return get_fibbonachi_rec(n-1) + get_fibbonachi_rec(n - 2)
end
