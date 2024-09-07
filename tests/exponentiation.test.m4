#!#
#!# Part of: MMUX Bash Libc Mathematics
#!# Contents: tests for exponentiation and logarithm functions
#!# Date: Sep  6, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/exponentiation.bash ; less tests/exponentiation.log
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


#### exp

function exponentiation-exp-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal 2.7183 $(exp 1)
}

### ------------------------------------------------------------------------

function exponentiation-exp2-1.1 () {
    mmux-bash-libc-math-double-format "%.0f"
    dotest-equal 2 $(exp2 1)
}

### ------------------------------------------------------------------------

function exponentiation-exp10-1.1 () {
    mmux-bash-libc-math-double-format "%.0f"
    dotest-equal 10 $(exp10 1)
}

### ------------------------------------------------------------------------

function exponentiation-expm1-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal 2.3201 $(expm1 1.2)
}

### ------------------------------------------------------------------------

function exponentiation-cexp-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal $(rectangular -3.2099 -0.8484) $(cexp '(1.2)+i*(3.4)')
}


#### log

function exponentiation-log-1.1 () {
    mmux-bash-libc-math-double-format "%.5f"
    dotest-equal 0.18232 $(log 1.2)
}

### ------------------------------------------------------------------------

function exponentiation-log2-1.1 () {
    mmux-bash-libc-math-double-format "%.5f"
    dotest-equal 0.26303 $(log2 1.2)
}

### ------------------------------------------------------------------------

function exponentiation-log10-1.1 () {
    mmux-bash-libc-math-double-format "%.5f"
    dotest-equal 0.07918 $(log10 1.2)
}

### ------------------------------------------------------------------------

function exponentiation-logb-1.1 () {
    mmux-bash-libc-math-double-format "%.2f"
    dotest-equal 3.00 $(logb 12.3)
}

### ------------------------------------------------------------------------

function exponentiation-log1p-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal 0.7885 $(log1p 1.2)
}

### ------------------------------------------------------------------------

function exponentiation-clog-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal $(rectangular 1.2825 1.2315) $(clog '(1.2)+i*(3.4)')
}

### ------------------------------------------------------------------------

function exponentiation-clog10-1.1 () {
    mmux-bash-libc-math-double-format "%.5f"
    dotest-equal $(rectangular 0.55697 0.53484) $(clog10 '(1.2)+i*(3.4)')
}


#### powers and roots

function exponentiation-pow-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal 1.8587 $(pow 1.2 3.4)
}

### ------------------------------------------------------------------------

function exponentiation-square-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal 4.0000 $(square 2.0)
}

### ------------------------------------------------------------------------

function exponentiation-cube-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal 8.0000 $(cube 2.0)
}

### ------------------------------------------------------------------------

function exponentiation-sqrt-1.1 () {
    mmux-bash-libc-math-double-format "%.0f"
    dotest-equal 8 $(sqrt 64)
}

### ------------------------------------------------------------------------

function exponentiation-cbrt-1.1 () {
    mmux-bash-libc-math-double-format "%.0f"
    dotest-equal 2 $(cbrt 8)
}

### ------------------------------------------------------------------------

function exponentiation-hypot-1.1 () {
    mmux-bash-libc-math-double-format "%.0f"
    dotest-equal $(sqrt $(add $(pow 2 2) $(pow 3 2))) $(hypot 2 3)
}
function exponentiation-hypot-1.2 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal 3.6056 $(hypot 2 3)
}

### ------------------------------------------------------------------------

function exponentiation-csqrt-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal $(rectangular 1.5501 1.0967) $(csqrt '(1.2)+i*(3.4)')
}

### ------------------------------------------------------------------------

function exponentiation-cpow-1.1 () {
    mmux-bash-libc-math-double-format "%.6f"
    dotest-equal $(rectangular -0.032776 -0.082291) $(cpow '(1.2)+i*(3.4)' '(5.6)+i*(7.8)')
}

### ------------------------------------------------------------------------

function exponentiation-csquare-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal '(-10.1200)+i*(8.1600)' $(csquare '(1.2)+i*(3.4)')
}

### ------------------------------------------------------------------------

function exponentiation-ccube-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal '(-39.8880)+i*(-24.6160)'  $(ccube '(1.2)+i*(3.4)')
}


#### let's go

dotest exponentiation-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
