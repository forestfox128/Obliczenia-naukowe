#Obliczenia naukowe - lista1 - zadanie7 - 16.10-2018
#author: Barbara Banaszak 236514

#function counting approximate of derrivative of sin(x) + cos(3*x)
function myDerivative(x,h)
    return (f(x+h) - f(x))/h
end

#function counting value of the sin(x) + cos(3*x)
function f(x)
    return sin(x) + cos(3*x)
end

#function counting exact value of sin(x) + cos(3*x) derrivative
function fder(x)
    return cos(x) - 3*sin(3*x)
end

frealderiv = fder(Float64(1.0))
println("Derr: ",frealderiv)
for i = 1 : 54
    h = Float64(2.0) ^ (-i)
    println(i)
    dx = myDerivative(Float64(1.0),h)
    println(dx)
    println("Er: ", abs(frealderiv - dx))
    println("h+1: ", (h+1))
end