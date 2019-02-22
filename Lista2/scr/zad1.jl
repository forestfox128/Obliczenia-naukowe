#Obliczenia naukowe - lista2 - zadanie1 - 5-11-2018
#author: Barbara Banaszak 236514

#vector params
X = [2.718281828,-3.141592654,1.414213562,0.577215664,0.301029995];
Y = [1486.2497,878366.9879,-22.37492,4773714.647,0.000185049];

#function forward counting of vectors scalar product
function forwardCount(precision,X,Y)
    S = precision(0.0)
    for i = 1 : 5;
        S = S + precision(X[i])*precision(Y[i])
    end
    return S
end
#function backward counting of vectors scalar product
function backwardCount(precision,X,Y)
    S= precision(0.0)
    for i = 5 : -1 : 1;
        S = S + precision(X[i])*precision(Y[i])
    end
    return S
end
# function counting scalar product of vectors, first adds positive numbers from biggest 
#then negative from smallest, then sum it
function thirdWay(precision,X,Y)
    pos = []
    neg = []
    temp = 0.0
    for i = 1 : 5;
        temp = precision(X[i])*precision(Y[i])
        if temp >= 0
             push!(pos, temp)
         elseif temp < 0 
             push!(neg,temp)
         end
     end
     
     sort(pos, rev=true)
     sort(neg)
     sumP = sum(pos)
     sumN = sum(neg)
     return sumP + sumN
end
#function the reverse way of thirdWay counting
function fourthWay(precision,X,Y)
    pos = []
    neg = []
    temp = 0.0
    for i = 1 : 5;
        temp = precision(X[i])*precision(Y[i])
        if temp >= 0
             push!(pos, temp)
         elseif temp < 0 
             push!(neg,temp)
         end
     end
     
    sort(pos)
    sort(neg,rev=true)
    sumP = sum(pos)
    sumN = sum(neg)
    return sumP + sumN
end
println("Forward Float64: ", forwardCount(Float64,X,Y))
println("Forward Float32: ", forwardCount(Float32,X,Y))
println("Backward Float64: ", backwardCount(Float64,X,Y))
println("Backward Float32: ", backwardCount(Float32,X,Y))
println("thirdWay Float64: ", thirdWay(Float64,X,Y))
println("thirdWay Float32: ", thirdWay(Float32,X,Y))
println("fourthWay Float64: ", fourthWay(Float64,X,Y))
println("fourthWay Float32: ", fourthWay(Float32,X,Y))

