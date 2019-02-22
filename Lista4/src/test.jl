#Obliczenia naukowe - lista4 - zadanie1-4@test - 09-12-2018
#author: Barbara Banaszak 236514

push!(LOAD_PATH, "/home/forestfox/Dokumenty/PWR/ObliczeniaNaukowe/Lista4/src")
using Interpolation
# using Base.Test

X1 = [-2.0,-1.0,0.0,1.0,2.0,3.0]
X2 = [5.0,-7.0,-6.0,0.0]
X3 = [-2.5,-1.5,0.0]
Y1 = [-25.0,3.0,1.0,-1.0,27.0,235.0]
Y2 = [1.0,-23.0,-54.0,-954.0]
Y3 = [-5.0,1.0,1.0]

print("JAJAJJA")
print(ilorazyRoznicowe(X1,Y1))

# @testset "Testing ilorazyRoznicowe" begin
# @test Interpolation.ilorazyRoznicowe(X1,Y1) == [-25.0,28.0,-15.0,5.0,0.0,1.0]
# @test Interpolation.ilorazyRoznicowe(X2,Y2) == [1.0,2.0,3.0,4.0]
# @test Interpolation.ilorazyRoznicowe(X3,Y3) == [-5.0, 6.0, -2.4]
# end

# @testset "Testing warNewton" begin
# for i = 1 : length(X1);
#     @test Interpolation.warNewton(X1,ilorazyRoznicowe(X1,Y1),X1[i]) == Y1[i]
# end
# for i = 1 : length(X2);
#     @test Interpolation.warNewton(X2,ilorazyRoznicowe(X2,Y2),X2[i]) == Y2[i]
# end
# for i = 1 : length(X3);
#     @test Interpolation.isapprox(warNewton(X3,ilorazyRoznicowe(X3,Y3),X3[i]) , Y3[i])
# end
# end

# @testset "Testing warNewton" begin
# @test isapprox(Interpolation.naturalna([5.0, -7.0, -6.0, 0.0], [1.0, 2.0, 3.0, 4.0]) , [-954.0, -84.0, 35.0, 4.0])
# @test isapprox(Interpolation.naturalna([0.0, 1.0, 2.0], [-3.0, 2.0, 2.0]) , [-3.0, 0.0, 2.0])
# end

