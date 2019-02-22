#Oblirzenia naukowe - lista2 - zadanie5 - 5-11-2018
#author: Barbara Banaszak 236514

float32S = []
float64S = []
float32Rounded = []
# function counting logisticModelRecursion for given precision for 40 iteration
function logisticModelRecursion(pN,r,counter,precision);
    pN = precision(pN + precision(r*pN*precision(1.0 - pN)))
    println(pN)
    addToArray(precision,pN)
   if(counter < 40)
    logisticModelRecursion(pN,r, counter + 1,precision)
   end
end

# function counting logisticModelRecursion for given precision for 40 iteration and round numbers after 10th iteration
function lMRwithRound(pN,r,counter,precision);
    pN = precision(pN + precision(r*pN*precision(1.0 - pN)))
    println(pN)
    push!(float32Rounded,pN)
   if(counter == 9)
    pN = round(pN,3)
   end
   if(counter < 40)
    lMRwithRound(pN,r, counter + 1,precision)
   end
end

#function which helps to create appriopiate output
function addToArray(precision, pN);
    if(precision == Float32)
        push!(float32S,pN)
    end
    if(precision == Float64)
        push!(float64S,pN)
    end
end

println("For Float32: ")
logisticModelRecursion(0.01,3.0,0,Float32)
println("For Float64: ")
logisticModelRecursion(0.01,3.0,0,Float64)

println("For Float32 rounded after 10th iteration: ")
lMRwithRound(0.01,3.0,0,Float32)

for i = 1 : 40;
    print(i,"&")
    print(float32S[i], "&")
    print(float32Rounded[i]," & ")
    print(float64S[i])
    println()
end