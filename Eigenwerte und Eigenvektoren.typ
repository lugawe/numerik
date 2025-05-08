#set page(numbering: "1")

#set text(
  font: "New Computer Modern",
  size: 12pt,
  lang: "de",
)

#set par(justify: true)

#set heading(numbering: "1.")

#out line(indent: auto)

#pagebreak()

= Eigenwerte und Eigenvektoren
# Eigenwerte und Eigenvektoren

Eine Matrix $A$ kann auf einen Spaltenvektor $\mathbf{x}$ angewendet werden, was eine **lineare Transformation** von $\mathbf{x}$ darstellt.  

Es gibt eine besondere Form dieser Transformation:  

\[
A \mathbf{x} = \lambda \mathbf{x}
\]

Dabei gilt:  
- $A$ ist eine $n \times n$ Matrix.  
- $\mathbf{x}$ ist ein $n \times 1$ Spaltenvektor (wobei $\mathbf{x} \neq 0$).  
- $\lambda$ ist ein Skalar.  

Jeder Wert von $\lambda$, der diese Gleichung erfüllt, wird als **Eigenwert** der Matrix $A$ bezeichnet.  
Der zugehörige Vektor $\mathbf{x}$ wird als **Eigenvektor** zum Eigenwert $\lambda$ bezeichnet.  

# Motivation hinter Eigenwerten und Eigenvektoren

- **Grundidee:**  
  - Eigenwerte und Eigenvektoren helfen uns, die Eigenschaften von linearen Transformationen besser zu verstehen und Probleme zu vereinfachen.

- **Transformation eines Vektors:**  
  - Ein Vektor $\mathbf{x}$ kann durch eine Matrix $A$ in einen neuen Vektor $A \mathbf{x}$ umgewandelt werden.  
  - Diese Transformation kann die Länge (Skalierung) und/oder die Richtung (Drehung) des Vektors ändern.  

- **Besondere Vektoren – Eigenvektoren:**  
  - Für bestimmte Vektoren ist der Transformationseffekt **nur eine Skalierung** (Strecken, Komprimieren oder Spiegeln), ohne die Richtung zu ändern.  
  - Diese Vektoren werden als **Eigenvektoren** bezeichnet.  

- **Skalierungsfaktoren – Eigenwerte:**  
  - Die Werte, um die ein Eigenvektor skaliert wird, nennt man **Eigenwerte** $\lambda$.  

- **Zusammenfassung:**  
  - *Eigenvektoren:* Vektoren, die bei der Transformation nur gestreckt oder komprimiert werden.  
  - *Eigenwerte:* Faktoren, die die Länge des Eigenvektors bestimmen.  

# Beispiel: Eigenvektoren plotten

Sehen wir uns ein Beispiel an, um die Transformation eines Vektors durch eine Matrix zu visualisieren.  

Wir plotten den Vektor $\mathbf{x} = \begin{bmatrix} 1 \\ 1 \end{bmatrix}$ und den transformierten Vektor $\mathbf{b} = A\mathbf{x}$, wobei die Matrix $A$ gegeben ist als:  

\[
A = \begin{bmatrix} 2 & 0 \\ 0 & 1 \end{bmatrix}
\]  

## Python-Code

```python
import numpy as np
import matplotlib.pyplot as plt

plt.style.use('seaborn-poster')

def plot_vect(x, b, xlim, ylim):
    '''
    Funktion zum Plotten von zwei Vektoren:
    x - der ursprüngliche Vektor
    b - der transformierte Vektor
    xlim - die Grenze für x
    ylim - die Grenze für y
    '''
    plt.figure(figsize=(10, 6))
    plt.quiver(0, 0, x[0], x[1], color='k', angles='xy', scale_units='xy', scale=1, label='Ursprünglicher Vektor')
    plt.quiver(0, 0, b[0], b[1], color='g', angles='xy', scale_units='xy', scale=1, label='Transformierter Vektor')
    plt.xlim(xlim)
    plt.ylim(ylim)
    plt.xlabel('X')
    plt.ylabel('Y')
    plt.legend()
    plt.show()

A = np.array([[2, 0], [0, 1]])
x = np.array([[1], [1]])
b = np.dot(A, x)

plot_vect(x, b, (0, 3), (0, 2))

Transformation.  

# Grafik einfügen
image("eigenvector_plot.png", width: 80%)

# Plot-Ergebnis

Der Plot zeigt die beiden Vektoren:  

- **Schwarzer Vektor:** Ursprünglicher Vektor $\mathbf{x}$  
- **Grüner Vektor:** Transformierter Vektor $\mathbf{b}$  

Die Grafik veranschaulicht die **Streckung** und die minimale **Rotation** des Vektors nach der Transformation.  


== Grundlagen

$
  mat(
    1, 2, ..., 10;
    2, 2, ..., 10;
    dots.v, dots.v, dots.down, dots.v;
    10, 10, ..., 10;
  )
$

=== Matrizen Wiederholung

Vektorraum und Vektoren

Matrix Generell

Determinante



==== Python Beispiel: Multiplikation / Determinante mit numpy

Matrix Multiplikation:

```python
import numpy as np

a = np.array([[1, 0],
              [0, 1]])

b = np.array([[4, 1],
              [2, 2]])

result = np.matmul(a, b)
```

=== Charakeristisches Polynom

=== Spektralsatz (Wichtig für z.B. Bildverarbeitung/Kompression)

== Berechnung von Eigenwerten & Eigenvektoren

=== Python Beispiel: Berechnung

== Geometrische Anschauung

== Anwendungen



= Anwendungen in der Numerik

== Google PageRank

== Markov-Ketten

== Kompression & Bildverarbeitung

== Datenanalyse (Wichtig für KI)
