##########################################
# openscad Makefile
# Tom Draper 2017
##########################################
# Targets
# $@ = file to be made
# $? = changed dependents
# $< = file that caused action
# $* = prefix shared by target and dependent files

datestamp := $(shell date)

TEXTMP = .textmp

# Identify source files
PY	= $(wildcard *.py) # List all python files in directory
MKD	= $(wildcard *.mkd)
SVG	= $(wildcard *.svg)
	
# Secondary files automatically created
SCAD	= $(PY:.py=.scad)
STL	= $(SCAD:.scad=.stl)
DXF	= $(SCAD:.scad=.dxf)

PDF	= $(MKD:.mkd=.pdf) $(SVG:.svg=.pdf)

AUTO = $(SCAD) $(STL) $(DXF) $(PDF)

all:	$(SCAD)

stl:	$(STL)

dxf:	$(DXF)

# file.ext.py creates file.ext
%:	%.py
	python3 $< > $@

%.svg:	%.svg.py
	python3 $< > $@

%.dxf:	%.scad
	openscad -o $@ $<

%.svg:	%.scad
	openscad -o $@ $<

%.svg:	%.dxf
	inkscape $< --without-gui --export-area-drawing --export-plain-svg=$@

%.dvi:	%.tex
	mkdir -p $(TEXTMP)
	latex -halt-on-error -file-line-error -interaction=nonstopmode -output-directory=$(TEXTMP) $<
	mv $(TEXTMP)/$@ .

%.pdf:	%.tex
	mkdir -p $(TEXTMP)
	pdflatex -halt-on-error -file-line-error -interaction=errorstopmode -output-directory=$(TEXTMP) $<
	ln -s ../$*.bib $(TEXTMP)/ || true  # Link bibtex file into directory if it exists
	cd $(TEXTMP) && bibtex $* || true  # It is hard to know when bibtex fails
	pdflatex -halt-on-error -file-line-error -interaction=errorstopmode -output-directory=$(TEXTMP) $<
	pdflatex -halt-on-error -file-line-error -interaction=errorstopmode -output-directory=$(TEXTMP) $<
# Rerun if references are not up to date
# ifeq ($(grep 'LaTeX Warning: .* may have changed' $*.log),)
# 	pdflatex -interaction=nonstopmode $<
# endif
	cp $(TEXTMP)/$@ .
	cp $(TEXTMP)/$*.bib . 2>/dev/null || :
# 	rm -rf $(TEXTMP)

%.pdf:	%.mkd
	pandoc $< -f markdown --latex-engine pdflatex -o $@

%.pdf:	%.svg
	rsvg-convert -f pdf -o $@ $<

# %.pdf:	%.svg
# 	inkscape $< --without-gui --export-area-drawing --export-pdf=$@

%.png:	%.svg
	inkscape $< --without-gui --export-png $@

%.pdf_tex:	%.svg
	inkscape -D -z --file=$< --export-pdf=$*.pdf --export-latex

%.pdf:	%.md
	pandoc -s $< -o $@ --pdf-engine=xelatex

%.html:	%.md
	pandoc -s $< -o $@ --metadata pagetitle=$* --metadata date="$(dateestamp)"

%.html:	%.twiki
	pandoc -s $< --metadata pagetitle=$* --metadata date="$(dateestamp)" \
		| sed 's/%ATTACHURLPATH%/graphics/' \
		| sed 's/<head>/<head>\n<meta http-equiv="refresh" content="3">\n' \
		> $@

%.quirk:	%.qpic
	qpic2quirk $< > $@

%.png:	%.dot
	dot -Tpng $< -o $@

# This path may not be as good as PDF -> SVG -> PNG
# %.png:	%.pdf
# 	pdftoppm -png $< $*
# 	mv $*-1.png $@

%.scad: %.scad.py
	python3 $< > $@

%.stl:	%.scad
	openscad -m make -o $@ $<

%.svg:	%.dvi
	dvisvgm --font-format=woff $<

%.svg:	%.dot
	dot -Tsvg $< -o $@

%.svg:	%.pdf
	# inkscape $< --export-plain-svg=$@
	pdf2svg $< $@
	# Necessary as pdf2svg does not always create valid svgs:
	inkscape $@ --export-plain-svg=$@

%.gif:	%.pdf
	pdfcrop $<
	convert -verbose -delay 80 -loop 0 -density 300 $*-crop.pdf $@
	rm $*-crop.pdf

# Transparent GIF
# %.gif:	%.pdf
# 	pdfcrop $<
# 	convert -verbose -transparent white $< $@

%.tex:	%.tikz
	tikz2preview $< > $@

%.tikz:	%.qpic
	qpic < $< > $@

%.tikz:	%.dot
	dot2tex --preproc $< | dot2tex --figonly > $@

%.html: %.md
	pandoc $< > $@

%.mp3:	%.mkv
	ffmpeg -i $< -vn -c:a libmp3lame -y $@

%.csv:	%.sql
	sql2csv $< > $@

%.dxf:	%.scad
	openscad -o $@ $<

%.svg:	%.dxf
	inkscape $< --without-gui --export-area-drawing --export-plain-svg=$@

clean:
	/bin/rm -f $(AUTO)

# .SECONDARY:	$(SCAD) $(STL) $(DXF)
.PHONY:		all clean stl dxf
