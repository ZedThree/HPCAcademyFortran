PANDOC = pandoc
PANDOC_FILTERS = --filter pandoc-include-code

all: Fortran.pdf

%.pdf: %.md
	$(PANDOC) $(PANDOC_FILTERS) -t beamer -o $@ $<

clean:
	rm -f *.aux *.log *.vrb *~
