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

#outline(
  title: [Abbildungen],
  target: figure.where(kind: image),
)

#pagebreak()

= Eigenwerte und Eigenvektoren

== Einführung (Luis)

Eigenwerte und Eigenvektoren spielen in vielen Bereichen unseres Lebens eine entscheidende
Rolle.

== Geometrische Anschauung (Luis)

Der Ausdruck $lambda v$ lässt sich wie folgt geometrisch darstellen: 

#figure(
  image("plot_eigen1.png", width: 80%),
  caption: [Vektor und skalierter Vektor],
) <plot_eigen1>

== Formel (Gülsüm)

Eine quadratische Matrix *$A$* kann mit einem Spaltenvektor *$x$* multipliziert werden, wobei
das Ergebnis wieder ein Spaltenvektor ist.

Es gibt eine besondere Form dieser Transformation:

$ A x = lambda x $

Dabei gilt:
- *$A$* ist eine $n times n$ Matrix.
- *$x$* ist ein $n times 1$ Spaltenvektor (wobei $x eq.not 0$).
- *$lambda$* ist ein Skalar.

Jeder Wert von *$lambda$*, der diese Gleichung erfüllt, wird als *Eigenwert* der Matrix *$A$* bezeichnet.
Der zugehörige Vektor *$x$* wird als *Eigenvektor* zum Eigenwert *$lambda$* bezeichnet.

== Lösungsverfahren (Gülsüm)

Was ist der Ansatz um ein Eigenwertproblem zu berechen?

=== Einfaches Beispiel
-> Determinantenverfahren 2x2 Matrix um die Eingenwerte zu berechenn

1 bis 2 Eigenwerte einsetzen und damit dann $lambda_1$ bzw. $lambda_2$ in die Matrix einsetzen und damit den Eigenvektor berechnen über den Gauß-Algorythmus.

=== Komplexeres Beispiel
-> Determinantenverfahren 5x5 Matrix
-> Polynom vom 5. Grad -> Was nun?

== Python-Beispiele (Luis)

= Anwendungen

== Google PageRank (Michael)

=== Allgemein

=== Verfahren

==== Markov-Ketten

=== Zurück zum Eigenwertproblem

== Kompression & Bildverarbeitung

== Datenanalyse (Wichtig für KI)

== Ausblick in die Wissenschaft

//Notizen

Eigenwerte und Eigenvektoren

Eine Matrix *$A$* kann auf einen Spaltenvektor *$x$* angewendet werden, was
eine *lineare Transformation* von *$x$* darstellt.

Es gibt eine besondere Form dieser Transformation:

$ A x = lambda x $

Dabei gilt:
- *$A$* ist eine $n times n$ Matrix.
- *$x$* ist ein $n times 1$ Spaltenvektor (wobei $x eq.not 0$).
- *$lambda$* ist ein Skalar.

Jeder Wert von *$lambda$*, der diese Gleichung erfüllt, wird als *Eigenwert* der Matrix *$A$* bezeichnet.
Der zugehörige Vektor *$x$* wird als *Eigenvektor* zum Eigenwert *$lambda$* bezeichnet.

Motivation hinter Eigenwerten und Eigenvektoren

- *Grundidee:*
  - Eigenwerte und Eigenvektoren helfen uns, die Eigenschaften von linearen Transformationen besser zu verstehen und Probleme zu vereinfachen.

- *Transformation eines Vektors:*
  - Ein Vektor *$x$* kann durch eine Matrix *$A$* in einen neuen Vektor *$A x$* umgewandelt werden.
  - Diese Transformation kann die Länge (Skalierung) und/oder die Richtung (Drehung) des Vektors ändern.

- *Besondere Vektoren - Eigenvektoren:*
  - Für bestimmte Vektoren ist der Transformationseffekt *nur eine Skalierung* (Strecken, Komprimieren oder Spiegeln), ohne die Richtung zu ändern.
  - Diese Vektoren werden als *Eigenvektoren* bezeichnet.

- *Skalierungsfaktoren - Eigenwerte:*
  - Die Werte, um die ein Eigenvektor skaliert wird, nennt man *Eigenwerte $λ$*.

- *Zusammenfassung:*
  - *Eigenvektoren:* Vektoren, die bei der Transformation nur gestreckt oder komprimiert werden.
  - *Eigenwerte:* Faktoren, die die Länge des Eigenvektors bestimmen.

#pagebreak()

Python-Beispiel: Eigenvektoren plotten

Sehen wir uns ein Beispiel an, um die Transformation eines Vektors durch eine Matrix zu visualisieren.

Wir plotten den Vektor $x = mat(1; 1)$ und den transformierten Vektor $b = A x$, wobei die
Matrix $A$ gegeben ist als $A = mat(2, 0; 0, 1)$.

(Jupyter-Notebook)

#let plot_example1 = read("plot_example1.py")
#raw(plot_example1, lang: "python")

Grafik einfügen
image("eigenvector_plot.png", width: 80%)

Plot-Ergebnis

Der Plot zeigt die beiden Vektoren:

- *Schwarzer Vektor:* Ursprünglicher Vektor $x$
- *Grüner Vektor:* Transformierter Vektor $b$

Die Grafik veranschaulicht die *Streckung* und die minimale *Rotation* des Vektors nach der Transformation.

#pagebreak()

Grundlagen

$
  mat(
    1, 2, ..., 10;
    2, 2, ..., 10;
    dots.v, dots.v, dots.down, dots.v;
    10, 10, ..., 10;
  )
$

Matrizen Wiederholung

Vektorraum und Vektoren

Matrix Generell

Determinante

Python Beispiel: Multiplikation / Determinante mit numpy

Matrix Multiplikation:

```python
import numpy as np

a = np.array([[1, 0],
              [0, 1]])

b = np.array([[4, 1],
              [2, 2]])

result = np.matmul(a, b)
```

Charakeristisches Polynom

Spektralsatz (Wichtig für z.B. Bildverarbeitung/Kompression)

Berechnung von Eigenwerten & Eigenvektoren

Python Beispiel: Berechnung

Geometrische Anschauung

Anwendungen



Anwendungen in der Numerik

Google PageRank

Allgemein

Verfahren

Markov-Ketten

Zurück zum Eigenwertproblem


Kompression & Bildverarbeitung

Datenanalyse (Wichtig für KI)



#pagebreak()

= Anhang

== Code zu @plot_eigen1

#let plot_eigen1 = read("plot_eigen1.py")
#raw(plot_eigen1, lang: "python")
