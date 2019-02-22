#Obliczenia naukowe - lista4 - zadanie1 - 09-12-2018
#author: Barbara Banaszak 236514

X = [-2.5,-1.5,0.0]
Y = [-5.0,1.0,1.0]

#function counting difference quotient for given x and function value in that X
#input x - array of points f - array of function values in x points
#output fx - array of difference quotients
function ilorazyRoznicowe(x::Vector{Float64}, f::Vector{Float64})
    N = length(x)
    fx = Vector{Float64}(N)
    
    for k = 1 : N;
        fx[k] = f[k]
    end
    for k = 2 : N;
        for i = N : -1 : k
            fx[i] = (fx[i] - fx[i-1]) / (x[i] - x[i - k + 1])
        end
    end
    
    return fx
end

println(ilorazyRoznicowe(X,Y))
