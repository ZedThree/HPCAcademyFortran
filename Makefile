PANDOC = pandoc
SYNTAX_FILE = fortran.xml
PANDOC_OPTIONS = --syntax-definition=$(SYNTAX_FILE)
PANDOC_FILTERS = --filter pandoc-include-code

all: Fortran.pdf

%.pdf: %.md $(SYNTAX_FILE)
	$(PANDOC) $(PANDOC_OPTIONS) $(PANDOC_FILTERS) -t beamer -o $@ $<

clean:
	rm -f *.aux *.log *.vrb *~
