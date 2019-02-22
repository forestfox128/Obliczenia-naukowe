#Obliczenia naukowe - lista2 - zadanie6 - 5-11-2018
#author: Barbara Banaszak 236514

#function counting recursion for given x0 and c parameters
function recursion(xN,c,counter,X)
    xN = Float64(Float64(xN * xN) + c)
     #println(xN)
    push!(X,xN)
    if(counter < 40)
        recursion(xN,c, counter + 1,X)
    end
end

#function getting results in a certain format
function getResult(x0,c)
    X = []
    counter = 0;
    x0 = Float64(x0)
    c = Float64(c)
    recursion(x0,c, counter,X)
    return X
    # println("Dla c = ", c ," dla x0 = ", x0 ," :\n", X)
end

X1 = []
X2 = []
X3 = []
X4 = []
X5 = []
X6 = []
X7 = []
X1 = getResult(1,-2)
X2 = getResult(2,-2)
X3 = getResult(1.99999999999999,-2)
X4 = getResult(1,-1)
X5 = getResult(-1,-1)
X6 = getResult(0.75,-1)
X7 = getResult(0.25,-1)

for i = 1 : 40;
    print(i,"&")
    print(X1[i], "&")
    print(X2[i], "&")
    print(X3[i], "&")
    print(X4[i], "&")
    print(X5[i], "&")
    print(X6[i], "&")
    print(X7[i], "\\", "\\")
    println()
end
# println(X1)
# println(X2)
# println(X3)
# println(X4)
# println(X5)
# println(X6)
# println(X7)