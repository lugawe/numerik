import numpy as np

A = np.array([[2, 1],
              [1, 2]])

eigenwerte, eigenvektoren = np.linalg.eig(A)


def rechne(i):
    val1 = A @ eigenvektoren[:, i]
    val2 = eigenwerte[i] * eigenvektoren[:, i]
    return val1, val2


for i in range(len(eigenwerte)):
    val1, val2 = rechne(i)
    print(f"{val1} = {val2}")
