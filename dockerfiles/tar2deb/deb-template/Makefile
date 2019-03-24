# DESTDIR is defined in dh_auto_install
# Ref: https://www.debian.org/doc/manuals/maint-guide/modify.ja.html
SHELL=/bin/bash
BINDIR=$(DESTDIR)/usr/bin
LIBDIR=$(DESTDIR)/usr/lib
MANDIR=$(DESTDIR)/usr/share/man/man1
INSTALL?=/usr/bin/install
RM?=/bin/rm -rf
CP?=/bin/cp -r

all:
	@echo "Run 'make install' to install"

install:
	${INSTALL} -d ${BINDIR}
	${INSTALL} -m 755 bin/* ${BINDIR}
	${INSTALL} -d ${MANDIR}
	${INSTALL} -m 644 man/*.1 ${MANDIR}

deinstall: uninstall
