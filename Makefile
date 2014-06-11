SRC=$(wildcard *.tex)
#tex file
OUTPUT=$(SRC:.tex=.pdf)
#bibliography file
BIB=$(wildcard *.bib)

all : $(OUTPUT)

%.pdf : %.tex $(BIB)
	pdflatex -file-line-error -interaction=nonstopmode $*.tex
	if [ -e $*.bib ] ; then \
		bibtex $* ;\
		pdflatex -file-line-error -interaction=nonstopmode $*.tex ;\
	fi
	pdflatex -file-line-error -interaction=nonstopmode $*.tex

.PHONY: clean mrproper
clean :
	rm -rf *.bbl *.blg *.log *.aux *.dvi *.out *.toc *.snm *.nav

mrproper: clean
	rm -rf $(OUTPUT)
