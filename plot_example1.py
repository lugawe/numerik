import numpy as np
import matplotlib.pyplot as plt

plt.style.use("seaborn-poster")

def plot_vect(x, b, xlim, ylim):

    """
    Funktion zum Plotten von zwei Vektoren:
    x - der ursprüngliche Vektor
    b - der transformierte Vektor
    xlim - die Grenze für x
    ylim - die Grenze für y
    """

    plt.figure(figsize=(10, 6))
    plt.quiver(0, 0, x[0], x[1], color="k", angles="xy", scale_units="xy", scale=1, label="Ursprünglicher Vektor")
    plt.quiver(0, 0, b[0], b[1], color="g", angles="xy", scale_units="xy", scale=1, label="Transformierter Vektor")
    plt.xlim(xlim)
    plt.ylim(ylim)
    plt.xlabel("X")
    plt.ylabel("Y")
    plt.legend()
    plt.show()

A = np.array([[2, 0], [0, 1]])
x = np.array([[1], [1]])
b = np.dot(A, x)

plot_vect(x, b, (0, 3), (0, 2))
