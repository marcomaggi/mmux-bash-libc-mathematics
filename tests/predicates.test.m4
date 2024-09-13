#!#
#!# Part of: MMUX Bash Libc Mathematics
#!# Contents: tests for predicates functions
#!# Date: Sep 13, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/predicates.bash ; less tests/predicates.log
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

#fpclassify  iscanonical isnormal issignaling issubnormal iszero ispositive isnegative isnonpositive isnonnegative


#### fpclassify

function predicates-fpclassify-1.1 () {
    declare RESULT=$(fpclassify 1.2)
    dotest-equal $RESULT $FP_NORMAL
}
function predicates-fpclassify-1.2 () {
    declare RESULT=$(fpclassify 'NaN')
    dotest-equal $RESULT $FP_NAN
}
function predicates-fpclassify-1.3 () {
    declare RESULT=$(fpclassify 'Inf')
    dotest-equal $RESULT $FP_INFINITE
}
function predicates-fpclassify-1.4 () {
    declare RESULT=$(fpclassify '0.0')
    dotest-equal $RESULT $FP_ZERO
}


#### isfinite

function predicates-isfinite-1.1 () {
    isfinite 1.2
}
function predicates-isfinite-1.2 () {
    ! isfinite 'NaN'
}
function predicates-isfinite-1.3 () {
    ! isfinite 'Inf'
}


#### isinfinite

function predicates-isinfinite-1.1 () {
    ! isinfinite 1.2
}
function predicates-isinfinite-1.2 () {
    ! isinfinite 'NaN'
}
function predicates-isinfinite-1.3 () {
    isinfinite 'Inf'
}




#### isnan

function predicates-isnan-1.1 () {
    ! isnan 1.2
}
function predicates-isnan-1.2 () {
    isnan 'NaN'
}
function predicates-isnan-1.3 () {
    ! isnan 'Inf'
}


#### let's go

dotest predicates-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
