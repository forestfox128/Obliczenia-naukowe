#Obliczenia naukowe - lista3 - zadanie2 - 20-11-2018
#author: Barbara Banaszak 236514


function functionLin(x)
    return x^2 - 2*x
end

function derrivative(x)
    return 2*x - 2
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
    v = f(x0)
    err = 0

    #pochodna bliska zeru??
    if (abs(v) < epsilon)
        return
    end

    for k = 1 : maxit;
        if (abs(pf(x0)) < epsilon)
            return x0,v,k,2
        end
        x1 = x0 - v/ pf(x0)
        v = f(x1)

        if (abs(x1 - x0) < delta || abs(v) < epsilon)
            return x1,v,k,err
        end

        x0 = x1
    end
    err = 1
    return x1,v,k,err
end

println(mstycznych(functionLin,derrivative,5.0,(10.0)^(-16), (10.0)^(-16),20))