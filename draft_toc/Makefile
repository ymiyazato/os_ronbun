TEX=lualatex
#TEX=luajittex --fmt=luajitlatex.fmt
BIBTEX=biber
TEX_FLAGS= --shell-escape -interaction=batchmode
PANDOC_FLAGS= --smart -t latex --filter pandoc-crossref

TARGET=toc_draft
ABST=abstract

COUNT=3

SOURCE = toc.tex

.SUFFIXES: .tex .pdf
.PHONY: all semi-clean clean preview

all: $(TARGET).pdf semi-clean

$(TARGET).pdf: $(SOURCE)
	@for i in `seq 1 $(COUNT)`; \
	do \
		$(TEX) $(TEX_FLAGS) $(SOURCE); \
		if [ ! -e "$(SOURCE:.tex=.blg)" ]; then \
			echo -e '\n'; \
			$(BIBTEX) $(basename $(SOURCE)); \
		fi \
	done
	@mv $(SOURCE:.tex=.pdf) $(TARGET).pdf

semi-clean:
	@rm -f *.aux *.log *.out *.lof *.toc *.bbl *.blg *.xml *.bcf *blx.bib *.spl

clean: semi-clean
	@rm -f $(TARGET).pdf $(TEXFILES)

preview:
	@xdg-open $(TARGET).pdf 2> /dev/null
