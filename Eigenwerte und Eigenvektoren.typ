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
einen Spaltenvektor $arrow(v) in RR^n$ multiplizieren bekommen wir als Ergebnis wieder einen
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

Geometrisch betrachtet werden Eigenvektoren durch die Transformation lediglich in ihrer Länge
verändert.
Ihre Richtung bleibt bei positivem Eigenwert erhalten, kehrt sich bei negativem Eigenwert jedoch um. Man kann sagen der

$
"Vektor wird" cases(
  "gestreckt " & "für " lambda > 1 \
  "gestaucht " & "für " 0 < lambda < 1 \
  "nicht verändert " & "für " lambda = 1 \ 
  "zu 0" & "für " lambda = 0
)
$

Ist $lambda < 0$ wird dazu noch die Richtung umgekehrt.

Diese Längenunterschiede ergeben sich durch eine Skalierung, die sich durch die
Gleichung $arrow(v)_text("skaliert") = lambda arrow(v)$ beschreiben lässt.

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

*Bemerkung*

*1.* Dass der Null vektor, nennen wir ihn 0, als Eigenvektor nicht zulässig ist, liegt daran, dass die Gleichung

 $ A 0 = lambda 0 $  
                                                
für jede Matrix A und jede Zahl λ erfüllt ist und somit keinerlei Erkenntnisgewinn bringt   

*2.* Ein Eigenvektor ist niemals eindeutig bestimmt. Hat man nämlich zu gegebener
 Matrix A einen Vektor v und eine Zahl λ gefunden, sodass Av = λv gilt, so kann
 man diesen Vektor mit einer beliebigen Zahl $a eq.not 0$ multiplizieren. Die Gleichung Aαv =λαv ist wegen Aαv = αAv und λαv = αλv ebenfalls richtig, also ist 
 auch αv ein Eigenvektor von A.


*3.* Wie in Beispiel 2.1 schon geschrieben wurde besagt Gl.(2.2), dass der Vektor v
 durch die Multiplikation mit der Matrix A nicht in seiner Lage verändert, sondern
 lediglich um den Faktor λ gestreckt bzw. gestaucht sowie– falls λ negativ ist– in
 seiner Richtung umgekehrt wird.


== Lösungsverfahren (Gülsüm)
== Berechnung der Eigenwerte

1. Schritt: Eigenwertgleichung
Zu Beginn haben wir die Eigenwertgleichung:

$ A v = λ v $  
Dabei ist:

*A* eine Matrix,

*v* ein Eigenvektor,

*λ* der Eigenwert.


Um die Gleichung zu vereinfachen, fügen wir die *Einheitsmatrix I* auf der rechten Seite hinzu. Die Einheitsmatrix verändert einen Vektor nicht, da *Iv=v* gilt. Daher wird die Gleichung zu:

 $ A v = λ I v $


Nun bringen wir alle Terme auf die linke Seite der Gleichung und erhalten:
                          
$ A v − λ I v = 0 $ 
Dies lässt sich als:
$ ( A − λ I ) v=0 $
umformen. Das Produkt der Matrix (A − λI) mit dem Vektor v muss also den Nullvektor ergeben.


Da v als Eigenvektor nicht der Nullvektor sein darf,  muss die Matrix A−λI einen Rangverlust haben, also die Determinante null sein. 

// 
/*Satz 2.1
Es sei A eine (n ×n)-Matrix und I die gleichgroße Einheitsmatrix. Eine Zahl
λ ist genau dann Eigenwert von A, wenn
                        
                             det(A − λI) = 0
ist.
}*/

Daher gilt:
$ det ( A − λ I ) = 0 $
Diese Gleichung stellt ein Polynom in Bezug auf $lambda$ dar, das als *charakteristisches Polynom* bezeichnet wird. Um die Eigenwerte der Matrix A zu bestimmen, lösen wir dieses Polynom nach $lambda$ auf.

Da das charakteristische Polynom ein Polynom n-ten Grades ist, hat es höchstens n Nullstellen. Das bedeutet, dass die Matrix A höchstens n Eigenwerte besitzt.

*Beispiel 1*

Ermitteln Sie die Eigenwerte für die Matrix
$ A = mat(1,2;
3,4;) $

 Berechnen wir nun A−λ·I:
 
  A − λ · I = $ mat(1-λ, 2;
              3, 4−λ;)$ 
              
Die Determinante ist:

det(A −λ·I) = (1−λ)(4−λ)−2·3 

Nun haben wir die charakteristische Gleichung:

$ λ^2 − 5 λ − 2 = 0 $  


Wir lösen dieses Polynom, um die Eigenwerte zu finden Dafür wenden wir die Mitternachtsformel an:

$ lambda = (−b ± sqrt(b^2 - 4 dot a dot c) ) /
( 2 dot a) $

$ lambda = (5 ± sqrt((-5)^2 - 4 dot 1 dot -2) ) /
( 2 dot 1) $

$ lambda = (5 ± sqrt(25+8) ) /
( 2 ) $
$ lambda = (5 ± sqrt(33) ) /
( 2 ) $
$ lambda = (5 ± 5.744) /
( 2 ) $


 $ λ 1 = 5.561, λ 2 = −0.561 $
 
 Die Eigenwerte der Matrix A sind:
 $ λ 1 = 5.561, λ 2 = −0.561 $

== Bestimmung der Eigenvektoren
Um einen Eigenvektor zu berechnen, braucht man zuerst den zugehörigen Eigenwert.

- Schreibe das lineare Gleichungssystem (A−λI)v=0 explizit auf, wobei die Unbekannten die Komponenten des Vektors v sind.


- Wir lösen das System mit einem Verfahren wie dem Gauß-Algorithmus.

- Wenn die Matrix A−λI nicht invertierbar (singulär) ist, hat das System keine eindeutige Lösung.

  In diesem Fall wählen wir eine der Unbekannten beliebig und berechnen die anderen daraus

  *Beispiel 2*
   Ermitteln Sie die Eigenwerte für die Matrix $ mat(0, 2; 2, 3;)$  
   Die charakteristische Gleichung gibt uns
   $ mat(0-λ, 2;
        2, 3-λ) =0 $

Deshalb haben wir
$ −λ(3−λ)−4=0⇒λ 2−3λ−4=0  $

Wir erhalten zwei Eigenwerte:
$ λ_1=4, λ_2=−1$

*VERSUCHEN SIE ES!* Ermitteln Sie die Eigenvektoren für die beiden obigen Eigenwerte.

*a)*  $lambda_1$  = 4:

Um den ersten Eigenvektor zu bestimmen, setzen wir $lambda_1$  = 4 in die Gleichung A−λI=0 ein:

$ mat(0-4, 2;
        2, 3-4) dot vec(x_1,x_2) = vec(0,0)  $

$ mat(-4,2;
      2, -1;) dot vec(x_1,x_2) = vec(0,0) $

Dies ergibt zwei Gleichungen:
$ -4 x_1 + 2 x_2 = 0 $
$ 2 x_1 -x_2 = 0 $
Beide Gleichungen zeigen, dass $x_2$ = $2x_1$ ist. Daher kann der erste Eigenvektor wie folgt dargestellt werden:

$ x_1 = k_1 vec(1,2) $

Hierbei ist $k_1$ ein Skalar (mit $k_1 eq.not 0$), solange das Verhältnis zwischen $x_2$ und $x_1$ gleich 2 ist, handelt es sich um einen Eigenvektor.

​Wir können überprüfen, ob der Vektor $vec(1,2)$ ein Eigenvektor ist, indem wir ihn in die Matrix einsetzen:
$ mat(0, 2; 2, 3;) dot vec(1,2) = vec(4,8) = 4 vec(1,2) $ 

*b)*  $lambda_2$ = -1
Auf ähnliche Weise setzen wir $lambda_2 = -1 $ ein und erhalten den zweiten Eigenvektor: 

$(A - λ I) dot v = 0$ 
$ mat(0, 2; 2, 3;) dot vec(x_1, x_2) = vec(0,0)$  

Dies ergibt das Gleichungssystem: 
1. $x_1 + 2x_2 = 0$  
2. $2x_1 + 4x_2 = 0$  

Da die zweite Gleichung ein Vielfaches der ersten ist, betrachten wir nur die erste:  
$ x_1 = -2x_2 $
$ x_2 = k_2 vec(-2,1) $ wobei $k_2 eq.not 0 $

Was ist der Ansatz um ein Eigenwertproblem zu berechen?

=== Einfaches Beispiel
=== Einfaches Beispiel
Gegeben sei die Matrix
$ A = mat(1, 2, 0;
      2, 1, 2;
      0, 2, 1) $
Berechnen Sie die Eigenvektoren.

*Lözung:*

Schritt 1: Eigenwerte berechnen:
1.Charakteristisches Polynom:
 $ det(A−λ I)= det mat(2−λ,1,0;
                    1,3−λ ,1;
                    0,1,2−λ;)  =0 $  

 Determinante berechnen:
 
$  |A|= (2−λ). det mat(3−λ ,1;
1,2−λ;) -1 dot det mat(1, 0;
1, 2−λ;) +0 dot mat(1,0;
1,2−λ;) $ 

$ =(2−λ) dot [(3-λ) dot (2-λ)- 1 dot 1] - 1 dot [1 dot (2-λ) -0 dot 1] +0 dot [1 dot 1 - 0 dot (3-λ)] $

$ = (2−λ)⋅(λ 2−5λ+5)−(2−λ)=0 $

$ = (2−λ)⋅[6−5λ+λ 2 −1]−(2−λ)=0 $

$ = (2−λ)[(λ−4)(λ−1)]=0 $

Die Eigenwerte sind:

 $  lambda_1=2, lambda_2=4, lambda_3=1 $  

Schritt 2: Eigenvektoren berechnen
Für jeden Eigenwert λ lösen wir das Gleichungssystem:

$ (A - λ I) dot v = 0 $

Für λ = 2
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

- *Initialisierung:* Begonnen wird mit einer beliebigen Wahrscheinlichkeitsverteilung über alle Seiten, häufig eine Gleichverteilung, bei der jede Seite die gleiche Wahrscheinlichkeit hat.

- *Iteration:* Der aktuelle Wahrscheinlichkeitsvektor wird mit der Übergangsmatrix *$M$* multipliziert. Das passiert so lange, bis der Vektor zu einem stabilen Zustand konvergiert.

- *Konvergenzprüfung:* Die Iteration wird so lange fortgesetzt, bis die Änderung des PageRank-Vektors zwischen zwei aufeinanderfolgenden Iterationen kleiner als ein vorgegebener Schwellenwert ist d.h. bis der Algorythmus also konvergiert hat.

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

In diesem Fall können wir von einem einfachen Ansatz ausgehen, bei dem eine Website mit mehreren ausgehenden Links die gleiche Wahrscheinlichkeit auf ihre Links verteilt. Websites ohne ausgehende Links werden mit einem Teleportationsfaktor behandelt.

Die Übergangsmatrix *$M$* aus der Grundlage des Graphen:

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

Der PageRank entspricht der stationären Verteilung $p$, die die Gleichung

$
p = p M
$

erfüllt. In dem Fall ist $p = (p_F, p_Y, p_A, p_T, p_N)$ ein Zeilenvektor mit $ sum_i p_i = 1 $

Mathematisch ist dies also das Eigenwertproblem:

$
p(M - I) = 0, lambda=1
$

Aus der Übergangsmatrix lässt sich folgendes Gleichungssystem abbliden:

$
"LGS"(M) = cases(
  p_F = 1/3p_Y + 1/2p_T,
  p_Y = 1/3p_F + 1/2p_A + 1/2p_T,
  p_A = 1/3p_F + 1p_N ,
  p_T = 1/3p_F + 1/3p_Y,
  p_N = 1/3p_Y + 1/2p_A,
  p_F + p_Y + p_A + p_T + p_N = 1
)
$

Dieses Gleichungssystem lässt sich jetzt anhand von unter anderem der Power-Iteration lösen. Power-Iteration ist ein Algorythmus, der es einfach macht den betragsgrößten Eigenwert $lambda_max$ und den zugehörigen Eigenvektor $v_max$ einer reellen Matrix $M ∈ RR^(n × n)$ zu approximieren. Die Power-Iteration nähert sich diesem Vektor durch sukzessives Anwenden von $M$. Zunächst muss der Initialvektor gewählt werden. Hier wird der Vektor $p^(0) = ( 1/n, 1/n, ... , 1/n), p^(0) ∈ RR^n$  wobei $n$ die Dimension der Matrix $M$ ist. In unserem Fall ist das also der Vektor:

$
p^(0) = (1/5, 1/5, 1/5, 1/5, 1/5)
$

Anschließend muss nun wie oben beschrieben der Zeilenvektor $p^(k)$ mit der Matrix $M$ iterativ multipliziert werden, was sich mathematisch so darstellen lässt.

$
p^(k+1) = p^(k)M
$

Üblicherweise wird zusätzlich ein Dämpfungsfaktor $alpha ∈ (0,1)$ verwendet, sodass auch "Dangling Nodes", also Webseiten ohne ausgehende Hyperlinks korrekt behandelt werden und das Verfahren effizienter konvergiert. Das lässt sich dann wiefolgt darstellen:

$
p^(k+1) = alpha p^(k) M + (1-a)/n (1, 1, ... 1)
$

Der Term $(1-alpha)/n (1, 1, ... 1)$ verteilt die restliche Wahrscheinlichkeit auf alle Seiten, wodurch der Dämpfungsfaktor erfolgreich eingebunden ist.

Dieser Prozess wird nun so lange wiederholt, bis ein der Algorythmus konvergiert. Das wird anhand einen Abbruchkriteriums festgelegt. 

$
Delta^k = || p^(k+1) -p^(k) ||_1 = sum_i |p_i^(k+1)-p_i^(k)|
$

Wenn $Delta^k < epsilon$ (z.B. $10^(-6)$), wird die Iteration abgebrochen und $p = p^(k+1)$ gesetzt.

Jetzt wenden wir dieses Prozedere auf unser Übergangsmatrix $M$ an. Die Initialisierung von $p$:
$
p^(0) = (1/5, 1/5, 1/5, 1/5, 1/5)
$

1. Iteration:

$
p^(0)M= (0.166667,0.266667,0.266667,0.133333,0.166667)
$

Dämpfung und Teleportation einbinden:

$
p^(1) = 0.85(0.166667, 0.266667, 0.266667, 0.133333, 0.166667) + 0.15(0.2, 0.2, 0.2, 0.2, 0.2) 
$

$
= (0.85 * 0.166667 + 0.03, ... ) = (0.171667, 0.256667, 0.256667, 0.143333, 0.171667) 
$

2. Iteration:

$
p^(1)M ≈ (0.157222, 0.257222, 0.228889, 0.142778, 0.213889)
$

Dämpfung und Teleportation

$
p(2)=0.85(0.157222,0.257222,0.228889,0.142778,0.213889)+0.15(0.2,0.2,0.2,0.2,0.2)
$

$
≈(0.163639,  0.248639,  0.224556,  0.151361,  0.211806)
$

Im Beispiel unserer Übergangsmatrix $M$ würden folgende Wichtigkeiten bzw. Ränge der Webseiten nach 20 Iterationen herauskommen:

$
#table(
  columns: 2,
  table.header(
    [Website],
    [PageRank],
  ),
  
  [Facebook], [0.1475],
  [YouTube],  [0.2459],
  [Amazon],   [0.2623],
  [THWS],     [0.1311],
  [Netflix],  [0.2131],
)
$
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
