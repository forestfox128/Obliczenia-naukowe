#Obliczenia naukowe - lista5 - 31-12-2018
#author: Barbara Banaszak 236514

module blocksys
export getVector, getMatrix, gaussianElimination, gaussianEliminationWithChoose, LU, solveFromLU, LUWithChoose, solveFromLUWithChoose, saveToFile, countVector

#function reads right side vector from a file
#input vectorFile - name of the file to read vector from
#output b - right side vector read from file
function getVector(vectorFile)
    b = zeros(0)
    open(vectorFile) do f
        n = parse(Float64,readline(f))
        while !eof(f)
            append!(b,parse(Float64,readline(f)))
        end
    end
    return b
end

#function reads matrix A from a file
#input matrixFile - name of the file to read matrix from
#output A - matrix in SparseMatrixCSC format, n- size of the matrix, l- size of the block in matrix
function getMatrix(matrixFile)
    open(matrixFile) do a
        ln = split(readline(a))
        n = parse(Int64,ln[1])
        l = parse(Int64,ln[2])
        A = spzeros(Integer(n),Integer(n))
        while !eof(a)
            ln = split(readline(a))
            i = parse(Int64,ln[1])
            j = parse(Int64,ln[2])
            value = parse(Float64,ln[3])
            A[i,j] = value
        end
        return n,l,A
    end      
end


#function solves equotion Ax = b using gaussian elimination
#input n -size of matrix A, l- size of block in matrix, A - matrix, b -right side vector
#output x - vector of solution
function gaussianElimination(n::Int64, l::Int64, A::SparseMatrixCSC{Float64,Int64}, b::Vector{Float64},saveToFile::Bool)

    x = Array{Float64}(n)
    for i = 1 : n-1
        lastNonZeroInColumn = Integer(min(l*floor(i/l)+l,n))
        lastNonZeroInRow = Integer(min(i+l,n))

        for j = i + 1 : lastNonZeroInColumn
            if A[i,i] == 0
                print("ERROR: zero na diagonali")
                exit(1)
            end
            multpCoeff = A[j, i] / A[i, i]
            A[j, i] = 0.0

            for k = i + 1 : lastNonZeroInRow
                A[j, k] = A[j, k] - multpCoeff * A[i, k]
            end
            b[j] = b[j] - multpCoeff * b[i]
        end
    end

    x[n] = b[n] / A[n, n]
    for i = n - 1 : -1 : 1
        sum = 0
        lastNonZeroInRow = Integer(min(i+l,n))
        for j = i+1 : lastNonZeroInRow
            sum += x[j] * A[i, j]
        end
        x[i] = (b[i] - sum) / A[i, i]
    end
    if saveToFile
        writedlm("output.txt", x)
    end
    return x
end

function findCurrentChoose(perm, lastNonZeroInColumn::Int, A::SparseMatrixCSC{Float64,Int64}, iterator::Int)

    rowWithMaxElem = 0
    for i = iterator + 1 : lastNonZeroInColumn
        rowWithMaxElem = iterator
        maxElem = abs(A[perm[i],i])

        for j = i : lastNonZeroInColumn
            if abs(A[perm[j],i]) > maxElem
                rowWithMaxElem = j
                maxElem = A[perm[j],i]
            end
        end
    end
    return rowWithMaxElem
end

function swap(x::Int, y::Int)
    temp = x
    x = y
    y = temp
end

#function solves equotion Ax = b using gaussian elimination with partial element choose
#input n -size of matrix A, l- size of block in matrix, A - matrix, b -right side vector
#output x - vector of solution
function gaussianEliminationWithChoose(n::Int64, l::Int64, A::SparseMatrixCSC{Float64,Int64}, b::Vector{Float64},saveToFile)
    
    x = Array{Float64}(n)
    perm = collect(1:n)

    for i = 1 : n-1
        lastNonZeroInColumn = Integer(min(l*floor(i/l)+l*2,n))
        lastNonZeroInRow = Integer(min(i+l,n))

        for j = i + 1 : lastNonZeroInColumn

            if A[i,i] == 0
                print("ERROR: zero na diagonali")
                exit(1)
            end

            rowWithMaxElem = findCurrentChoose(perm,lastNonZeroInColumn,A,i) 
            swap(perm[i],perm[rowWithMaxElem])

            multpCoeff = A[perm[j], i] / A[perm[i], i]
            A[perm[j], i] = 0.0

            for k = i + 1 : lastNonZeroInRow
                A[perm[j], k] = A[perm[j], k] - multpCoeff * A[perm[i], k]
            end
            b[perm[j]] = b[perm[j]] - multpCoeff * b[perm[i]]
        end
    end

    x[n] = b[n] / A[n, n]
    for i = n - 1 : -1 : 1
        sum = 0
        lastNonZeroInRow = Integer(min(i+l,n))
        for j = i+1 : lastNonZeroInRow
            sum += x[j] * A[perm[i], j]
        end
        x[i] = (b[perm[i]] - sum) / A[perm[i], i]
    end
    if saveToFile
        writedlm("output.txt", x)
    end
    return x
end

#function makes LU decomposition of matrix
#input n -size of matrix A, l- size of block in matrix, A - matrix
#output A - matrix containing L and U matrix
function LU(n::Int64, l::Int64, A::SparseMatrixCSC{Float64,Int64})

    for i = 1 : n-1
        lastNonZeroInColumn = Integer(min(l*floor(i/l)+l,n))
        lastNonZeroInRow = Integer(min(i+l,n))

        for j = i + 1 : lastNonZeroInColumn
            if A[i,i] == 0
                print("EROR: zero na diagonali")
                exit(1)
            end
            multpCoeff = A[j, i] / A[i, i]
            # print(A[j, i]," / ",A[i, i] ," ", multpCoeff,"\n")
            A[j, i] = multpCoeff

            for k = i + 1 : lastNonZeroInRow
                A[j, k] = A[j, k] - multpCoeff * A[i, k]
            end
        end
    end
    return A
end

#function solves equotion Ax = b using LU decomposition
#input n -size of matrix A, l- size of block in matrix, A - matrix, b -right side vector
#output x - vector of solution
function solveFromLU(n::Int64, l::Int64, A::SparseMatrixCSC{Float64,Int64}, b::Vector{Float64})

    x = Array{Float64}(n)
    y = Array{Float64}(n)

    for i = 1 : n
        sum = 0
        lastNonZeroInRow = Integer(min(i+l,n))

        for j = lastNonZeroInRow : i-1
            sum += y[j] * A[i, j]
        end
        y[i] = b[i] - sum
    end

    x[n] = y[n] / A[n, n]
    for i = n - 1 : -1 : 1
        sum = 0
        lastNonZeroInRow = Integer(min(i+l,n))
        for j = i+1 : lastNonZeroInRow
            sum += x[j] * A[i, j]
        end
        x[i] = (y[i] - sum) / A[i, i]
    end
    writedlm("output1.txt", x)
    return x
end

#function makes LU decomposition with partial choose of element of matrix
#input n -size of matrix A, l- size of block in matrix, A - matrix
#output A - matrix containing L and U matrix
function LUWithChoose(n::Int64, l::Int64, A::SparseMatrixCSC{Float64,Int64})

    perm = collect(1:n)

    for i = 1 : n-1
        lastNonZeroInColumn = Integer(min(l*floor(i/l)+l,n))
        lastNonZeroInRow = Integer(min(i+l,n))

        for j = i + 1 : lastNonZeroInColumn

            rowWithMaxElem = findCurrentChoose(perm,lastNonZeroInColumn,A,i) 
            swap(perm[i],perm[rowWithMaxElem])
            if A[i,i] == 0
                print("ERROR: zero na diagonali")
                exit(1)
            end
            multpCoeff = A[perm[j], i] / A[perm[i], i]
            A[perm[j], i] = multpCoeff

            for k = i + 1 : lastNonZeroInRow
                A[perm[j], k] = A[perm[j], k] - multpCoeff * A[perm[i], k]
            end
        end
    end

    return A,perm
end

#function solves equotion Ax = b using LU decomposition with partial choose of element
#input n -size of matrix A, l- size of block in matrix, A - matrix, b -right side vector
#output x - vector of solution
function solveFromLUWithChoose(n::Int64, l::Int64, A::SparseMatrixCSC{Float64,Int64}, b::Vector{Float64},perm)

    x = Array{Float64}(n)
    y = Array{Float64}(n)

    for i = 1 : n
        sum = 0
        for j = 1 : i-1
            sum += y[j] * A[perm[i], j]
        end
        y[i] = b[perm[i]] - sum
    end

    x[n] = y[n] / A[n, n]
    for i = n - 1 : -1 : 1
        sum = 0
        for j = i+1 : n
            sum += x[j] * A[perm[i], j]
        end
        x[i] = (y[perm[i]] - sum) / A[perm[i], i]
    end
    return x
end
end

#function counts right side vetor of given matrix, assuming x vector has only ones
#input n -size of matrix A, l- size of block in matrix, A - matrix
#output b - righ side vector
function countVector(n::Int64, l::Int64, A::SparseMatrixCSC{Float64, Int64})
    b = zeros(n);
    for i = 1 : n
        lastNonZeroInColumn = Integer(min(l*floor(i/l)+l,n))
        lastNonZeroInRow = Integer(min(i+l,n))
        for j = 1 : lastNonZeroInRow
            b[i] += A[i,j]
        end
    end
    writedlm("b.txt", b)
    return b
end

end


