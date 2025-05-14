import numpy as np
import matplotlib.pyplot as plt

A = np.array([[2, 1],
              [1, 2]])

eigenvalues, eigenvectors = np.linalg.eig(A)

v = eigenvectors[:, 0]
lambda_v = eigenvalues[0] * v

plt.figure()
ax = plt.gca()
ax.set_xlim(-1, 4)
ax.set_ylim(-1, 4)
ax.set_aspect("equal")

ax.quiver(
    0, 0, lambda_v[0], lambda_v[1], angles="xy", scale_units="xy", scale=1, color="red", label="λ * v",
)

ax.quiver(
    0, 0, v[0], v[1], angles="xy", scale_units="xy", scale=1, color="blue", label="v"
)

plt.axhline(0, color="gray", linewidth=0.5)
plt.axvline(0, color="gray", linewidth=0.5)
plt.grid(True)
plt.legend()
plt.savefig("plot_eigen1.png", dpi=100) 
plt.show()
