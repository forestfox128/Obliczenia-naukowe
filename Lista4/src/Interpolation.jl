#Obliczenia naukowe - lista4 - zadanie1-4 - 09-12-2018
#author: Barbara Banaszak 236514

module Interpolation
export ilorazyRoznicowe, warNewton, naturalna, rysujNnfx

# using LaTeXStrings
# using Plots
# plotly()

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

#function counting Newton polynomial interpolation value in point x = t using Horner method
#input x - array of points, fx - array of difference quotients, point t
#output nt - polynomial value in point t
function warNewton(x::Vector{Float64}, fx::Vector{Float64}, t::Float64)

    N = length(x)
    nt = fx[N]

    for k = N-1 : -1 : 1
        nt = fx[k] + (t - x[k])*nt
    end

    return nt
end

#function counting natural coeffincient of interpolation polynomial
#input x - array of points, fx - array of difference quotients
#output a - array of natural coefficients
function naturalna(x::Vector{Float64}, fx::Vector{Float64})

    N = length(x)
    a = Vector{Float64}(N)

    a[N] = fx[N]
    for k = N-1 : -1 : 1
        a[k] = fx[k] - a[k + 1] * x[k]
        for i = k+1 : N-1
            a[i] = a[i] - a[i + 1] * x[k]
        end
    end

    return a
end

#function draws function's interpolation polynomial and the function
#input f - anonymous function, a,b begining and end of the interval, n polynomial degree
# function rysujNnfx(f , a::Float64, b::Float64, n::Int)

#     myTitle = "function: "*string(f)*" n: "*string(n)
#     X = Vector{Float64}(n+1)
#     Y = Vector{Float64}(n+1)
#     fx = Vector{Float64}(n+1)

#     coeff = 15
#     new_X = Vector{Float64}(coeff*(n+1))
#     new_Y = Vector{Float64}(coeff*(n+1))
#     Y_newtona = Vector{Float64}(coeff*(n+1))

#     h = (b-a)/n
#     step = 0

#     for i = 1 : n + 1
#         X[i] = a + step
#         Y[i] = f(X[i])
#         step += h
#     end

#     fx = ilorazyRoznicowe(X,Y)

#     step = 0
#     N = (n+1)*coeff
#     h = (b-a)/(N-1)

#     for i = 1 : N
#         new_X[i] = a + step
#         Y_newtona[i] = warNewton(X,fx, new_X[i])
#         new_Y[i] = f(new_X[i])
#         step += h
#     end

#     plt = plot(new_X,[new_Y,Y_newtona],title=myTitle,label=["f(x)" "w(x)"], lw=2.0)
#     gui(plt)
# end

end