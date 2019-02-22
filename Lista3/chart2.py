#Obliczenia naukowe - lista3 - zadanie6 - 20-11-2018
#author: Barbara Banaszak 236514

from math import *
import numpy as np
import matplotlib.pyplot as plt
X1=[16,100,1000,10000,50000]
Y1=[149,1554,15954,109973,549973]
Y2=[]
Y3=[]


X = np.arange(-1.0, 10.0, 0.001)

for i in X:
    Y1.append(fun1(i))
    Y2.append(fun2(i))
    Y3.append(0)

plt.plot(X,Y3,label='0')
plt.plot(X,Y1,label='exp(1-x) -1')
plt.plot(X,Y2,label='x*exp(-x)')
plt.legend()
plt.show()

