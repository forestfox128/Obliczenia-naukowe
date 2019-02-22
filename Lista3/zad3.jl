#Obliczenia naukowe - lista3 - zadanie3 - 20-11-2018
#author: Barbara Banaszak 236514

function functionLin(x)
    return x^3 - sinh(x) + 4*x^2 + 6*x + 9 
end

#function finding root using secants metchod
#f- anonymous function
#x0, x1 - beggining values
#delta, epsilon - occurancy
#maxInt - maximal number of Iteration
#returns (root, value of function in root, iteration number, error status)
#error status 0,1
function msiecznych(f, x0::Float64, x1::Float64, delta::Float64, epsilon::Float64, maxit::Int)

    fa = f(x0)
    fb = f(x1)

    for k = 2 : maxit;
        if ( abs(fa) > abs(fb) )
            temp = x0; x0 = x1; x1 = temp
            temp = fa; fa = fb; fb = temp
        end

        s = (x1 - x0)/(fb - fa)
        x1 = x0
        fb = fa
        x0 = x0 - fa * s
        fa = f(x0)
        
        if ( abs(fa) < epsilon || abs(x1 - x0) < delta)
            return x0, fa, k,0
        end
    end
    return x0,fa,k,1
end

println(msiecznych(functionLin,7.0,8.0,(10.0)^(-24), (10.0)^(-24),20))