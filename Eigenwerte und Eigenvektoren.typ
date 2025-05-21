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

#align(center, [
  #text(size: 28pt)[
    Eigenwerte und Eigenvektoren \ Basics und Anwendungen
  ]
  \ \
  Michael Winsauer - #link("mailto:michael.winsauer@study.thws.de", [michael.winsauer\@study.thws.de])  \
  Gülsüm Erboga - #link("mailto:guelsuem.erboga@study.thws.de", [guelsuem.erboga\@study.thws.de]) \
  Luis Weich - #link("mailto:luis.weich@study.thws.de", [luis.weich\@study.thws.de])
])

\ \

#outline(indent: auto)

#pagebreak()

#outline(
  title: [Abbildungen],
  target: figure.where(kind: image),
)

#pagebreak()

= *Eigenwerte und Eigenvektoren*

== Einführung

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

Wenn wir eine quadratische Matrix $A in RR^(n crossmark n)$ und
einen Spaltenvektor $arrow(v) in RR^n$ multiplizieren bekommen wir als Ergebnis wieder einen
Spaltenvektor. Dieser Spaltenvektor zeigt jedoch meistens in ganz verschiedene Richtungen
und hat mit dem ursprünglichen Vektor $arrow(v)$ nichts mehr gemeinsam.
Manchmal jedoch bekommen wir einen Vektor als Ergebnis, der sich als vielfaches
von dem ursprünglichen Vektor $arrow(v)$ darstellen lässt.

Allgemein lässt sich sagen, dass jeder Vektor $arrow(v)$, den man mit einer
Matrix $A$ multipliziert und dessen
Ergebnis ein vielfaches von dem ursprünglichen Vektor $arrow(v)$ ist,
nennt man *Eigenvektor*. Die dazugehörige Zahl $lambda$ mit der der Vektor $arrow(v)$ im 
Ergebnis multipliziert bzw. skaliert wird nennt man *Eigenwert*.

Wenn wir eine Gleichung in der folgenden Form vor uns haben, können wir über
das _"Eigenwertproblem"_ sprechen:

#text(size: 20pt)[
  $ A arrow(v) = lambda arrow(v) $
]

Hierbei gilt
$A in RR^(n crossmark n)$,
$arrow(v) in RR^n$ mit $arrow(v) eq.not 0$ und
$lambda in RR$.
Der Nullvektor 0 ist kein zulässiger Eigenvektor, da die Gleichung $A 0 = lambda 0$ für jede Matrix A und jede Zahl λ erfüllt ist und somit keinerlei Erkenntnisgewinn bringt.

Im Folgenden werden wir das Eigenwertproblem erklären, Beispiele zeigen und
anschaulich machen.
Außerdem werden wir Anwendungen aus dem echten Leben zeigen und erklären.
Begleitend dazu zeigen wir Python Code Beispiele.

#pagebreak()

== Geometrische Anschauung

Geometrisch betrachtet werden Eigenvektoren durch die Transformation lediglich in ihrer Länge
verändert.
Ihre Richtung bleibt bei positivem Eigenwert erhalten, kehrt sich bei negativem Eigenwert jedoch um. Man kann sagen der

$
"Vektor wird" cases(
  "gestreckt " & "für " lambda > 1 \
  "gestaucht " & "für " 0 < lambda < 1 \
  "nicht verändert " & "für " lambda = 1 \ 
  "zu" 0 & "für " lambda = 0
)
$

Ist $lambda < 0$ wird dazu noch die Richtung umgekehrt.

Diese Längenunterschiede ergeben sich durch eine Skalierung, die sich durch die
Gleichung $arrow(v)_text("skaliert") = lambda arrow(v)$ beschreiben lässt.

\

In @plot_eigen1 wird beispielsweise die Gleichung
$mat(2, 1; 1, 2) dot vec(1, 1) = 3 dot vec(1, 1)$
dargestellt.

#figure(
  image("plot_eigen1.png", width: 80%),
  caption: [Vektor und skalierter Vektor in $RR^2$],
) <plot_eigen1> \

#pagebreak()

In @plot_eigen2 wird beispielsweise die Gleichung
$mat(-1, 0; 0, 2) dot vec(1, 0) = -1 dot vec(1, 0)$
dargestellt. Hier ändert der Eigenvektor $vec(1, 0)$ seine Richtung wegen $lambda < 0$.
Der grüne Vektor ist kein Eigenvektor, sondern
beschreibt $mat(-1, 0; 0, 2) dot vec(1, 1) = vec(-1, 2)$.

#figure(
  image("plot_eigen2.png", width: 80%),
  caption: [Vektor und umgedrehter Vektor in $RR^2$],
) <plot_eigen2> \

Zur Veranschaulichung wurden die Vektoren in diesem Beispiel
im $RR^2$ dargestellt, grundsätzlich ist das Konzept jedoch auch auf $RR^n$ übertragbar.

#pagebreak()

== Lösungsverfahren

=== Berechnung der Eigenwerte

Um die Eigenwerte einer Matrix $A in RR^(n crossmark n)$ zu bestimmen, verwenden wir die bereits bekannte
Gleichung $A arrow(v) = lambda arrow(v)$ und formen diese mit Hilfe der Einheitsmatrix $E_n$ wie folgt um:

$
& A arrow(v) && = lambda arrow(v) && | "Einheitsmatrix" E_n "einfügen" "(" E_n arrow(v) = arrow(v) ")" \
<==> & A arrow(v) && = lambda E_n arrow(v) && | - lambda E_n arrow(v) \
<==> & A arrow(v) − lambda E_n arrow(v) && = 0 && | arrow(v) "ausklammern" \
<==> & (A − lambda E_n) arrow(v) && = 0
$

Mit bekannten Resultaten uber die Lösbarkeit von quadratischen
linearen Gleichungssysteme erhalten wir:

$ λ "ist Eigenwert von" A <==>&& "Ker"(A − λ E n) "ist nicht-trivial" \ 
  <==> &&A − λ E n  " ist nicht invertierbar"\
  <==> && det(A − λ E_n) = 0 $  

*Begründung:* Sei λ∈R ein Skalar. Wir betrachten die Gleichung
$ (A−λ E_n)x=0.  $
Damit diese Gleichung eine nicht-triviale Lösung $𝑥≠0 $ besitzt, darf die Matrix $A−λ E_n$ nicht invertierbar sein.
Denn wäre $A−λ E_n$ *invertierbar*, so könnte man beide Seiten der Gleichung mit der Inversen multiplizieren:
$ x=(A−λ E_n)^(−1) dot 0=0, $
und es gäbe nur die triviale Lösung x=0, also kein Eigenwert.
Daher folgt:
Eine nicht-triviale Lösung existiert genau dann, wenn die Matrix nicht invertierbar ist (singulär). Und das ist genau dann der Fall, wenn gilt:
$ det(A − λ E_n) = 0  $

Diese Gleichung stellt ein Polynom n-ten Grades in λ dar, das *charakteristische Polynom* von A genannt wird.
$ #table(  [$P_A$(λ) = $det(A − λ E_n)$ ] )  $ 

Um die Eigenwerte zu bestimmen, löst man dieses Polynom nach 
λ auf.

Da das charakteristische Polynom vom Grad n ist, hat es höchstens 
n Nullstellen. Das bedeutet, dass die Matrix A höchstens n Eigenwerte besitzt.


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

=== Bestimmung der Eigenvektoren
Um einen Eigenvektor zu berechnen, braucht man zuerst den zugehörigen Eigenwert.


- Fur jeden Eigenwert  λ mussen nun alle Lösungen $v≠0$ des homogenen LGS
$ #table([(A − λ$E_n$)v = 0]) $
gefunden werden. Diese sind die Eigenvektoren von A zum Eigenwert λ

- Wir lösen das System mit einem Verfahren wie dem Gauß-Algorithmus.

- Wenn die Matrix A−λI nicht invertierbar (singulär) ist, hat das System keine eindeutige Lösung.

  In diesem Fall wählen wir eine der Unbekannten beliebig und berechnen die anderen daraus
\
=== Einfaches Beispiel
   Ermitteln Sie die Eigenwerte für die Matrix $ mat(0, 2; 2, 3;)$  
   Die charakteristische Gleichung gibt uns
   $ mat(0-λ, 2;
        2, 3-λ) =0 $

Deshalb haben wir
$ −λ(3−λ)−4=0⇒λ^2−3λ−4=0  $

Wir erhalten zwei Eigenwerte:
$ λ_1=4, λ_2=−1$

*VERSUCHEN SIE ES!* Ermitteln Sie die Eigenvektoren für die beiden obigen Eigenwerte.

*a)*  $lambda_1$  = 4:

Um den ersten Eigenvektor zu bestimmen, setzen wir $lambda_1$  = 4 in die Gleichung (A−λI)v=0 ein:

$ mat(0-4, 2;
        2, 3-4) dot vec(x_1,x_2) = vec(0,0)  $

$ mat(-4,2;
      2, -1;) dot vec(x_1,x_2) = vec(0,0) $

Dies ergibt zwei Gleichungen:
$ -4 x_1 + 2 x_2 = 0 $
$ 2 x_1 -x_2 = 0 $
Beide Gleichungen zeigen, dass $x_2$ = $2x_1$ ist. Daher kann der erste Eigenvektor wie folgt dargestellt werden:

$ v_1 = k_1 vec(1,2) $

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
$ v_2 = k_2 vec(-2,1) $ wobei $k_2 eq.not 0 $


=== Komplexeres Beispiel

Gegeben sei die Matrix
$ A = mat(1, 2, -1;
      0,3,0;
      -1,2,1;) $
Berechnen Sie die Eigenvektoren.

*Lözung:*

_Schritt 1: Eigenwerte berechnen:_

1.1) Bilde $A - λ dot I$

1.2) Berechne det(A- λ.I)

1.3) Nulstellen von det(A-λ.I)


$  A - λ.I = mat(1−λ,2,-1;
                    0,3−λ ,0;
                    -1,2,1-λ;) $
                    
 Determinante berechnen:
 
$   det(A- λ.I) = (1−λ).  det mat(3−λ ,0;
2,1−λ;) - 0 dot det mat(2,-1;
2, 1−λ;) +(-1) dot det mat(2,-1;
3-λ,0;) $ 

$ = (1−λ) dot [(3-λ) dot (1-λ)- 2 dot 0]  + (-1) dot [2 dot 0 - (-1) (3-λ)] $

$ = (1-λ)dot(3-λ)dot(1-λ) - 0 +(-1)dot(3-λ) $  

$ = (1-λ)dot(3-λ)dot(1-λ) -(3-λ) $

$ = (3-λ)(1-λ)^2-1 $

 Nulstellen von det(A-λ.I)

 $ (3-λ)(1-λ)^2-1 = 0 $
 $ (3-λ)(1-2λ +λ^2 -1)=0 $
 $ (3-λ)λ(-2+λ)=0 $

 Die Eigenwerte sind:

 $  lambda_1=0, lambda_2=3, lambda_3=2 $  

_Schritt 2: Eigenvektoren berechnen_

Für jeden Eigenwert λ lösen wir das Gleichungssystem:

$ (A - λ I) dot v = 0 $

*Für λ = 0*

$ (A-lambda_1I)x = mat((1-0),2,-1;
                         0,(3-0),0;
                         -1,2,1-0;) vec(x_1,x_2,x_3) = vec(0,0,0) $
 

Lösung linearer Gleichungssysteme mit dem Gauß-Algorithmus

$ cases(x_1+2_x_2-x_3=0,
3x_2=0,
-x_2+2x_2+x_3=0) $  


Erweiterte Matrix:
$  mat(1, 2, -1,|0;
      0,3,0,|0;
      -1,2,1,|0;) $
      

Gaußsche Eliminierung:
      $ R 3= R 1 + R 3 ==> mat(1,2,-1,| 0;
                              0,3,0,| 0;
                            0,4,0,| 0;) $

    $ R 3 \u{0027} = 4 dot R 2 -3  dot R 3 ==>mat(1,2,-1,| 0;
            0,3,0,| 0;
            0,0,0,| 0;) $
            
Lösung des Gleichungssystems:

 $x_1 +2 dot x_2 -1dot x_3=0 ==> x_1 +2x_2 -x_3=0 $
 
 $3x_2=0 ==> x_2=0$
 
 Einsetzen in die erste Zeile:
 
 $x_1+2 dot 0-x_3=0 ==> x_1-x_3=0 ==> x_1=x_3 $

 Da $x_3$ eine freie Variable ist, setzen wir $x_3$= t (mit t ∈ R).
 
Also:

$x_1=t, x_2=0, x_3=t $ für eine beliebiges t ∈ R \u{005C}{0}

    $ v_1 = t vec(1,0,1) $

    
*Für $ λ_2 = 3$*
$ (A-lambda_1I)x = mat((1-3),2,-1;
                         0,(3-3),0;
                         -1,2,(1-3);) vec(x_1,x_2,x_3) = vec(0,0,0) $

Dies ergibt die reduzierte Matrix:
 $                   mat(-2,2,-1;
                         0,0,0;
                         -1,2,-2;) vec(x_1,x_2,x_3) = vec(0,0,0) $
Lineares Gleichungssystem: 
$ cases(-2x_1+2x_2-x_3 = 0,
         0=0,
        -x_1+2x_2-2x_3 = 0,
         ) $
Erweiterte Matrix:
$ mat(-2,2,-1,|0;
     0,0,0,|0;
     -1,2,-2,|0;)  $     

Gaußsche Eliminierung:


$ R 3 = R 3- 1/2R 1$

$(-1) -1/2  (-2) = -1 +1=0$

$ 2- 1/2 dot 2 = 2-1 =1$    
$-2-1/2(-1)=-2+1/2 = -3/2$


$ ==> mat(-2,2,-1,|0;
     0,0,0,|0;
     0,1,-3/2,|0;)  $  



R1 \u{0027} = -1/2.R1
$ ==> mat(1,-1,1/2,|0;
     0,0,0,|0;
     0,1,-3/2,|0;)  $ 

Lösung des Gleichungssystems:

1.Gleichung:

$x_1-x_2+1/2x_3=0 ==> x_1=x_2-1/2x_3$

2.Gleichung:

$x_2-3/2x_3=0 ==> x_2=3/2x_3$

Da $x_3$ eine freie Variable ist, setzen wir $x_3$= z (mit z ∈ R).

$x_2=3/2z$

$x_1=3/2z -1/2z=z$

Der Eigenvektor ist somit:

$ v_2=z vec(1,3/2,1) $


*Für $lambda_3 = 2 $*

$ (A-lambda_1I)x = mat((1-2),2,-1;
                         0,(3-2),0;
                         -1,2,(1-2);) vec(x_1,x_2,x_3) = vec(0,0,0) $

Dies ergibt die reduzierte Matrix:
 $                   mat(-1,2,-1;
                         0,1,0;
                         -1,2,-1;) vec(x_1,x_2,x_3) = vec(0,0,0) $
Lineares Gleichungssystem: 
$ cases(-1x_1+2x_2-x_3 = 0,
         1x_2=0,
        -x_1+2x_2-1x_3 = 0,
         ) $

Lösung des Gleichungssystems:

Zweite Gleichung:

$x_2=0$

Einsetzen von $x_2=0$ in die beiden anderen Gleichungen:

Erste Gleichung:

$-1x_1+2.0-1x_3=0 ==> -x_2-x_3=0$

$x_1=-x_3$

Dritte Gleichung:

$-1x_1+2 dot 0 -1x_3=0 ==> -1x_1-x_3=0 $  

Dies ist die gleiche Gleichung wie die erste, also gibt es keine zusätzlichen Informationen.
Da $x_3$ eine freie Variable ist, setzen wir 
   $x_1$= -k, $x_2=0$, $x_3=k$ 

Der Eigenvektor ist somit:

$ v_3=k vec(-1,0,1) $

Eigenvektoren:

$ v_1 = t vec(1,0,1) , v_2=z vec(1,3/2,1) ,v_3=k vec(-1,0,1) $

Dabei sind t,z und k beliebige Skalierungsfaktoren (t,z,k∈R).

#pagebreak()

== Bemerkungen

Eigenwerte können auch komplex sein. Wenn wir
beispielsweise die Matrix $A = mat(0, -1; 1, 0)$ hernehmen und von dieser das charakteristische
Polynom berechnen kommen wir auf

$
& det ( A - lambda E_2 ) &&= 0 \
<==> & det mat(0 - lambda, -1; 1, 0 -lambda) &&= 0 = lambda^2 + 1 \
<==> & lambda^2 &&= -1
$

und sehen hierbei direkt, dass $lambda^2 = -1$ keine reellen Lösungen besitzt.

Eigenvektoren die vielfache von einander sind stellen den "gleichen" Eigenvektor dar, denn es gilt:

$ A(x arrow(v)) = x A arrow(v) = x lambda arrow(v) = lambda (x arrow(v)) $

Daraus folgt, dass Eigenvektoren von unterschiedlichen Eigenwerten immer linear unabhängig voneinander
sind.

Die Spur einer Matrix,
also die Summe der Elemente auf der Hauptdiagonale, ist gleich der Summe der Eigenwerte.

== Python-Beispiele

In @beispiel_code1 sehen wir wie wir in Python mit Hilfe von NumPy Eigenwerte und Eigenvektoren berechnen.

In @beispiel_code2 sehen wir wie wir in Python mit Hilfe von NumPy die Determinante berechnen.

In @beispiel_code3 sehen wir wie wir in Python mit Hilfe von NumPy und SymPy das charakteristische
Polynom berechnen.

#pagebreak()

= Anwendungen

== Google PageRank
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

#let google_pagerank_example1 = read("google_pagerank_example1.py")
#raw(google_pagerank_example1, lang: "python")

#pagebreak()

== Kompression

In vielen Anwendungen – von der Bild- und Videobearbeitung bis zur Signalanalyse – spielt die effiziente Speicherung und Übertragung großer Datenmengen eine zentrale Rolle. Eine elegante Methode zur Daten­kompression nutzt ebenfalls die Zerlegung in Eigenwerte und Eigenvektoren. Die Grundidee ist, dass echte Datensätze in einem geeigneten Koordinatensystem meist nur wenige dominante Richtungen (Eigenvektoren) besitzen, während alle anderen Komponenten vernachlässigbar klein sind.

=== Idee der Dimensionsreduktion

Gegeben sei eine Datenmatrix $A in R^(m times n)$, deren Spalten einzelne Beobachtungen darstellen. 

1. Wir berechnen zunächst die Kovarianzmatrix $C = (1/n) dot A dot A^T$.  
2. Anschließend bestimmen wir die Eigenpaare $(lambda_i, v_i) "von" C$, sortiert nach absteigenden Eigenwerten $lambda_1 ≥ lambda_2 ≥ ... ≥ lambda_m$.  
3. Die ersten $k$ Eigenvektoren $v_1$ bis $v_k$ fassen bereits den Großteil der Streuung zusammen.  
4. Wir komprimieren die Daten, indem wir nur die Projektionen auf diese $k$ Eigenvektoren speichern:  
   $"komprimierte Daten" = (v_1, …, v_k)^T dot A$  
5. Zur Rekonstruktion multiplizieren wir die komprimierten Daten wieder mit $(v_1, …, v_k)$:  
   rekonstruierte Daten = $(v_1, …, v_k) dot "komprimierte Daten"$

Je kleiner $k$, *desto höher die Kompressionsrate*. Der entstehende *Informationsverlust* lässt sich durch die *Summe der weggelassenen Eigenwerte* quantifizieren.

=== Beispiel Bildkompression

Ein Bild der Größe $m times n$ kann als ein Vektor in $RR^(m times n)$ betrachtet werden oder blockweise verarbeitet werden. Durch das oben beschriebene Verfahren lassen sich die visuellen Daten stark reduzieren:

Je nach Wahl von $k$ erhält man eine gute Annäherung an das Original mit deutlich weniger gespeicherten Zahlen.

#figure(
  image("kompression_example1.png", width: 40%),
  caption: [Kompression und Rekonstruktion],
) <kompression_example1> \

#let kompression_example1 = read("kompression_example1.py")
#raw(kompression_example1, lang: "python")

#pagebreak()

= Anhang

== Code zu @plot_eigen1

#let plot_eigen1 = read("plot_eigen1.py")
#raw(plot_eigen1, lang: "python")

#pagebreak()

== Beispiel-Code 1 <beispiel_code1>

#let beispiel_code1 = read("eigen.py")
#raw(beispiel_code1, lang: "python")

== Beispiel-Code 2 <beispiel_code2>

#let beispiel_code2 = read("det.py")
#raw(beispiel_code2, lang: "python")

== Beispiel-Code 3 <beispiel_code3>

#let beispiel_code3 = read("poly.py")
#raw(beispiel_code3, lang: "python")

#pagebreak()

= Quellen

- Keller, A. Handout Eigenwerte, Spektralsatz. THWS, 2025.
- M. Turk & A. Pentland, „Eigenfaces for Recognition“, Journal of Cognitive Neuroscience, Vol. 3, No. 1, 1991, S. 71–86.
- Guido Walz, Eigenwerte und Eigenvektoren von Matrizen, Klarzext für NIchtmathematiker. 2025
- 2 Bayen, A. and Kong, Q. and Siauw, T. Python Programming and Numerical Methods. Academic Press, 1. Edition, 2020.
