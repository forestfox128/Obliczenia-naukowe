#Obliczenia naukowe - lista3 - zadanie1 - 20-11-2018
#author: Barbara Banaszak 236514

#M - maximal number of iterations
M = 100

function functionLin(x)
    return x - 5
end
#function which solves equation using bisecton method 
# f- anonymous function
# a -beginning of the interval
# b - end of the interval
# delta, epsilon - occurancy 
#returns (root, value of function in root, iteration number, error status)
function mbisekcji(f, a::Float64, b::Float64, delta::Float64, epsilon::Float64)
    u = Float64(f(a))
    v = Float64(f(b))
    e = Float64(b-a)
    err = 0

    if (sign(u) == sign(v))
        err = 1
        return (-1,-1,-1,err)
    end

    for k = 1 : M;
        e = Float64(e / 2);
        c = Float64(a + e);
        w = Float64(f(c))

        if abs(e) < delta || abs(w) < epsilon
            return c,w,k,err
        end

        if sign(w) != sign(u)
            b = c
            v = w
        else 
            a = c
            u = w
        end
    end
    return c,w,k,err
end

println( mbisekcji(functionLin,8.0,10.0,(10.0)^(-16), (10.0)^(-16)) )


