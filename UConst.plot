reset
set terminal epslatex color
set output 'UConst.tex'
set xlabel '$1/T~[\si{1/\kelvin}]$'
set ylabel '$\ln(\frac{p}{\si{\pascal}})$'
set key top right

f(x)=m*x+b
g(x)=a*x+c

set fit logfile 'U140.log'
fit f(x) 'Messwerte.txt' u (sqrt(140)/$1):2 via m,b

set fit logfile 'U160.log'
fit g(x) 'Messwerte.txt' u (sqrt(160)/$1):3 via a,c

p 'Messwerte.txt' u (sqrt(160)/$1):3 t'U_B=160V', g(x) t'Regressionsgerade U=160V', 'Messwerte.txt' u (sqrt(140)/$1):2 t'U_B=140V', f(x) t'U=140V'

set output
!epstopdf UConst.eps
