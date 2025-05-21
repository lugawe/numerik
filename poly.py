import numpy as np
import sympy as sp

A = np.array([[4, 1],
              [2, 3]])

lambda_symbol = sp.symbols("lambda")

# Einheitsmatrix
I = np.eye(2)

poly = sp.det(sp.Matrix(A) - lambda_symbol * I)

print(f"Polynom: {poly}")
