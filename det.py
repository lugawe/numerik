import numpy as np

matrix = np.array([[1, 2],
                   [3, 4]])

determinante = np.linalg.det(matrix)

print(f"Det {determinante}")
