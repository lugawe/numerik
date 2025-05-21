import numpy as np

A = np.array([[2, 1],
              [1, 2]])

eigenwerte, eigenvektoren = np.linalg.eig(A)


def rechne(i):
    vec = eigenvektoren[:, i]
    l = eigenwerte[i]
    val1 = A @ vec
    val2 = l * vec
    return vec, l, val1, val2


for i in range(len(eigenwerte)):
    vec, l, val1, val2 = rechne(i)
    print(f"{val1} = {val2}")
