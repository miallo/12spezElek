SHELL := /bin/bash
build: plot pdf

evince: plot pdf
	evince Protokoll.pdf
open: plot pdf
	open Protokoll.pdf
preview: plot pdf
	open -a Preview Protokoll.pdf

plot:
	for f in *.plot; do gnuplot "$$f" ; done
  
	for f in *.eps; do epstopdf "$$f" ; done

pdf:
	pdflatex --shell-escape Protokoll
	bibtex Protokoll
	pdflatex --shell-escape Protokoll
	pdflatex --shell-escape Protokoll
