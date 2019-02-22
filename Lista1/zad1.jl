#Obliczenia naukowe - lista1 - zadanie1 - 16.10-2018
#author: Barbara Banaszak 236514

#function counting macheps for given, as a parameter precision
function calculateMacheps(precision)
    x = precision(1.0)
    macheps = precision(1.0) 
    while (precision(x)+precision(macheps*0.5)) > precision(x)
        macheps*=0.5
    end
    return macheps
end
println("---------Macheps--------------")
println("Macheps Float16: ", Float16(calculateMacheps(Float16)))
println("eps(Float16)", eps(Float16))
println("Macheps Float32: ", Float32(calculateMacheps(Float32)))
println("eps(Float32): ", eps(Float32))
println("Macheps Float64: ", calculateMacheps(Float64))
println("eps(Float64): ", eps(Float64))

#function counting eta for given, as a parameter precision
function calculateEta(precision)
    x = precision(1.0)
    eta = precision(1.0) 
    while (precision(0.0)+precision(eta*0.5)) > precision(0.0)
        eta*=0.5
    end
    return eta
end

println("---------Eta--------------")
println("ETA For Float16: ", Float16(calculateEta(Float16)))
println("nextfloat(Float16(0.0)): ", nextfloat(Float16(0.0)))
println("ETA For Float32: ", Float32(calculateEta(Float32)))
println("nextfloat(Float32(0.0)): ", nextfloat(Float32(0.0)))
println("ETA For Float64: ", Float64(calculateEta(Float64)))
println("nextfloat(Float64(0.0)): ", nextfloat(Float64(0.0)))

#function counting maximal number possible to get for given, as a parameter precision
function calculateMax(precision)
    max = precision(1.0)
    while !(isinf(precision(max * (2.0))))
        max*=2
    end
    max *= (precision(2.0) - eps(precision))
    return max
end

println("---------MAX--------------")
println("Float16 max: ", calculateMax(Float16))
println("Float16 realmax(Float16): ", realmax(Float16))
println("Float32 max: ", Float32(calculateMax(Float32)))
println("Float32 realmax(Float32): ", realmax(Float32))
println("Float64 max: ", calculateMax(Float64))
println("Float64 realmax(Float64): ", realmax(Float64))
