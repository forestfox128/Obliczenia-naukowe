push!(LOAD_PATH, "/home/forestfox/Dokumenty/PWR/ObliczeniaNaukowe/Lista3")

#Obliczenia naukowe - lista3 - zadanie4 - 20-11-2018
#author: Barbara Banaszak 236514

using RootFindMethod

function F1(x)
    return exp(1-x) - 1
end

function F1D(x)
    return -exp(1-x)
end

function F2(x)
    return x*exp(-x)
end

function F2D(x)
    return -exp(-x) * (x - 1)
end

delta = (10.0)^(-5.0)
epsilon = (10.0)^(-5.0)

println("Funkcja exp(1-x) - 1")
println("Metoda bisekcji")
println( mbisekcji(F1,-10.0,10.0,epsilon, delta) )
println("Metoda Newtona")
println(mstycznych(F1,F1D,20.0,epsilon, delta,20))
println("Metoda siecznych")
println(msiecznych(F1,10.0,100.0,epsilon, delta,200))

println(" ")
println("Funkcja x*exp(-x)")
println("Metoda bisekcji")
println( mbisekcji(F2,-2.0,3.0,epsilon, delta) )
println("Metoda Newtona")
println(mstycznych(F2,F2D,100.0,epsilon, delta,20))
println("Metoda siecznych")
println(msiecznych(F2,-5.0,1000.0,epsilon, delta,20))

# Newton method experiments
println(" ")
println("Newton method experiments")
println("Funkcja exp(1-x) - 1")
println(mstycznych(F1,F1D,10.0,epsilon, delta,20))
println(" ")
println("Funkcja x*exp(-x)")
println(mstycznych(F1,F1D,(0.5),epsilon, delta,20))