#Obliczenia naukowe - lista3 - zadanie5 - 20-11-2018
#author: Barbara Banaszak 236514

from math import *
import numpy as np
import matplotlib.pyplot as plt

Y1=[]
Y2=[]
def fun1(x):
    y = exp(x)
    return y

def fun2(x):
    y = 3*x
    return y

X = np.arange(0.0, 2.0, 0.001)

for i in X:
    Y1.append(fun1(i))
    Y2.append(fun2(i))

plt.plot(X,Y1,'r')
plt.plot(X,Y2,'b')
plt.show()

