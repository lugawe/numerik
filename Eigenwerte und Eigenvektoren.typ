#set page(numbering: "1")

#set text(
  font: "New Computer Modern",
  size: 12pt,
  lang: "de",
)

#set par(justify: true)

#set heading(numbering: "1.")

#let colorred(x) = text(fill: red, $#x$)
#let colorblue(x) = text(fill: blue, $#x$)

#outline(indent: auto)

#pagebreak()

#outline(
  title: [Abbildungen],
  target: figure.where(kind: image),
)

#pagebreak()

= Eigenwerte und Eigenvektoren

== Einführung (Luis)

Eigenwerte und Eigenvektoren spielen nicht nur in der linearen Algebra,
sondern auch in zahlreichen Bereichen unseres Lebens eine zentrale Rolle.
Ob in der Mechanik oder in der Physik oder – wie wir später sehen werden – sogar
in unserem greifbaren Alltag:
Die Reihenfolge unserer Google-Suchergebnisse lässt sich als ein sortierter
Eigenvektor darstellen.
#footnote[Heutzutage verwendet Google vielfach erweiterte und komplexere Algorithmen um
unsere Suchergebnisse zu berechnen. Viele weitere Faktoren spielen eine zentrale Rolle:
z.B. Inhalt, Ladezeit, Werbung, KI und weiteres.]

Diese scheinbar abstrakten mathematischen Konzepte helfen uns dabei,
komplexe Systeme zu verstehen, Muster zu erkennen und Prozesse effizient zu gestalten.

Wenn wir eine quadratische Matrix $M in RR^(n crossmark n)$ und
einen Vektor $arrow(v) in RR^n$ multiplizieren bekommen wir als Ergebnis wieder einen
Spaltenvektor. Dieser Spaltenvektor zeigt jedoch meistens in ganz verschiedene Richtungen
und hat mit dem ursprünglichen Vektor $arrow(v)$ nichts mehr gemeinsam.
Manchmal jedoch bekommen wir einen Vektor als Ergebnis, der sich als vielfaches
von dem ursprünglichen Vektor $arrow(v)$ darstellen lässt.

Allgemein lässt sich sagen, dass jeder Vektor $arrow(v)$, den man mit einer
Matrix $M$ multipliziert und dessen
Ergebnis ein vielfaches von dem ursprünglichen Vektor $arrow(v)$ ist,
nennt man *Eigenvektor*. Die dazugehörige Zahl $lambda$ mit der der Vektor $arrow(v)$ im 
Ergebnis multipliziert bzw. skaliert wird nennt man *Eigenwert*.

Wenn wir eine Gleichung in der folgenden Form vor uns haben, können wir über
das _"Eigenwertproblem"_ sprechen:

#text(size: 20pt)[
  $ M arrow(v) = lambda arrow(v) $
]

Hierbei gilt
$M in RR^(n crossmark n)$,
$arrow(v) in RR^n$ mit $arrow(v) eq.not 0$ und
$lambda in RR$.

Im Folgenden werden wir das Eigenwertproblem erklären, Beispiele zeigen und
anschaulich machen.
Außerdem werden wir Anwendungen aus dem echten Leben zeigen und erklären.
Begleitend dazu zeigen wir Python Code Beispiele.

#pagebreak()

== Geometrische Anschauung (Luis)

Geometrisch betrachtet bedeutet dies, dass die Vektoren in dieselbe Richtung
zeigen, sich jedoch in ihrer Länge unterscheiden.
Diese Längenunterschiede ergeben sich durch eine Skalierung, die sich durch die
Gleichung $arrow(v)_text("skaliert") = lambda arrow(v)$ beschreiben lässt.

Für positive $lambda$-Werte wird der Vektor gestreckt (länger) und
für negative $lambda$-Werte wird er gestaucht (kürzer). Für den Fall $lambda = 0$ ist
das Ergebnis der Nullvektor.

In @plot_eigen1 wird beispielsweise die Gleichung
$mat(2, 1; 1, 2) dot vec(1, 1) = 3 dot vec(1, 1)$
dargestellt.

#figure(
  image("plot_eigen1.png", width: 80%),
  caption: [Vektor und skalierter Vektor in $RR^2$],
) <plot_eigen1> \

Zur Veranschaulichung wurden die Vektoren in diesem Beispiel
im $RR^2$ dargestellt, grundsätzlich ist das Konzept jedoch auch auf $RR^n$ übertragbar.

#pagebreak()

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
