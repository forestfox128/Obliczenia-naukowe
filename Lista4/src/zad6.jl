#Obliczenia naukowe - lista4 - zadanie6 - 09-12-2018
#author: Barbara Banaszak 236514

push!(LOAD_PATH, "/home/forestfox/Dokumenty/PWR/ObliczeniaNaukowe/Lista4/src")
using Interpolation

function sixA(x)
    return abs(x)
end

function sixB(x)
    return 1/(1+x^2)
end

rysujNnfx(sixA,-1.0,1.0,5)
rysujNnfx(sixA,-1.0,1.0,10)
rysujNnfx(sixA,-1.0,1.0,15)

rysujNnfx(sixB,-5.0,5.0,5)
rysujNnfx(sixB,-5.0,5.0,10)
rysujNnfx(sixB,-5.0,5.0,15)