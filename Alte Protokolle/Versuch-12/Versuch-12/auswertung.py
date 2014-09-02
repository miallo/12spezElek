from math import *

def SpezLad(U, I, d, sigmaU, sigmaI, sigmad):
  # Radius of Helmholtz Coils
  R = 0.122
  # Number of turns
  n = 200
  mu0 = 4*pi*10**(-7)
  # Radius of the electron beam
  r = d/2
  # Magnetic field inside the Helmholtz Coils (approx.)
  B = 8*mu0*I*n/(sqrt(125)*R) # [T]
  SpezLadu = 2*U/((r**2)*(B**2))
  sigmaSpezLad = SpezLadu*sqrt((sigmaU/U)**2+(2*sigmaI/I)**2+(2*sigmad/d)**2)
  return [SpezLadu, sigmaSpezLad] # [C/kg]

def SpezLad2(U, B, d):
  r = d/2
  return 2*U/((r**2)*(B**2)) # [C/kg]



data = []
f = open('Messwerte.txt', 'r')
for line in f:
  # Empty line, stop reading data
  if len(line) < 2:
    break
  if line[0] == '#':
    continue
  data.append(map(float, line.strip().split(' ', 5)))

total  = 0
totalerror = 0
total2 = 0
count  = 0

# Offset of diameter
offset = 0.027 

for (U,I,d,B,a,c) in data:
  I = I/1000
  d = d/100 - offset
  sigmaU = 2.6
  sigmaI = 0.0021
  sigmad = 0.0025
  (SpezLadu, sigmaSpezLad) = SpezLad(U, I, d, sigmaU, sigmaI, sigmad)
 # print 'Spezifische Ladung: (', SpezLadu, '+/-', sigmaSpezLad, ') C/kg (U =', U, 'V, I =', I, 'A, d =', d, 'm)'
 # print 'Mit Elliptischen Integralen:', SpezLad2(U, B, d), 'C/kg'
 # 200& 550& 15.3& 0.000779564\\
  R = 0.122
  # Number of turns
  n = 200
  mu0 = 4*pi*10**(-7)

  print str(U) + ' & ' + str(I*1000) + ' & ' + str(d) + ' & ' + str(round(1000*8*mu0*I*n/(sqrt(125)*R),5)) + ' & $' + str(round(SpezLadu/100000000000.0,2)) + ' \pm ' + str(round(sigmaSpezLad/100000000000.0,2)) + '$ & ' + str(round(SpezLad2(U, B, d)/100000000000.0,2)) + ' \\\\'
  print '\hline'
  total = total + (SpezLadu/sigmaSpezLad**2)
  totalerror = totalerror + (1/sigmaSpezLad**2)
  total2 = total2 + SpezLad2(U, B, d)
  count = count + 1
total = total/totalerror
totalerror = 1/sqrt(totalerror)
print '-------------------------------------------------'
print 'Mittelwert: (', total, '+/-', totalerror, ') C/kg'
print 'Ell. Mittelwert:', total2/count, 'C/kg'
