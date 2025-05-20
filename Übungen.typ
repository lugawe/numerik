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
