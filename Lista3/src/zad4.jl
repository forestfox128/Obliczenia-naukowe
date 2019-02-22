push!(LOAD_PATH, "/home/forestfox/Dokumenty/PWR/ObliczeniaNaukowe/Lista3")

#Obliczenia naukowe - lista3 - zadanie4 - 20-11-2018
#author: Barbara Banaszak 236514

using RootFindMethod

function FZ4(x)
    return sin(x) - (0.5*x)^2.0
end

function FZ4D(x)
    return cos(x) - 0.5*x
end

println("Funkcja x - (0.5*x)^2")
println("Metoda bisekcji")
println( mbisekcji(FZ4,1.5,2.0,(0.5)*(10.0)^(-5), (0.5)*(10.0)^(-5)) )
println("Metoda Newtona")
println(mstycznych(FZ4,FZ4D,1.5,(0.5)*(10.0)^(-5), (0.5)*(10.0)^(-5),20))
println("Metoda siecznych")
println(msiecznych(FZ4,1.0,2.0,(0.5)*(10.0)^(-5.0), (0.5)*(10.0)^(-5.0),32))