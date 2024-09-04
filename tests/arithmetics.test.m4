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


#### negation

function arithmetics-neg-1.1 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal -1 $(neg 1)
}
function arithmetics-neg-1.2 () {
    mmux-bash-libc-math-double-format "%.0lf"
    dotest-equal -12 $(neg 12)
}


#### let's go

dotest arithmetics-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
