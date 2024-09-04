## Process this file with automake to produce Makefile.in

ACLOCAL_AMFLAGS		= -I meta/autotools
AUTOMAKE_OPTIONS	= foreign
EXTRA_DIST		= INSTALL configure.sh		\
			  meta/slackware/slack-desc.in
dist_doc_DATA		= README COPYING
AM_CFLAGS		= $(MMUX_CFLAGS)
AM_CPPFLAGS		= -I$(srcdir)/src
CLEANFILES		=

## --------------------------------------------------------------------

nodist_pkgconfig_DATA	= meta/scripts/mmux-bash-libc-mathematics.pc


#### documentation

EXTRA_DIST		+= doc/mmux-bash-libc-mathematics.style.css
CLEANFILES		+= doc/mmux-bash-libc-mathematics.css

AM_MAKEINFOFLAGS	= --no-split
AM_MAKEINFOHTMLFLAGS	= --split=node -c WORDS_IN_PAGE=0 --css-ref=mmux-bash-libc-mathematics.css \
	-c PRE_BODY_CLOSE="<p>This document describes version <tt>$(PACKAGE_VERSION)</tt> of <em>$(PACKAGE_NAME)</em>.</p>"

info_TEXINFOS		= doc/mmux-bash-libc-mathematics.texi
doc_mmux_bash_libc_mathematics_TEXINFOS	= \
	doc/macros.texi			\
	doc/overview-linking.texi	\
	doc/lgpl-3.0.texi		\
	doc/fdl-1.3.texi

## --------------------------------------------------------------------

doc/mmux-bash-libc-mathematics.html/$(am__dirstamp): doc/$(am__dirstamp)
	@$(MKDIR_P) doc/mmux-bash-libc-mathematics.html/
	@: > doc/mmux-bash-libc-mathematics.html/$(am__dirstamp)

doc/mmux-bash-libc-mathematics.html/mmux-bash-libc-mathematics.css: \
	doc/mmux-bash-libc-mathematics.style.css doc/mmux-bash-libc-mathematics.html/$(am__dirstamp)
	$(INSTALL) -m 0444 "$(top_srcdir)/doc/mmux-bash-libc-mathematics.style.css" "$(builddir)/doc/mmux-bash-libc-mathematics.html/mmux-bash-libc-mathematics.css"

## --------------------------------------------------------------------

html-local: doc/mmux-bash-libc-mathematics.html/mmux-bash-libc-mathematics.css

install-html-local:
	$(MKDIR_P) "$(DESTDIR)$(htmldir)/mmux-bash-libc-mathematics.html/"
	$(INSTALL) -m 0444 $(builddir)/doc/mmux-bash-libc-mathematics.html/mmux-bash-libc-mathematics.css "$(DESTDIR)$(htmldir)/mmux-bash-libc-mathematics.html/"


#### libraries

mmux_bash_libc_mathematics_CURRENT		= @mmux_bash_libc_mathematics_VERSION_INTERFACE_CURRENT@
mmux_bash_libc_mathematics_REVISION		= @mmux_bash_libc_mathematics_VERSION_INTERFACE_REVISION@
mmux_bash_libc_mathematics_AGE			= @mmux_bash_libc_mathematics_VERSION_INTERFACE_AGE@
mmux_bash_libc_mathematics_LINKER_VERSION	= \
	-version-info $(mmux_bash_libc_mathematics_CURRENT):$(mmux_bash_libc_mathematics_REVISION):$(mmux_bash_libc_mathematics_AGE)

include_HEADERS			= src/mmux-bash-libc-mathematics.h

lib_LTLIBRARIES			= libmmux-bash-libc-mathematics.la
libmmux_bash_libc_mathematics_la_CPPFLAGS	= $(AM_CPPFLAGS)
libmmux_bash_libc_mathematics_la_CFLAGS		= $(AM_CFLAGS) $(BASH_CFLAGS)
libmmux_bash_libc_mathematics_la_LDFLAGS	= $(mmux_bash_libc_mathematics_LINKER_VERSION) $(AM_LDFLAGS)
libmmux_bash_libc_mathematics_la_SOURCES	=	\
	src/mmux-bash-libc-mathematics.h		\
	src/mmux-bash-libc-mathematics-internals.h	\
	src/mmux-bash-libc-mathematics-library.c	\
	src/mmux-bash-libc-mathematics-trigonometric.c

.PHONY: library

library: libmmux-bash-libc-mathematics.la


#### tests

MMUX_CHECK_TESTS	=		\
	tests/trigonometric.bash

EXTRA_DIST		+= $(MMUX_CHECK_TESTS)
TESTS			= $(MMUX_CHECK_TESTS)
MMUX_LIBRARY		= $(builddir)/src/libmmux-bash-libc-mathematics.bash

# Read "Parallel Test Harness" in the documentation of GNU Automake to
# understand how to use this interface for "make check".
#
# We must make sure that this ends with a semicolon!!!
AM_TESTS_ENVIRONMENT	= export MMUX_LIBRARY=$(MMUX_LIBRARY); export LD_LIBRARY_PATH=$(builddir)/.libs/:$(LD_LIBRARY_PATH);
TEST_EXTENSIONS		= .bash
TEST_LOG_COMPILER	= $(BASH_PROGRAM)
AM_TEST_LOG_FLAGS	=


#### interface to "make installcheck"
#
# If a  test script executes no  test functions: its exit  code is 77,
# which signals  GNU Automake's  test harness that  the test  has been
# skipped.  This is fine when running  "make check", but will cause an
# error when  running "make installcheck";  so we intercept  that exit
# code and normalise it to 0.

installcheck-local: $(TESTS)
	$(MBFL_ICHECK_ENV) RV=0					;\
	for FILE in $(TESTS)					;\
	do  echo "running: '$(top_srcdir)/$$FILE'"		;\
	    if ! bash "$(top_srcdir)/$$FILE"			;\
	    then RV=$$?; break					;\
	    fi							;\
	done							;\
	if test "$$RV" = 77; then exit 0; else exit $$RV; fi	;


#### common rules

include $(top_srcdir)/meta/automake/mmux-makefile-rules

### end of file
