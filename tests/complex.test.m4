#!#
#!# Part of: MMUX Bash Libc Mathematics
#!# Contents: tests for complex numbers utilities builtins
#!# Date: Sep  5, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/complex.bash ; less tests/complex.log
#!#
#!#	that will select these tests.
#!#
#!# Copyright (c) 2024 Marco Maggi
#!# <mrc.mgg@gmail.com>
#!#
#!# The author hereby  grants permission to use,  copy, modify, distribute, and  license this software
#!# and its documentation  for any purpose, provided  that existing copyright notices  are retained in
#!# all copies and that this notice is  included verbatim in any distributions.  No written agreement,
#!# license,  or royalty  fee is  required for  any  of the  authorized uses.   Modifications to  this
#!# software may  be copyrighted by their  authors and need  not follow the licensing  terms described
#!# here, provided that the new terms are clearly indicated  on the first page of each file where they
#!# apply.
#!#
#!# IN NO EVENT SHALL THE AUTHOR OR DISTRIBUTORS BE LIABLE TO ANY PARTY FOR DIRECT, INDIRECT, SPECIAL,
#!# INCIDENTAL, OR CONSEQUENTIAL DAMAGES  ARISING OUT OF THE USE OF  THIS SOFTWARE, ITS DOCUMENTATION,
#!# OR ANY  DERIVATIVES THEREOF,  EVEN IF  THE AUTHOR  HAVE BEEN  ADVISED OF  THE POSSIBILITY  OF SUCH
#!# DAMAGE.
#!#
#!# THE AUTHOR AND  DISTRIBUTORS SPECIFICALLY DISCLAIM ANY WARRANTIES, INCLUDING,  BUT NOT LIMITED TO,
#!# THE IMPLIED WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE, AND NON-INFRINGEMENT.
#!# THIS  SOFTWARE IS  PROVIDED  ON AN  \"AS  IS\" BASIS,  AND  THE AUTHOR  AND  DISTRIBUTORS HAVE  NO
#!# OBLIGATION TO PROVIDE MAINTENANCE, SUPPORT, UPDATES, ENHANCEMENTS, OR MODIFICATIONS.
#!#


#### macros

MBFL_DEFINE_QQ_MACRO
MBFL_DEFINE_UNDERSCORE_MACRO_FOR_SLOTS


#### setup

mbfl_embed_library(__LIBMBFL_LINKER__)
mbfl_linker_source_library_by_stem(core)
mbfl_linker_source_library_by_stem(tests)

source "$MMUX_LIBRARY"


#### rectangular

function complex-rectangular-1.1 () {
    mmux-bash-libc-mathematics-double-format "%.1lf"
    dotest-equal '(1.2)+i*(3.4)' $(rectangular 1.2 3.4)
}


#### polar

function complex-polar-1.1 () {
    mmux-bash-libc-mathematics-double-format "%.9lf"
    declare MAG=$(cabs '(1.2)+i*(3.4)')
    declare ANG=$(carg '(1.2)+i*(3.4)')
    dotest-equal '(1.200000001)+i*(3.399999999)' $(polar QQ(MAG) QQ(ANG))
}


#### real part

function complex-creal-1.1 () {
    mmux-bash-libc-mathematics-double-format "%.1lf"
    dotest-equal '1.2' $(creal '(1.2)+i*(3.4)')
}


#### imag part

function complex-cimag-1.1 () {
    mmux-bash-libc-mathematics-double-format "%.1lf"
    dotest-equal '3.4' $(cimag '(1.2)+i*(3.4)')
}


#### conjugate

function complex-conj-1.1 () {
    mmux-bash-libc-mathematics-double-format "%.1lf"
    dotest-equal '(1.2)+i*(-3.4)' $(conj '(1.2)+i*(3.4)')
}


#### argument

function complex-carg-1.1 () {
    mmux-bash-libc-mathematics-double-format "%.6lf"
    dotest-equal '1.231504' $(carg '(1.2)+i*(3.4)')
}


#### let's go

dotest complex-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
