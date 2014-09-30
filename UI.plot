reset
set terminal epslatex color
set output 'UI.tex'
set xlabel '$\sqrt{\frac{U_\text{B}}{1\text V}}/\frac{I_\text{H}}{1\text A}$'
set ylabel '$d$ [m]'
set key below

f(x)=m*x+b

set fit logfile 'Daten.log'
fit f(x) 'Daten.dat' u (sqrt($1)/$2):(($3-38)/1000):(0.002) via m,b
sigmau=2
sigmai=0.01
p 'Messwerte.txt' u (sqrt(160)/$1):(($3-38)/1000):(0.002) w ye t'U$_\text{B}$=160V',\
'Messwerte.txt' u (sqrt(140)/$1):(($2-38)/1000):(0.002) w ye t'U$_\text{B}$=140V',\
'MesswerteI.txt' u (sqrt($1)/0.5):(($3-38)/1000):(0.002) w ye t'I$_\text{H}$=0.5A',\
'MesswerteI.txt' u (sqrt($1)/0.7):(($2-38)/1000):(0.002) w ye t'$I_\text{H}$=0.7',\
f(x) lt -1 t'Regression'

set output
!epstopdf UI.eps
