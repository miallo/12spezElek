reset
set terminal epslatex color
set output 'IConst.tex'
set xlabel '$\sqrt{\frac{U_\text{B}}{1\text V}}/\frac{I_\text{H}}{1\text A}$'
set ylabel '$d\si{\ampere}$'
set key top right

f(x)=m*x+b
g(x)=a*x+c

set fit logfile 'I0_5.log'
fit f(x) 'MesswerteI.txt' u (sqrt($1)/0.5):(($3-38)/1000) via m,b

set fit logfile 'I0_7.log'
fit g(x) 'MesswerteI.txt' u (sqrt($1)/0.7):(($2-38)/1000) via a,c

p 'MesswerteI.txt' u (sqrt($1)/0.7):(($2-38)/1000) t'$I_\text{H}$=0.7', g(x) t'Regressionsgerade I=0.7A', 'MesswerteI.txt' u (sqrt($1)/0.5):(($3-38)/1000) t'I$_\text{H}$=0.5A', f(x) t'I=0.5A'

set output
!epstopdf IConst.eps
