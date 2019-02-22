#Obliczenia naukowe - lista4 - zadanie2 - 09-12-2018
#author: Barbara Banaszak 236514

X = Vector{Float64}(5)
X = [-2.0,-1.0,0.0,1.0,2.0,3.0]
fx = Vector{Float64}(5)
fx = [-25.0,28.0,-15.0,5.0,0.0,1.0]

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

println(warNewton(X,fx,-1.0))