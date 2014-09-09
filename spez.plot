reset
set terminal epslatex color
set output 'spezelek.tex'
set xlabel 'Bahndurchmesser [m]'
set ylabel '$e/m_e$ [$10^{11}$C/kg]'
set key top right

f(x)=1.758820088


p 'i05.dat' u (($3-38)/1000):(125*$1*0.125*0.125*100000/(32*(4*pi*($3-38)*$2)*(4*pi*($3-38))*$2)):((125*0.125*0.125)/(32*4*pi*4*pi*200*200) t'I=0.5A' ,\
'i07.dat' u (($3-38)/1000):(125*$1*0.125*0.125*100000/(32*(4*pi*($3-38)*$2)*(4*pi*($3-38))*$2)) t'I=0.7A' ,\
'u140.dat' u (($3-38)/1000):(125*$1*0.125*0.125*100000/(32*(4*pi*($3-38)*$2)*(4*pi*($3-38))*$2)) t'U=140V' ,\
'u160.dat' u (($3-38)/1000):(125*$1*0.125*0.125*100000/(32*(4*pi*($3-38)*$2)*(4*pi*($3-38))*$2)) t'U=160V' ,\
f(x) t'Literaturwert'

set output
!epstopdf spezelek.eps
