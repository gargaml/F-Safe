all: slide.pdf

slide.pdf: slide.tex
	pdflatex $^ 
	pdflatex $^

clean:
	rm -rf *.aux *.log *.out *~ *.nav *.toc \#* *.snm slide.pdf

open:
	evince slide.pdf &
mrproper: clean
	rm -rf *.pdf
