NOW := $$(date '+%Y-%m-%dT%H%M%S')
thesis: references.bib vars.tex stellingen.pdf dissertation.pdf

dissertation.pdf: dissertation.tex Dissertate.cls ./packages/EMC/style.sty $(wildcard */*.tex) aesthetics frontmatter/images/cover-front.50.png
	bash vars.sh
	latexmk -xelatex -f dissertation.tex
	cp dissertation.pdf dissertation-$(NOW).pdf

stellingen.pdf: stellingen.tex Dissertate.cls ./packages/EMC/style.sty
	bash vars.sh
	latexmk -xelatex -f stellingen.tex
	cp stellingen.pdf stellingen-$(NOW).pdf

frontmatter/images/cover-front.50.png: frontmatter/images/cover-front.png
	magick frontmatter/images/cover-front.png -resize 50% frontmatter/images/cover-front.50.png

thesis-auto: clean references.bib vars.tex
	find . -name '*.tex' | entr bash -c "make dissertation.pdf"

BIBS := $(wildcard chapters/*/*.bib)
BIBS2 := $(wildcard chapters/*.bib)

references.bib: $(BIBS) $(BIBS2)
	rm -f references.bib
	for bib in ${BIBS}; do \
		echo "%%%% $$bib" >> references.bib; \
		cat $$bib >> references.bib; \
	done;
	for bib in ${BIBS2}; do \
		echo "%%%% $$bib" >> references.bib; \
		cat $$bib >> references.bib; \
	done;
	~/bin/bibtex-tidy references.bib

# interstitial pages
aesthetics:
	$(MAKE) -C $@

.PHONY: aesthetics

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
