#!#
#!# Part of: MMUX Bash Libc Mathematics
#!# Contents: tests for arithmetics functions
#!# Date: Sep  4, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/arithmetics.bash ; less tests/arithmetics.log
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


#### addition

function arithmetics-add-1.1 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 1 $(add 1)
}
function arithmetics-add-1.2 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 4 $(add 1 3)
}
function arithmetics-add-1.3 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 9 $(add 1 3 5)
}

### ------------------------------------------------------------------------

function arithmetics-cadd-1.1 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 1 $(cadd 1)
}
function arithmetics-cadd-1.2 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 4 $(cadd 1 3)
}
function arithmetics-cadd-1.3 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 9 $(cadd 1 3 5)
}

function arithmetics-cadd-2.1 () {
    mmux-bash-libc-math-double-format "%.1lf"
    dotest-equal '(1.2)+i*(3.4)' $(cadd '(1.2)+i*(3.4)')
}
function arithmetics-cadd-2.2 () {
    mmux-bash-libc-math-double-format "%.1lf"
    dotest-equal '(6.8)+i*(11.2)' $(cadd '(1.2)+i*(3.4)' '(5.6)+i*(7.8)')
}
function arithmetics-cadd-2.3 () {
    mmux-bash-libc-math-double-format "%.1lf"
    dotest-equal '(4.7)+i*(6.9)' $(cadd '(1.2)+i*(3.4)' '(5.6)+i*(7.8)' '(-2.1)+i*(-4.3)')
}


#### subtraction

function arithmetics-sub-1.1 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 1 $(sub 1)
}
function arithmetics-sub-1.2 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal -2 $(sub 1 3)
}
function arithmetics-sub-1.3 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal -7 $(sub 1 3 5)
}
function arithmetics-sub-1.4 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 6 $(sub 10 1 3)
}

### ------------------------------------------------------------------------

function arithmetics-csub-1.1 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 1 $(csub 1)
}
function arithmetics-csub-1.2 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal -2 $(csub 1 3)
}
function arithmetics-csub-1.3 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal -7 $(csub 1 3 5)
}

function arithmetics-csub-2.1 () {
    mmux-bash-libc-math-double-format "%.1lf"
    dotest-equal '(1.2)+i*(3.4)' $(csub '(1.2)+i*(3.4)')
}
function arithmetics-csub-2.2 () {
    mmux-bash-libc-math-double-format "%.1lf"
    dotest-equal '(-4.4)+i*(-4.4)' $(csub '(1.2)+i*(3.4)' '(5.6)+i*(7.8)')
}
function arithmetics-csub-2.3 () {
    mmux-bash-libc-math-double-format "%.1lf"
    dotest-equal '(-2.3)+i*(-0.1)' $(csub '(1.2)+i*(3.4)' '(5.6)+i*(7.8)' '(-2.1)+i*(-4.3)')
}


#### multiplication

function arithmetics-mul-1.1 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 1 $(mul 1)
}
function arithmetics-mul-1.2 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 6 $(mul 2 3)
}
function arithmetics-mul-1.3 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 30 $(mul 2 3 5)
}

### ------------------------------------------------------------------------

function arithmetics-cmul-1.1 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 1 $(cmul 1)
}
function arithmetics-cmul-1.2 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 3 $(cmul 1 3)
}
function arithmetics-cmul-1.3 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 15 $(cmul 1 3 5)
}

function arithmetics-cmul-2.1 () {
    mmux-bash-libc-math-double-format "%.1lf"
    dotest-equal '(1.2)+i*(3.4)' $(cmul '(1.2)+i*(3.4)')
}
function arithmetics-cmul-2.2 () {
    mmux-bash-libc-math-double-format "%.1lf"
    dotest-equal '(-19.8)+i*(28.4)' $(cmul '(1.2)+i*(3.4)' '(5.6)+i*(7.8)')
}
function arithmetics-cmul-2.3 () {
    mmux-bash-libc-math-double-format "%.1lf"
    dotest-equal '(163.7)+i*(25.5)' $(cmul '(1.2)+i*(3.4)' '(5.6)+i*(7.8)' '(-2.1)+i*(-4.3)')
}


#### division

function arithmetics-div-1.1 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 1 $(div 1)
}
function arithmetics-div-1.2 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 4 $(div 12 3)
}
function arithmetics-div-1.3 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 4 $(div 24 2 3)
}

### ------------------------------------------------------------------------

function arithmetics-cdiv-1.1 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal 1 $(cdiv 1)
}
function arithmetics-cdiv-1.2 () {
    mmux-bash-libc-math-double-format "%.4lf"
    dotest-equal 0.3333 $(cdiv 1 3)
}
function arithmetics-cdiv-1.3 () {
    mmux-bash-libc-math-double-format "%.6lf"
    dotest-equal 0.066667 $(cdiv 1 3 5)
}

function arithmetics-cdiv-2.1 () {
    mmux-bash-libc-math-double-format "%.1lf"
    dotest-equal '(1.2)+i*(3.4)' $(cdiv '(1.2)+i*(3.4)')
}
function arithmetics-cdiv-2.2 () {
    mmux-bash-libc-math-double-format "%.5lf"
    dotest-equal '(0.36052)+i*(0.10499)' $(cdiv '(1.2)+i*(3.4)' '(5.6)+i*(7.8)')
}
function arithmetics-cdiv-2.3 () {
    mmux-bash-libc-math-double-format "%.6lf"
    dotest-equal '(-0.052775)+i*(0.058068)' $(cdiv '(1.2)+i*(3.4)' '(5.6)+i*(7.8)' '(-2.1)+i*(-4.3)')
}


#### negation

function arithmetics-neg-1.1 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal -1 $(neg 1)
}
function arithmetics-neg-1.2 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal -12 $(neg 12)
}

### ------------------------------------------------------------------------

function arithmetics-cneg-1.1 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal -1 $(cneg 1)
}
function arithmetics-cneg-1.2 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal -12 $(cneg 12)
}

function arithmetics-cneg-2.1 () {
    mmux-bash-libc-math-double-format "%.1lf"
    dotest-equal '(-1.2)+i*(-3.4)' $(cneg '(1.2)+i*(3.4)')
}
function arithmetics-cneg-2.2 () {
    mmux-bash-libc-math-double-format "%.1lf"
    dotest-equal '(-5.6)+i*(7.8)' $(cneg '(5.6)+i*(-7.8)')
}


#### let's go

dotest arithmetics-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
