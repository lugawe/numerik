import numpy as np
import matplotlib.pyplot as plt

N = 4
d = 0.85

L = np.array([2, 1, 1, 2])

links = np.array([
    [0, 0, 1, 1],
    [1, 0, 0, 1],
    [1, 1, 0, 1],
    [0, 0, 0, 0],
])

M = links / L

r = np.ones(N) / N
iterations = 30
history = np.zeros((iterations + 1, N))
history[0] = r

for k in range(iterations):
    r = d * (M @ r) + (1 - d) / N
    history[k + 1] = r

print(f"PageRank nach {iterations} Iterationen:")
for name, val in zip(["A", "B", "C", "D"], r):
    print(f"{name}: {val:.4f}")

plt.figure()
for i, name in enumerate(["A", "B", "C", "D"]):
    plt.plot(history[:, i], label=name)
plt.xlabel("Iteration")
plt.ylabel("PageRank-Wert")
plt.legend()
plt.title("Konvergenz der PageRank-Werte")
plt.show()
