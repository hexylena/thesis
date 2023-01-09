thesis: clean frontmatter/images references.bib
	latexmk -xelatex -f dissertation.tex

frontmatter/images:
	$(MAKE) -C $@

BIBS := $(wildcard chapters/*/*.bib)

references.bib: $(BIBS)
	cat ${BIBS} > references.bib

view:
	okular dissertation.pdf &

watch:
	while inotifywait -r -e modify --exclude  '(frontmatter/images/.*|\.git/.*|cronout.txt|.*(\.swp|\.swo|\.swn|\.fdb_latexmk|~))'  . ; do $(MAKE) thesis; done

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

.PHONY: frontmatter/images
