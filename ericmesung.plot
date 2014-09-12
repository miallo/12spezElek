reset
set terminal epslatex color
set output 'eric.tex'
set xlabel 'Bahndurchmesser [m]'
set ylabel '$e/m_e$ [$10^{11}$C/kg]'
set key below

f(x)=1.7588

p 'ei05.dat' u ($1*2):($2/1e11):($3/1e11) w ye t'I=0.5A',\
'ei07.dat' u ($1*2):($2/1e11):($3/1e11) w ye t'I=0.7A',\
'eu140.dat' u ($1*2):($2/1e11):($3/1e11) w ye t'U=140V',\
'eu160.dat' u ($1*2):($2/1e11):($3/1e11) w ye t'U=160V',f(x) t'Literaturwert'
set output
!epstopdf eric.eps
