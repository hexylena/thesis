thesis: clean references.bib vars.tex
	bash vars.sh
	latexmk -xelatex -f dissertation.tex

thesis-auto: clean references.bib vars.tex
	find . -name '*.tex' | entr bash -c "bash vars.sh && latexmk -xelatex -f dissertation.tex"

BIBS := $(wildcard chapters/*/*.bib)
BIBS2 := $(wildcard chapters/*.bib)

references.bib: $(BIBS) $(BIBS2)
	echo "" > references.bib
	for bib in ${BIBS}; do \
		echo "%%%% $$bib" >> references.bib; \
		cat $$bib >> references.bib; \
	done;
	for bib in ${BIBS2}; do \
		echo "%%%% $$bib" >> references.bib; \
		cat $$bib >> references.bib; \
	done;
	~/bin/bibtex-tidy --merge references.bib

view:
	okular dissertation.pdf &

watch:
	find -name '*.tex' -not -name 'vars.tex' | entr -r $(MAKE)

check:
	lacheck dissertation.tex

clean:
	@# Should do the same thing as below, but keeping both in case.
	latexmk -c
	rm -f references.bib
	find . -name '*.bbl' -exec rm '{}' +
	@#rm **/*.aux **/*.blg **/*.bbl *.aux *.log *.out *.toc

reallyclean:
	@# Should do the same thing as below, but keeping both in case.
	latexmk -c
	rm -f references.bib
	find . -name '*.bbl' -exec rm '{}' +
	find . -name '*.aux' -exec rm '{}' +
	find . -name '*.blg' -exec rm '{}' +
	@#rm **/*.aux **/*.blg **/*.bbl *.aux *.log *.out *.toc


mermaid/diag.mmd.png: mermaid/diag.mmd
	TEMP=~/tmp/ TMPDIR=~/tmp/ TMP=~/tmp/ apptainer run --mount type=bind,source=`pwd`/mermaid/,destination=/data docker://ghcr.io/mermaid-js/mermaid-cli/mermaid-cli -i /data/diag.mmd -e png -s 4
