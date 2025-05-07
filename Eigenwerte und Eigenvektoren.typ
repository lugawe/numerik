#set page(numbering: "1")

#set text(
  font: "New Computer Modern",
  size: 12pt,
  lang: "de",
)

#set par(justify: true)

#set heading(numbering: "1.")

#outline(indent: auto)

#pagebreak()

= Eigenwerte und Eigenvektoren

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
