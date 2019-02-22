#Obliczenia naukowe - lista4 - zadanie3 - 09-12-2018
#author: Barbara Banaszak 236514

#function counting natural coeffincient of interpolation polynomial
#input x - array of points, fx - array of difference quotients
#output a - array of natural coefficients
function naturalna(x::Vector{Float64}, fx::Vector{Float64})

    N = length(x)
    a = Vector{Float64}(N)

    a[N] = fx[N]
    for k = N-1 : -1 : 1
        a[k] = fx[k] - [k + 1] * x[k]
        for i = k+1 : N-1
            a[i] = a[i] - a[i + 1] * x[k]
        end
    end

    return a
end

println( naturalna([0.0, 1.0, 2.0], [-3.0, 2.0, 2.0]) )