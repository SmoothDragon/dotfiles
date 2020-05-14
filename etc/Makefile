##########################################
# openscad Makefile
# Tom Draper 2017
##########################################
# Targets
# $@ = file to be made
# $? = changed dependents
# $< = file that caused action
# $* = prefix shared by target and dependent files

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
%:      %.py
	python3 $< > $@

%.dxf:	%.scad
	openscad -o $@ $<

%.dvi:	%.tex
	mkdir -p $(TEXTMP)
	latex -halt-on-error -file-line-error -interaction=nonstopmode -output-directory=$(TEXTMP) $<
	mv $(TEXTMP)/$@ .

%.pdf:	%.tex
	pdflatex -interaction=nonstopmode $<
# Rerun if references are not up to date
ifeq ($(grep 'LaTeX Warning: .* may have changed' $*.log),)
	pdflatex -interaction=nonstopmode $<
endif

%.pdf:	%.mkd
	pandoc $< -f markdown --latex-engine pdflatex -o $@

%.pdf:	%.svg
	inkscape -z -D --file=$< --export-pdf=$@ --export-latex

%.png:	%.dot
	dot -Tpng $< -o $@

%.scad: %.scad.py
	python3 $< > $@

%.stl:	%.scad
	openscad -m make -o $@ $<

%.svg:	%.dvi
	dvisvgm --no-fonts $<

%.svg:	%.dot
	dot -Tsvg $< -o $@

%.tex:	%.tikz
	tikz2preview $< > $@

%.tikz:	%.qpic
	qpic < $< > $@

%.tikz:	%.dot
	dot2tex --preproc $< | dot2tex --figonly > $@

%.mp3:	%.mkv
	ffmpeg -i $< -vn -c:a libmp3lame -y $@

clean:
	/bin/rm -f $(AUTO)

.SECONDARY:	$(SCAD) $(STL) $(DXF)
.PHONY:		all clean stl dxf
