#Obliczenia naukowe - lista1 - zadanie4 - 16.10-2018
#author: Barbara Banaszak 236514

#program is finding the smallest number which match the statetment x ∗ (1/x) != 1
x = Float64(1.0)
while Float64(x) < 2.0
    if(Float64(x*Float64(1.0/x)) != 1.0)
        println("Found the smallest one: ", x)
        break
    end
    x = nextfloat(Float64(x))
end