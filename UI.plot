reset
set terminal epslatex color
set output 'UI.tex'
set xlabel '$\sqrt{\frac{U_\text{B}}{1\text V}}/\frac{I_\text{H}}{1\text A}$'
set ylabel '$d$'
set key top right

f(x)=m*x+b
g(x)=a*x+c
h(x)=d*x+e
i(x)=f*x+g

set fit logfile 'U140.log'
fit f(x) 'Messwerte.txt' u (sqrt(140)/$1):(($2-38)/1000) via m,b

set fit logfile 'U160.log'
fit g(x) 'Messwerte.txt' u (sqrt(160)/$1):(($3-38)/1000) via a,c

set fit logfile 'I0_5.log'
fit h(x) 'MesswerteI.txt' u (sqrt($1)/0.5):(($3-38)/1000) via d,e

set fit logfile 'I0_7.log'
fit i(x) 'MesswerteI.txt' u (sqrt($1)/0.7):(($2-38)/1000) via f,g


p 'Messwerte.txt' u (sqrt(160)/$1):(($3-38)/1000) t'U$_\text{B}$=160V', g(x) t'Regressionsgerade U=160V', 'Messwerte.txt' u (sqrt(140)/$1):(($2-38)/1000) t'U$_\text{B}$=140V',\
f(x) t'U=140V','MesswerteI.txt' u (sqrt($1)/0.7):(($2-38)/1000) t'$I_\text{H}$=0.7', i(x) t'Regressionsgerade I=0.7A',\
'MesswerteI.txt' u (sqrt($1)/0.5):(($3-38)/1000) t'I$_\text{H}$=0.5A', h(x) t'I=0.5A'

set output
!epstopdf UI.eps
