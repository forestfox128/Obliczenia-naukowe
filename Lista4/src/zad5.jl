#Obliczenia naukowe - lista4 - zadanie5 - 09-12-2018
#author: Barbara Banaszak 236514

push!(LOAD_PATH, "/home/forestfox/Dokumenty/PWR/ObliczeniaNaukowe/Lista4/src")
using Interpolation

#function used in A)
function fiveA(x)
    return exp(x)
end

#function used in B)
function fiveB(x)
    return (x^2)*sin(x)
end

rysujNnfx(fiveA,0.0,1.0,5)
rysujNnfx(fiveA,0.0,1.0,10)
rysujNnfx(fiveA,0.0,1.0,15)

rysujNnfx(fiveB,-1.0,1.0,5)
rysujNnfx(fiveB,-1.0,1.0,10)
rysujNnfx(fiveB,-1.0,1.0,15)
