push!(LOAD_PATH, "/home/forestfox/Dokumenty/PWR/ObliczeniaNaukowe/Lista3")

#Obliczenia naukowe - lista3 - zadanie4 - 20-11-2018
#author: Barbara Banaszak 236514

using RootFindMethod

function FZ5(x)
    return exp(x) - 3*x
end

delta = (10.0)^(-4)
epsilon = (10.0)^(-4)
a1 = 0.5
b1 = 0.75
a2 = 1.25
b2 = 1.75

println("1 miejsce zerowe")
println( mbisekcji(FZ5,a1,b1, epsilon, delta))

println("2 miejsce zerowe")
println( mbisekcji(FZ5,a2,b2, epsilon, delta))