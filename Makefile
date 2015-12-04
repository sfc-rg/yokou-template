FILENAME = draft

${FILENAME}.pdf: ${FILENAME}.dvi
	dvipdfmx $<

${FILENAME}.dvi: ${FILENAME}.tex
	platex $<

clean:
	rm -rf ${FILENAME}.aux ${FILENAME}.dvi ${FILENAME}.log
