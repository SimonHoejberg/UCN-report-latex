
##################################################################
# Makefile for LaTeX
##################################################################
# Use:
# make
# make clean
# options for ps2pdf: http://pages.cs.wisc.edu/~ghost/doc/AFPL/6.50/Ps2pdf.htm

TEX:=$(shell ls *.tex)
OTHER = *~ *.aux *.dvi *.toc *.bbl *.blg *.gz *.out *.thm *.ps *.idx *.ilg *.ind *.log *.fls *.tdo *.fdb_latexmk
GLOS = *~ *.glg *.gls *.glsdefs *.glo

default: main.tex
	rm -f main.pdf
	pdflatex --synctex=1 main.tex
	bibtex main
	pdflatex --synctex=1 main.tex
	pdflatex --synctex=1 main.tex
	rm -f $(OTHER) $(PS)

nobib: main.tex
	rm -f main.pdf
	pdflatex --synctex=1 main.tex
	pdflatex --synctex=1 main.tex
	pdflatex --synctex=1 main.tex
	rm -f $(OTHER) $(PS)

clean:
	rm -f $(OTHER) $(PS)
	rm -f $(GLOS)
