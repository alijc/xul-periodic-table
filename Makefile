# makefile for making sure that each xul file has a txt file

xulfiles  = $(wildcard *.xul)
txtfiles  = $(patsubst %.xul,%.xul.txt, $(wildcard *.xul))

all:	$(txtfiles)

# Just copy the xul file to its txt file..
%.xul.txt:	%.xul
	cp $< $@


# targets not included in 'all'

backup: $(xulfiles)
	rsync -e ssh --archive --update --compress --verbose $(xulfiles) \
		zaphod.axian.com:public_html/xul/

clean:
	-rm --force *~
