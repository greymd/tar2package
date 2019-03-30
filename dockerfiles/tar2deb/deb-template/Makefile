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
#@bin@	${INSTALL} -d ${BINDIR}
#@bin@	${INSTALL} -m 755 bin/* ${BINDIR}
#@lib@	${INSTALL} -d ${LIBDIR}
#@lib@	${CP} lib/* ${LIBDIR}
#@man@	${INSTALL} -d ${MANDIR}
#@man@	${INSTALL} -m 644 man/*.1 ${MANDIR}

deinstall: uninstall
