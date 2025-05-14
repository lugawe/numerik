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
Google PageRank ist ein Algorithmus, der von Google entwickelt wurde um Webseiten bei einer Suchanfrage zu bewerten und dementsprechend zu sortieren. Webseiten sind untereinander über Hyperlinks verbunden. Die Idee des Algorithmus ist nun, dass Webseiten, welche von mehreren anderen Webseiten referenziert werden als wichtiger eingestuft werden. Diese Wichtigkeit wird durch einen mathematischen Ansatz von Eigenwerten und Eigenvektoren definiert.

Man kann sich das Verfahren gut als einen gerichteten Graphen vorstellen, bei dem Webseiten durch Knoten dargestellt werden und Kanten die Hyperlinks darstellen. Die Rang einer Webseite wird dann iterativ berechnet, wobei beachtet wird, wie viele eingehende Links diese Webseite hat und welcher Rang die Webseiten haben die diese Webseite referenzieren.

Hier ist ein Beispiel eines Graphen
#import "@preview/diagraph:0.3.3" : *
$
#raw-render(
```dot
digraph PageRank {
  rankdir=LR;
  splines=ortho;
  overlap=true;
  nodesep=0.75;
  ranksep=0.75;


  { rank = min; Facebook; THWS; }

  { rank = same; Youtube; }

  { rank = max; Amazon; Netflix; }

  Facebook -> { Youtube Amazon THWS };
  Youtube  -> { Facebook THWS Netflix };
  Amazon   -> { Netflix Youtube };
  THWS     -> { Youtube Facebook };
  Netflix  -> { Amazon };
}
```)
$

=== Verfahren
Die Grundlegende Idee hinter dem PageRank Algorithmus ist durch eine Markov-Kette definiert. Das Internet ist als großer Graph dargestellt, bei dem jede Webseite ein State einer Markov-Kette ist. Ein Nutzer (oder auch "random surfer") kann sich von einer Webseite zur nächsten über das klicken von links bewegen. Die Wahrscheinlichkeit, dass der Nutzer nach einer Anzahl an klicks auf einer gewissen Webseite landet, ist abhäüngig von der Struktur des Internets und der Hyperlinkverteilung.

==== Markov-Ketten
In einer Markov-Kette werden die Übergangswahrscheinlichkeiten zwischen Zuständen (in diesem Fall Seiten) durch eine Übergangsmatrix dargestellt. Die Elemente dieser Matrix stellen die Wahrscheinlichkeit dar, von einer Seite zu einer anderen zu wechseln. Um den PageRank zu berechnen, wird die Übergangsmatrix auf aufeinanderfolgende Potenzen erhöht und das Eigenwertproblem gelöst, um den stabilen Zustand dieses Prozesses zu finden.

Der Prozess kann mathematisch wie folgt dargestellt werden:

$
p = M p
$

Wobei:
    - *$p$* ist der PageRank-Vektor (die Wahrscheinlichkeitsverteilung über die Seiten).
    - *$M$* ist die Übergangsmatrix, die die Webstruktur darstellt.

Da das Web jedoch extrem groß ist und viele Seiten mit unterschiedlichen Linkstrukturen enthält, ist die direkte Berechnung des PageRank unpraktisch. Stattdessen wird eine Näherungsmethode namens Power Iteration verwendet, um den Eigenvektor zu ermitteln, der dem Eigenwert 1 (dem Haupteigenvektor) entspricht, der die stationäre Verteilung eines zufälligen Surfers darstellt.

=== Zurück zum Eigenwertproblem
Der Lösungsprozess für PageRank kann auf ein Eigenwertproblem reduziert werden. Aus der linearen Algebra wissen wir, dass, wenn eine Matrix *$M$* einen Eigenwert von 1 hat, es einen von Null verschiedenen Eigenvektor *$p$* gibt, so dass:

$
M p = p
$

Das bedeutet, dass der Eigenvektor $p$ der Gleichgewichtsvektor ist, der sich nach wiederholter Anwendung der Übergangsmatrix $M$ nicht ändert. Im Zusammenhang mit PageRank entspricht dieser Eigenvektor der relativen Wichtigkeit oder dem Ranking jeder Seite im Web.

Der PageRank-Vektor kann durch die folgenden Schritte ermittelt werden:

- *Initialisierung:* Beginnen Sie mit einer beliebigen Wahrscheinlichkeitsverteilung über alle Seiten, häufig eine Gleichverteilung, bei der jede Seite die gleiche Wahrscheinlichkeit hat.

- *Iteration:* Multiplizieren Sie den aktuellen Wahrscheinlichkeitsvektor mit der Übergangsmatrix *$M$* (oder verwenden Sie eine leicht modifizierte Version, um zufällige Sprünge zu berücksichtigen), und zwar so lange, bis der Vektor zu einem stabilen Zustand konvergiert.

- *Konvergenzprüfung:* Die Iteration wird so lange fortgesetzt, bis die Änderung des PageRank-Vektors zwischen zwei aufeinanderfolgenden Iterationen kleiner als ein vorgegebener Schwellenwert ist, was bedeutet, dass der Algorithmus konvergiert hat.

In der Praxis bedeutet dies, dass der größte Eigenwert (*1*) der Übergangsmatrix *$M$* gesucht wird. Der entsprechende Eigenvektor stellt die relative Wichtigkeit (PageRank) der einzelnen Webseiten dar.

=== Markov-Ketten und Eigenwertproblem

Die Verbindung zum Eigenwertproblem ergibt sich daraus, dass die PageRank-Berechnung auf der Suche nach dem dominanten Eigenvektor einer stochastischen Matrix (der Übergangsmatrix des Webgraphen) beruht.

Die Übergangsmatrix *$M$* ist eine stochastische Matrix, was bedeutet, dass jede Spalte die Summe 1 ergibt und ihre Eigenwerte innerhalb des Einheitskreises in der komplexen Ebene liegen. Wenn man den Eigenvektor findet, der dem Eigenwert 1 entspricht, kann man die stationäre Verteilung der Markov-Kette berechnen, was genau das ist, was PageRank berechnet.

Betrachten wir das Beispiel des oberen Graphen:
$
#raw-render(
```dot
digraph PageRank {
  rankdir=LR;
  splines=ortho;
  overlap=true;
  nodesep=0.75;
  ranksep=0.75;


  { rank = min; Facebook; THWS; }

  { rank = same; Youtube; }

  { rank = max; Amazon; Netflix; }

  Facebook -> { Youtube Amazon THWS };
  Youtube  -> { Facebook THWS Netflix };
  Amazon   -> { Netflix Youtube };
  THWS     -> { Youtube Facebook };
  Netflix  -> { Amazon };
}
```)
$

Die Pfeile zeigen an, welche Websites Links zu anderen Websites haben. Ziel ist es, dasselbe Konzept des PageRank mit Hilfe von Eigenwerten und Eigenvektoren anzuwenden, um die Bedeutung jeder Website auf der Grundlage der Linkstruktur zu berechnen.

Die Übergangsmatrix *$M$* ist eine stochastische Matrix, was bedeutet, dass jede Spalte die Summe *1* ergibt und ihre Eigenwerte innerhalb des Einheitskreises in der komplexen Ebene liegen. Wenn man den Eigenvektor findet, der dem Eigenwert 1 entspricht, kann man die stationäre Verteilung der Markov-Kette berechnen, was genau das ist, was PageRank berechnet.

Wir können den Graphen als Übergangsmatrix *$M$* darstellen, wobei jede Zeile und Spalte einer der Websites entspricht. Der Wert in Zeile *$i$* und Spalte *$j$* steht für die Wahrscheinlichkeit, dass ein zufälliger Surfer von Website *$i$* zu Website *$j$* wechselt.

In diesem Fall können wir von einem einfachen Ansatz ausgehen, bei dem eine Website mit mehreren ausgehenden Links die gleiche Wahrscheinlichkeit auf ihre Links verteilt. Websites ohne ausgehende Links (wie die THWS) werden mit einem Teleportationsfaktor behandelt (zufälliger Sprung zu einer beliebigen Website).

Hier ist die Übergangsmatrix *$M$* auf der Grundlage des Graphen:

$
M = mat(
  -,  F,    Y,    A,    T,    N;
  F,  0,    1/3,  1/3,  1/3,  0;
  Y,  1/3,  0,    0,    1/3,  1/3;
  A,  0,    1/2,  0,    0,    1/2;
  T,  1/2,  1/2,  0,    0,    0;
  N,  0,    0,    1,    0,    0;
)
$

Zur Berechnung des stationären Vektors (PageRank-Vektor) wird der Eigenvektor mit dem Eigenwert 1 ermittelt. Dazu kann die Potenziteration oder ein anderer Eigenwertalgorithmus verwendet werden. Der resultierende PageRank-Vektor gibt die relative Bedeutung jeder Seite im Netz an.

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
