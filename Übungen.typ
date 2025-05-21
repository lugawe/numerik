#set page(numbering: "1")

#set text(
  font: "New Computer Modern",
  size: 12pt,
  lang: "de",
)

#set par(justify: true)

= Übung 1 - Eigenwerte berechnen

Bestimmen Sie die, falls vorhanden, reellen Eigenwerte folgender Matrizen:

a) $A = mat(1, 1; 1, 1)$ #h(1fr)
b) $A = mat(2, 0; 0, 3)$ #h(1fr)
c) $A = E_3$ #footnote[Die Einheitsmatrix aus $RR^(3 crossmark 3)$] #h(1fr)
d) $A = mat(1, -2; 2, 1)$

#pagebreak()

= Übung 1 - Lösungen

Lösungen

a) Lösung: $lambda_1 = 0$, $lambda_2 = 2$

$
det(mat(1, 1; 1, 1) - E_2) &= 0 \
det mat(1 - lambda, 1; 1, 1 - lambda) &= 0 \
(1 - lambda)^2 - 1^2 &= 0 \
1 - 2 lambda + lambda^2 - 1 &= 0 \
- 2 lambda + lambda^2 &= 0 \
lambda (-2 + lambda) &= 0 \
$

b) Lösung: $lambda_1 = 2$, $lambda_2 = 3$ (siehe Hauptdiagonale)

$
det(mat(2, 0; 0, 3) - E_2) &= 0 \
det mat(2 - lambda, 0; 0, 3 - lambda) &= 0 \
(2 - lambda)(3 - lambda) - 0^2 &= 0
$

c) Lösung: Gleiches Prinzip wie bei b) => $lambda = 1$

d) Lösung: es gibt keine reellen Eigenwerte

$
det(mat(1, -2; 2, 1) - E_2) &= 0 \
det mat(1 - lambda, -2; 2, 1 - lambda) &= 0 \
(1 - lambda)^2 - (-2)2 &= 0 \
1^2 - 2 lambda + lambda^2 + 4 &= 0 \
lambda^2 - 2 lambda + 5 &= 0 | "Mitternachtsformel" \
lambda_("1,2") &= (-(-2) plus.minus sqrt((-2)^2 - 4 dot 1 dot 5)) / (2 dot 1) \
lambda_("1,2") &= (2 plus.minus sqrt(-16)) / (2)
$

Übung 2 :

Gegeben sei die Matrix

$ A= mat(3.-1,0;
2,0,0;
-2,2.-2) $

Berechnen Sie die Eigenwerte und die Eigenvektoren der Matrix.

Lözung 2:

Eigenwerte berechnen:

\lösen wir das Gleichungssystem:

$ det(A−λ I)=0 $

$ (A−λ I) = mat(3-λ, -1,0;
2,0-λ,0;
-2,2,-2-λ) $
\ Nun berechnen wir die Determinante dieser Matrix:

Wir entwickeln die Determinante nach der dritten Spalte (da sie zwei Nullen enthält)

$   det(A- λ.I) = 0.  det mat(2,-λ;
-2,2;) - 0 dot det mat(3-λ,-1;
-2,2;) +(-2-λ) dot mat(3-λ,-1;
2,λ;)= 0 $ 
$ =(−2−λ)⋅[(3−λ)(−λ)−(−1)(2)] = 0 $
$ (3−λ)(−λ)=−3λ+λ^2\
⇒=(−2−λ)⋅(λ^2−3λ+2)=0 $
$ =(-2-λ)(λ−1)(λ−2) = 0 $
Also sind die Eigenwerte:
$ λ_1=-2, λ_2=1, λ_3=2 $\
Eigenvektoren bestimmen

$ (A−λ I)⋅v=0 $
*Für λ=−2:*

$A- (-2).I= mat(3-(-2), -1,0;
2,0-(-2),0;
-2,2,-2-(-2)) =  mat(5, -1,0;
2,2,0;
-2,2,0)$
Löse:

$ mat(5, -1,0;
2,2,0;
-2,2,0)dot vec(x_1,x_2,x_3) =0$

$−2x_1+2x_2=0⇒x_1=x_2$

$2x_1+2x_2=0⇒x_1=−x_2⇒x_1=x_2 "und" x_1=−x_2⇒x_1=x_2=0$

Daher ist $x_1=x_2=0$, z beliebig ⇒ Eigenvektor:
$v_1=k_1 dot vec(0,0,1)$

*Für λ=1:*

$A- (1).I= mat(3-1, -1,0;
2,0-1,0;
-2,2,-2-1)=  mat(2, -1,0;
2,-1,0;
-2,2,-3)$

Löse:

$ mat(2, -1,0;
2,-1,0;
-2,2,-3)dot vec(x_1,x_2,x_3) =0$

ereste Gleichung:

$2x_1−x_2=0⇒x_2=2x_1$

Dritte:
$−2x_1+2x_2−3x_3=0⇒−2x_1+4x_1−3x_3=0⇒2x_1=3⇒x_3= 2/3x_1$

⇒ Eigenvektor:
$v_2=k_2 dot vec(1,2,2/3)$

*Für λ=2:*
$A- (2).I= mat(3-2, -1,0;
2,0-2,0;
-2,2,-2-2)=  mat(1, -1,0;
2,-2,0;
-2,2,-4)$
Löse:

$ mat(1, -1,0;
2,-2,0;
-2,2,-4)dot vec(x_1,x_2,x_3) =0$

Erste Gleichung:

$x−x_2=0⇒x=x_2$

Dritte:

$−2x_1+2x_2−4x_3=0⇒−4x_3=0⇒x_3=0$

⇒ Eigenvektor:

$v_3= k_3 dot vec(1,1,0)$

Zusammenfassung

Eigenwerte:
$ λ_1=-2, λ_2=1, λ_3=2 $\
Zuordnung Eigenvektoren:

$λ_1=-2:v_1 = k_1 dot vec(0,0,1)$

$λ_2=1:v_2=k_2 dot vec(1,2,2/3)$

$λ_3=2 :v_3= k_3 dot vec(1,1,0)$
