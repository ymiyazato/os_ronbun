TARGET = main.pdf

.PHONY: all clean distclean

all: $(TARGET)

clean:
	$(RM) *.aux *.log *.dvi *.gz *.fls *.fdb_latexmk *.bbl
	latexmk -c

distclean: clean
	$(RM) $(TARGET)
	latexmk -C

%.pdf: %.tex
	latexmk -f $< -pdfdvi -latex=platex -synctex=1

