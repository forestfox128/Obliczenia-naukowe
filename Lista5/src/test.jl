#Obliczenia naukowe - lista5 - @test - 31-12-2018
#author: Barbara Banaszak 236514

push!(LOAD_PATH, "/home/forestfox/Dokumenty/PWR/ObliczeniaNaukowe/Lista5/src")
using blocksys
using Base.Test

vectorFile1 = "../b.txt"
matrixFile1 = "../A.txt"
vectorFile2 = "../data_10000/b.txt"
matrixFile2 = "../data_10000/A.txt"
vectorFile3 = "../data_50000/b.txt"
matrixFile3 = "../data_50000/A.txt"
vectorFile4 = "../myData/b.txt"
matrixFile4 = "../myData/A.txt"
vectorFile5 = "../data_1000/b.txt"
matrixFile5 = "../data_1000/A.txt"

function countError(n::Int, vector::Vector{Float64})

    err = 0
    for i = 1 : n
        err += abs(1.0 - vector[i])
    end
    err = abs(err / Float64(n))
    print("ERROR: ", err)

end

# print("Enter vector file: ")
# vectorFile = readline()
# print("\nEnter matrix file: ")
# matrixFile = readline()

# n = getMatrix(matrixFile)[1]
# l = getMatrix(matrixFile)[2]
# matrix = getMatrix(matrixFile)[3]
# vec = getVector(vectorFile)
# xGE1 = @time gaussianElimination(n,l,matrix,vec,false)
# xGEC1 = @time gaussianEliminationWithChoose(n,l,matrix,vec,false)
# xLU1 = @time solveFromLU(n,l,LU(n,l,matrix),vec)
# xLUC1 = @time solveFromLUWithChoose(n,l,LUWithChoose(n,l,matrix)[1],vec,LUWithChoose(n,l,matrix)[2])


print("-----------------16\n")
n = getMatrix(matrixFile1)[1]
l = getMatrix(matrixFile1)[2]
matrix = getMatrix(matrixFile1)[3]
vec = getVector(vectorFile1)

countVector(n,l,matrix)
xGE1 = @time gaussianElimination(n,l,matrix,vec,false)
xGEC1 = @time gaussianEliminationWithChoose(n,l,matrix,vec,false)
xLU1 = @time solveFromLU(n,l,LU(n,l,matrix),vec)
xLUC1 = @time solveFromLUWithChoose(n,l,LUWithChoose(n,l,matrix)[1],vec,LUWithChoose(n,l,matrix)[2])
x1 =  @time matrix \ vec
# countError(n,xGE1)
# countError(n,xLU1)

print("-----------------100\n")
n = getMatrix(matrixFile4)[1]
l = getMatrix(matrixFile4)[2]
matrix = getMatrix(matrixFile4)[3]
# vec = getVector(vectorFile4)
vec = countVector(n,l,matrix)
xGE4 = @time gaussianElimination(n,l,matrix,vec,false)
xGEC4 = @time gaussianEliminationWithChoose(n,l,matrix,vec,false)
xLU4 = @time solveFromLU(n,l,LU(n,l,matrix),vec)
xLUC4 = @time solveFromLUWithChoose(n,l,LUWithChoose(n,l,matrix)[1],vec,LUWithChoose(n,l,matrix)[2])
x4 = @time matrix \ vec

print("-----------------1000\n")
n = getMatrix(matrixFile5)[1]
l = getMatrix(matrixFile5)[2]
matrix = getMatrix(matrixFile5)[3]
vec = getVector(vectorFile5)
xGE5 = @time gaussianElimination(n,l,matrix,vec,true)
xGEC5 = @time gaussianEliminationWithChoose(n,l,matrix,vec,false)
xLU5 = @time solveFromLU(n,l,LU(n,l,matrix),vec)
xLUC5 = @time solveFromLUWithChoose(n,l,LUWithChoose(n,l,matrix)[1],vec,LUWithChoose(n,l,matrix)[2])
x5 = @time matrix \ vec

print("-----------------10000\n")
n = getMatrix(matrixFile2)[1]
l = getMatrix(matrixFile2)[2]
matrix = getMatrix(matrixFile2)[3]
vec = getVector(vectorFile2)
xGE2 = @time gaussianElimination(n,l,matrix,vec,false)
xGEC2 = gaussianEliminationWithChoose(n,l,matrix,vec,false)
xLU2 = @time solveFromLU(n,l,LU(n,l,matrix),vec)
xLUC2 = @time solveFromLUWithChoose(n,l,LUWithChoose(n,l,matrix)[1],vec,LUWithChoose(n,l,matrix)[2])
x2 = @time matrix \ vec

# print("-----------------50000\n")
# n = getMatrix(matrixFile3)[1]
# l = getMatrix(matrixFile3)[2]
# matrix = getMatrix(matrixFile3)[3]
# vec = getVector(vectorFile3)
# xGE3 = @time gaussianElimination(n,l,matrix,vec,false)
# xGEC3 = @time gaussianEliminationWithChoose(n,l,matrix,vec,false)
# xLU3 = @time solveFromLU(n,l,LU(n,l,matrix),vec)
# xLUC3 = @time solveFromLUWithChoose(n,l,LUWithChoose(n,l,matrix)[1],vec,LUWithChoose(n,l,matrix)[2])
# countError(n,xLUC3)




@testset "Testing gaussianElimination" begin
    @test isapprox(xGE1, x1)
    @test isapprox(xGE2, x2)
    @test isapprox(xGE4, x4)
end

@testset "Testing gaussianEliminationWithChoose" begin
    @test isapprox(xGEC1, x1)
    @test isapprox(xGEC2, x2)
    @test isapprox(xGEC4, x4)
end

@testset "Testing LU" begin
    @test isapprox(xLU1, x1)
    @test isapprox(xLU2, x2)
    @test isapprox(xLU4, x4)
end

@testset "Testing LUWithChoose" begin
    @test isapprox(xLUC1, x1)
    @test isapprox(xLUC2, x2)
    @test isapprox(xLUC4, x4)
end

