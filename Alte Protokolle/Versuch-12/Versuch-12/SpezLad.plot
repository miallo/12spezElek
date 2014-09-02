reset
set xlabel '$\sqrt{\frac{U}{\unit{1}{V}}}/\frac{I}{\unit{1}{A}}\,[\sim]$'
set ylabel '$d\,[\unit{m}]$'
f(x) = a*x+b
fit f(x) 'Messwerte.txt' using (sqrt($1)/(($2/1000))):(($3-2.7)/100) via a,b
set terminal epslatex color colortext
set output 'edurchm.tex'
plot 'Messwerte.txt' using (sqrt($1)/(($2/1000))):(($3-2.7)/100) title 'Messwerte', f(x) title 'Lineare Regression' lt 1 lc 3
