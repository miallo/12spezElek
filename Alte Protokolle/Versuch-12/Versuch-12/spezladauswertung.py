from math import *

def SpezLad(steigung):
  mu0 = 4e-7*pi
  R = 0.122
  n = 200
  faktor = 1000*R**2/(64*mu0**2*n**2)
  edurchm = faktor/steigung**2
  return edurchm

def SpezLadFehler(steigung, sigmasteigung):
  mu0 = 4e-7*pi
  R = 0.122
  n = 200
  faktor = 1000*R**2/(64*mu0**2*n**2)
  edurchm = 2*faktor/steigung**3 * sigmasteigung
  return edurchm

a = 0.00499035
sa = 0.0001193
print "e/m_e =", SpezLad(a), " +/- ", SpezLadFehler(a, sa) 
