#Obliczenia naukowe - lista1 - zadanie6 - 16.10-2018
#author: Barbara Banaszak 236514

#counting f(x) function
function f(x)
    return sqrt((x*x)+1) - 1
end

#counting g(x) function
function g(x)
    return (x*x)/(sqrt((x*x)+1)+1)
end

for i = 1 : 10
    println(i)
    x = Float64(8)^(-i)
    y = Float32(8)^(-i)
    println("Funkcja f dla f64: ", f(x))
    println("Funkacja g dla f64: ", g(x))
end