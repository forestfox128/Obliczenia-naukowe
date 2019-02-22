#Obliczenia naukowe - lista4 - zadanie5 - 09-12-2018
#author: Barbara Banaszak 236514

push!(LOAD_PATH, "/home/forestfox/Dokumenty/PWR/ObliczeniaNaukowe/Lista4/src")
using Interpolation

X = [-1.0,0.0,1.0,2.0]
F = [-1.0,0.0,-1.0,2.0]


FX = ilorazyRoznicowe(X,F)
println(naturalna(X,FX))

#result:
#[0.0, -1.0, -1.0, 1.0]


