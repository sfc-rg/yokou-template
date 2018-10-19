FILENAME = resume
PLATEX = platex
DVIPDFMX = dvipdfmx
BIBTEX = pbibtex

${FILENAME}.pdf: ${FILENAME}.dvi
	$(DVIPDFMX) ${FILENAME}
${FILENAME}.dvi: ${FILENAME}.tex
	$(PLATEX) ${FILENAME}
	$(BIBTEX) ${FILENAME}
	$(PLATEX) ${FILENAME}
	$(PLATEX) ${FILENAME}

clean:
	rm -rf ${FILENAME}.aux ${FILENAME}.dvi ${FILENAME}.log ${FILENAME}.blg ${FILENAME}.bbl
