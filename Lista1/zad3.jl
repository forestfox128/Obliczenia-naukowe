#Obliczenia naukowe - lista1 - zadanie3 - 16.10-2018
#author: Barbara Banaszak 236514

#function shows bit representation of Float64 numbers in the given interval
#deltaPower- power of the delta step, given as positive number
#intervalBeg- beggining of the intervalBeg
#intervalEnd - end of the interval
function findDelta(deltaPower,intervalBeg,intervalEnd)
    println("Bit representation [",intervalBeg," , ",intervalEnd,"] delta: 2^-",deltaPower)
    delta = (0.5)^(deltaPower)
    for i=1 : 7 
        intervalBeg = Float64(intervalBeg) + i*delta
        println(bits(intervalBeg))
    end
    println("...")
    for i=(2^(52)-8) : (2^(52)-1)
        intervalBeg = Float64(intervalBeg) + i*delta
        println(bits(intervalBeg))
    end
end

findDelta(52,1,2)
println("---------------------------------------")
findDelta(53,0.5,1)
println("---------------------------------------")
findDelta(51,2,4)
println("---------------------------------------")
