PREFIX = /usr/local
BINDIR = $(PREFIX)/bin
MANDIR = $(PREFIX)/share/man/man1
DOCDIR = $(PREFIX)/share/doc/redball

.PHONY: all install uninstall

all:

install:
	install -m755 -d $(BINDIR)
	install -m755 -d $(MANDIR)
	install -m755 -d $(DOCDIR)
	gzip -c doc/redball.1 > redball.1.gz
	install -m755 redball/redball.py $(BINDIR)/redball
	install -m644 redball.1.gz $(MANDIR)
	install -m644 README.md $(DOCDIR)
	rm -f redball.1.gz

uninstall:
	rm -f $(BINDIR)/redball
	rm -f $(MANDIR)/redball.1.gz
	rm -rf $(DOCDIR)
