#Obliczenia naukowe - lista3 - zadanie2 - 20-11-2018
#author: Barbara Banaszak 236514

module RootFindMethod
export mycoolfunction, mbisekcji, mstycznych, msiecznych


function mycoolfunction()
    println("this is my cool function")
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
    c  = a
    w = 0
    k = 1

    if (sign(u) == sign(v))
        err = 1
        return (-1,-1,-1,err)
    end

    for k = 1 : 20;
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

#function finding root using Newton metchod
#f- anonymous function
#fp - derrivative of function finding
#x0 - 
#delta, epsilon - occurancy
#maxInt - maximal number of Iteration
#returns (root, value of function in root, iteration number, error status)
#error status 0,1,2
function mstycznych(f,pf,x0::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    x1 = 0.0
    k = 1.0
    v = Float64(f(x0))
    err = 0

    #pochodna bliska zeru??
    if (abs(v) < epsilon)
        return x0,v,0,0
    end

    for k = 1 : maxit;
        if (abs(pf(x0)) < epsilon)
            return x0,v,k,2
        end
        x1 = Float64(x0 -Float64( v/ pf(x0)))
        v = f(x1)

        if (abs(x1 - x0) < delta || abs(v) < epsilon)
            return x1,v,k,err
        end

        x0 = x1
    end
    err = 1
    return x1,v,k,err
end

# Funkcja "swap" changes x and y
function swap(x::Float64, y::Float64)
    temp = x
    x = y
    y = temp
end

#function finding root using secants metchod
#f- anonymous function
#x0, x1 - beggining values
#delta, epsilon - occurancy
#maxInt - maximal number of Iteration
#returns (root, value of function in root, iteration number, error status)
#error status 0,1
function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)
    k = 0
    fa = f(x0)
    fb = f(x1)

    for k = 1 : maxit;
        if ( abs(fa) > abs(fb) )
            swap(x0,x1)
            swap(fa,fb)
        end

        s = Float64(Float64(x1 - x0)/Float64(fb - fa))
        x1 = x0
        fb = fa
        x0 = Float64(x0 - Float64(fa * s))
        fa = f(x0)
        
        if ( abs(fa) < epsilon || abs(x1 - x0) < delta)
            return x0, fa, k,0
        end
    end
    return x0,fa,k,1
end

end
