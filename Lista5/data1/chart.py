#Obliczenia naukowe - lista3 - zadanie6 - 20-11-2018
#author: Barbara Banaszak 236514

from math import *
import numpy as np
import matplotlib.pyplot as plt

X=[16,100,1000,10000,50000]
Y1=[149,1554,15954,139964,699964]
Y2=[188,4290,44790,299884,1499884]
Y3=[188,1940,19940,139964,699964]
Y4=[188,4390,44860,299984,1549884]

plt.xlabel("Size of matrix")
plt.ylabel("Number of operations")
plt.plot(X,Y1,label='Gaussian')
plt.plot(X,Y2,label='Gaussian with choose')
plt.plot(X,Y3,label='LU')
plt.plot(X,Y4,label='LU with choose')
plt.legend()
plt.show()

