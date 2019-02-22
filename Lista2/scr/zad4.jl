#Obliczenia naukowe - lista2 - zadanie4 - 5-11-2018
#author: Barbara Banaszak 236514

using Polynomials

#Polynomials function description
#Poly makes polynomial from the x^n coefficients
#poly makes polynomial from it's roots
#polyval counts polynomial at certain place, using Horner method

# pol = [1, -210.0, 20615.0,-1256850.0,
#       53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,          
#       11310276995381.0, -135585182899530.0,
#       1307535010540395.0,     -10142299865511450.0,
#       63030812099294896.0,     -311333643161390640.0,
#       1206647803780373360.0,     -3599979517947607200.0,
#       8037811822645051776.0,      -12870931245150988800.0,
#       13803759753640704000.0,      -8752948036761600000.0,
#       2432902008176640000.0];

# to get programme which count b) uncomment this part and comment an array above
pol = [1, (-210.0 - (0.5)^(23)), 20615.0,-1256850.0,
      53327946.0,-1672280820.0, 40171771630.0, -756111184500.0,          
      11310276995381.0, -135585182899530.0,
      1307535010540395.0,     -10142299865511450.0,
      63030812099294896.0,     -311333643161390640.0,
      1206647803780373360.0,     -3599979517947607200.0,
      8037811822645051776.0,      -12870931245150988800.0,
      13803759753640704000.0,      -8752948036761600000.0,
      2432902008176640000.0];

#getting wilkinson polinomial coefficients in the "right" way
coeff = flipdim(pol,1)
# P is a polynomial made with coefficients
P = Poly(coeff)
# p is a polinomial made with roots
p = poly([1.0,2.0,3.0,4.0,5.0,6.0,7.0,8.0,9.0,10.0,11.0,12.0,13.0,14.0,15.0,16.0,17.0,18.0,19.0,20.0])

println(P)
println("---------------------------------------")
println(p)
#roots of Wilkinson polinomial -> xk
rootsArray = flipdim(roots(P),1)
println("---------------------------------------")
println("ROOTS ARRAY",rootsArray)

for i = 1 : 20;
    Px = P(rootsArray[i])
    px = polyval(p,rootsArray[i])
    
    #@printf("%d & %d & %.12e & %.12e & %.12e \\\\\n",i,rootsArray[i],Px,px,abs(rootsArray[i] - i))
    # println(i,".", "&",rootsArray[i], "&",Px," & ",px,"\\\\" )#" & ",abs(rootsArray[i] - i))
    println(i,".", "&",rootsArray[i], "&",abs(rootsArray[i] - i),"\\\\" )#" & ",abs(rootsArray[i] - i))
end


