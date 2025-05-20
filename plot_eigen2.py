import numpy as np
import matplotlib.pyplot as plt

A = np.array([[-1, 0],
              [ 0, 2]])

v = np.array([1, 0])
lambda_v = A @ v  # das Gleiche wie Eigenwert -1 * v

random_v = A @ np.array([1, 1])

plt.figure()
ax = plt.gca()
ax.set_xlim(-2, 2)
ax.set_ylim(-1, 3)
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
    label="λ * v = -1 * [1, 0]",
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
    label="v = [1, 0]",
)

ax.quiver(
    0,
    0,
    random_v[0],
    random_v[1],
    angles="xy",
    scale_units="xy",
    scale=1,
    color="green",
    label="Kein Eigenvektor, hier A * [1, 1]",
)

plt.axhline(0, color="gray", linewidth=0.5)
plt.axvline(0, color="gray", linewidth=0.5)
plt.grid(True)
plt.legend()
plt.savefig("plot_eigen2.png", dpi=100, bbox_inches="tight")
plt.show()
