#Obliczenia naukowe - lista3 - zadanie2 - 20-11-2018
#author: Barbara Banaszak 236514

push!(LOAD_PATH, "/home/forestfox/Dokumenty/PWR/ObliczeniaNaukowe/Lista3")
using RootFindMethod
using Base.Test


#some test functions
function functionLin(x)
    return x^2 - 5*x
end
function functionLinD(x)
    return 2*x - 5
end

function funNewton(x)
    return exp(x) - 1.5 - atan(x)
end

function derrNewton(x)
    return exp(x) - (1 + x^2)^(-1)
end

function funSecants(x)
    return x^3 - sinh(x) + 4*x^2 + 6*x + 9 
end

function funSecantsD(x)
    return 3* x^2 + 8*x - cosh(x) + 6
end

(a, b, c, d) = mbisekcji(functionLin,2.0,10.0,(10.0)^(-16), (10.0)^(-16))

if(a == 5.0) 
    println("passed")
else
    println("failed")
end

(a, b, c, d) = mstycznych(functionLin,functionLinD,1.0,(10.0)^(-16), (10.0)^(-16),20)
if(a == 5.0) 
    println("passed")
else
    println("failed")
end

(a, b, c, d) = msiecznych(functionLin,2.0,10.0,(10.0)^(-16), (10.0)^(-16),20)
if(a == 5.0)
    println("passed")
else 
    println("failed")
end

(a, b, c, d) = mbisekcji(funNewton,0.0,(-20.0),(10.0)^(-10), (10.0)^(-10))
if(a < -14 && a > -15)
    println("passed")
else
    println("failed")
end

(a, b, c, d) = mstycznych(funNewton,derrNewton,-7.0,(10.0)^(-24), (10.0)^(-24),20)
if(a < -14 && a > -15)
    println("passed")
else
    println("failed")
end

(a, b, c, d) = msiecznych(funNewton,-13.0,-15.0,(10.0)^(-24), (10.0)^(-24),20)
if(a < -14 && a > -15)
    println("passed")
else    
    println("failed")
end

(a, b, c, d) = mbisekcji(funSecants,7.0,8.0,(10.0)^(-24), (10.0)^(-24))
if(a < 7.2 && a > 7.1)
    println("passed")
else
    println("failed")
end

(a, b, c, d) = mstycznych(funSecants,funSecantsD,7.0,(10.0)^(-24), (10.0)^(-24),20)
if(a < 7.2 && a > 7.1)
    println("passed")
else
    println("failed")
end

(a, b, c, d) = msiecznych(funSecants,7.0,8.0,(10.0)^(-24), (10.0)^(-24),20)
if(a < 7.2 && a > 7.1)
    println("passed")
else    
    println("failed")
end
