#!#
#!# Part of: MMUX Bash Libc Mathematics
#!# Contents: tests for trigonometric functions
#!# Date: Sep  4, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/trigonometric.bash ; less tests/trigonometric.log
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


#### trigonometric sine

function trigonometric-sin-1.1 () {
    mbfl_location_enter
    {
	mmux-bash-libc-mathematics-double-format "%.5lf" OLDFORMAT
	mbfl_location_handler "mmux-bash-libc-mathematics-double-format '$OLDFORMAT' &>/dev/null"

	dotest-equal 0.93204 $(sin 1.2)
    }
    mbfl_location_leave
}

### ------------------------------------------------------------------------

function trigonometric-csin-1.1 () {
    mmux-bash-libc-mathematics-double-format "%.4lf"
    dotest-equal '(13.9794)+i*(5.4228)' $(csin '(1.2)+i*(3.4)')
}
function trigonometric-csin-1.2 () {
    mmux-bash-libc-mathematics-double-format "%.4lf"
    dotest-equal '(-13.9794)+i*(5.4228)' $(csin '(-1.2)+i*(+3.4)')
}


#### trigonometric cosine

function trigonometric-cos-1.1 () {
    mmux-bash-libc-mathematics-double-format "%.5lf"
    dotest-equal 0.36236 $(cos 1.2)
}


#### trigonometric tangent

function trigonometric-tan-1.1 () {
    mmux-bash-libc-mathematics-double-format "%.4lf"
    dotest-equal 2.5722 $(tan 1.2)
}


#### trigonometric arc sine

function trigonometric-asin-1.1 () {
    mmux-bash-libc-mathematics-double-format "%.5lf"
    dotest-equal 0.20136 $(asin 0.2)
}


#### trigonometric arc cosine

function trigonometric-acos-1.1 () {
    mmux-bash-libc-mathematics-double-format "%.4lf"
    dotest-equal 1.3694 $(acos 0.2)
}


#### trigonometric arc tangent

function trigonometric-atan-1.1 () {
    mmux-bash-libc-mathematics-double-format "%.4lf"
    dotest-equal 0.1974 $(atan 0.2)
}

### ------------------------------------------------------------------------

function trigonometric-atan2-1.1 () {
    mmux-bash-libc-mathematics-double-format "%.4lf"
    dotest-equal 0.5880 $(atan2 0.2 0.3)
}


#### let's go

dotest trigonometric-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
