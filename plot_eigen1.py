import numpy as np
import matplotlib.pyplot as plt

A = np.array([[2, 1],
              [1, 2]])

v = np.array([1, 1])
lambda_v = A @ v  # das Gleiche wie Eigenwert 3 * v

plt.figure()
ax = plt.gca()
ax.set_xlim(-1, 5)
ax.set_ylim(-1, 5)
ax.set_aspect("equal")

ax.quiver(
    0,
    0,
    lambda_v[0],
    lambda_v[1],
    angles="xy",
    scale_units="xy",
    scale=1,
    color="red",
    label="λ * v = 3 * [1, 1]",
)

ax.quiver(
    0,
    0,
    v[0],
    v[1],
    angles="xy",
    scale_units="xy",
    scale=1,
    color="blue",
    label="v = [1, 1]",
)

plt.axhline(0, color="gray", linewidth=0.5)
plt.axvline(0, color="gray", linewidth=0.5)
plt.grid(True)
plt.legend()
plt.savefig("plot_eigen1.png", dpi=100)
plt.show()
