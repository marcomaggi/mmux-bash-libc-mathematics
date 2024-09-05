#!#
#!# Part of: MMUX Bash Libc Mathematics
#!# Contents: tests for hyperbolic functions
#!# Date: Sep  5, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/hyperbolic.bash ; less tests/hyperbolic.log
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


#### hyperbolic sine

function hyperbolic-sinh-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal 1.5095 $(sinh 1.2)
}

### ------------------------------------------------------------------------

function hyperbolic-csinh-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal '(-1.4593)+i*(-0.4627)' $(csinh '(1.2)+i*(3.4)')
}


#### hyperbolic cosine

function hyperbolic-cosh-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal 1.8107 $(cosh 1.2)
}

### ------------------------------------------------------------------------

function hyperbolic-ccosh-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal '(-1.7505)+i*(-0.3857)' $(ccosh '(1.2)+i*(3.4)')
}


#### hyperbolic tangent

function hyperbolic-tanh-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal 0.8337 $(tanh 1.2)
}

### ------------------------------------------------------------------------

function hyperbolic-ctanh-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal '(0.8506)+i*(0.0769)' $(ctanh '(1.2)+i*(3.4)')
}


#### hyperbolic arc sine

function hyperbolic-asinh-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal 1.0160 $(asinh 1.2)
}

### ------------------------------------------------------------------------

function hyperbolic-casinh-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal '(1.9605)+i*(1.2189)' $(casinh '(1.2)+i*(3.4)')
}


#### hyperbolic arc cosine

function hyperbolic-acosh-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal 0.6224 $(acosh 1.2)
}

### ------------------------------------------------------------------------

function hyperbolic-cacosh-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal '(1.9905)+i*(1.2431)' $(cacosh '(1.2)+i*(3.4)')
}


#### hyperbolic arc tangent

function hyperbolic-atanh-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal 0.1206 $(atanh 0.12)
}

### ------------------------------------------------------------------------

function hyperbolic-catanh-1.1 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal '(0.0866)+i*(1.3130)' $(catanh '(1.2)+i*(3.4)')
}


#### let's go

dotest hyperbolic-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
