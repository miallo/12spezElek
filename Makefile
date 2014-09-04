all: Prohaupt.tex
	pdflatex Prohaupt.tex
	bibtex Prohaupt
	pdflatex Prohaupt.tex
	pdflatex Prohaupt.tex
	rm -f Prohaupt.toc Prohaupt.log Prohaupt.bbl Prohaupt.blg Prohaupt.aux
clean: 
	rm -f $(PROG) *.o *.toc *.log *.aux *.bbl *.blg
