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
    declare RESULT=$(fpclassify 'inf')
    dotest-equal $RESULT $FP_INFINITE
}
function predicates-fpclassify-1.4 () {
    declare RESULT=$(fpclassify '+inf')
    dotest-equal $RESULT $FP_INFINITE
}
function predicates-fpclassify-1.5 () {
    declare RESULT=$(fpclassify '-inf')
    dotest-equal $RESULT $FP_INFINITE
}
function predicates-fpclassify-1.6 () {
    declare RESULT=$(fpclassify '0.0')
    dotest-equal $RESULT $FP_ZERO
}
function predicates-fpclassify-1.7 () {
    declare RESULT=$(fpclassify '+0.0')
    dotest-equal $RESULT $FP_ZERO
}
function predicates-fpclassify-1.8 () {
    declare RESULT=$(fpclassify '-0.0')
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
    ! isfinite 'inf'
}
function predicates-isfinite-1.4 () {
    ! isfinite '+inf'
}
function predicates-isfinite-1.5 () {
    ! isfinite '-inf'
}


#### isinfinite

function predicates-isinfinite-1.1 () {
    ! isinfinite 1.2
}
function predicates-isinfinite-1.2 () {
    ! isinfinite 'NaN'
}
function predicates-isinfinite-1.3 () {
    isinfinite 'inf'
}
function predicates-isinfinite-1.4 () {
    isinfinite '+inf'
}
function predicates-isinfinite-1.5 () {
    isinfinite '-inf'
}


#### isnan

function predicates-isnan-1.1 () {
    ! isnan 1.2
}
function predicates-isnan-1.2 () {
    isnan 'NaN'
}
function predicates-isnan-1.3 () {
    isnan '+NaN'
}
function predicates-isnan-1.4 () {
    isnan '-NaN'
}
function predicates-isnan-1.5 () {
    isnan 'nan'
}
function predicates-isnan-1.6 () {
    isnan '+nan'
}
function predicates-isnan-1.7 () {
    isnan '-nan'
}
function predicates-isnan-1.8 () {
    ! isnan 'inf'
}
function predicates-isnan-1.9 () {
    ! isnan '+inf'
}
function predicates-isnan-1.10 () {
    ! isnan '-inf'
}


#### iszero

function predicates-iszero-1.1 () {
    ! iszero 1.2
}
function predicates-iszero-1.2 () {
    ! iszero 'NaN'
}
function predicates-iszero-1.3 () {
    ! iszero 'inf'
}
function predicates-iszero-1.4 () {
    iszero '0.0'
}
function predicates-iszero-1.5 () {
    iszero '+0.0'
}
function predicates-iszero-1.6 () {
    iszero '-0.0'
}


#### ispositive

function predicates-ispositive-1.1 () {
    ispositive 1.2
}
function predicates-ispositive-1.2 () {
    ! ispositive -1.2
}
function predicates-ispositive-1.3 () {
    ispositive '0.0'
}
function predicates-ispositive-1.4 () {
    ispositive '+0.0'
}
function predicates-ispositive-1.5 () {
    ! ispositive '-0.0'
}
function predicates-ispositive-1.6 () {
    ! ispositive 'NaN'
}
function predicates-ispositive-1.7 () {
    ispositive 'inf'
}
function predicates-ispositive-1.8 () {
    ispositive '+inf'
}
function predicates-ispositive-1.9 () {
    ! ispositive '-inf'
}


#### isnegative

function predicates-isnegative-1.1 () {
    ! isnegative 1.2
}
function predicates-isnegative-1.2 () {
    isnegative -1.2
}
function predicates-isnegative-1.3() {
    ! isnegative '0.0'
}
function predicates-isnegative-1.4 () {
    ! isnegative '+0.0'
}
function predicates-isnegative-1.5 () {
    isnegative '-0.0'
}
function predicates-isnegative-1.6 () {
    ! isnegative 'NaN'
}
function predicates-isnegative-1.7 () {
    ! isnegative 'inf'
}
function predicates-isnegative-1.8 () {
    ! isnegative '+inf'
}
function predicates-isnegative-1.9 () {
    isnegative '-inf'
}


#### isnonpositive

function predicates-isnonpositive-1.1 () {
    ! isnonpositive 1.2
}
function predicates-isnonpositive-1.2 () {
    isnonpositive -1.2
}
function predicates-isnonpositive-1.3() {
    isnonpositive '0.0'
}
function predicates-isnonpositive-1.4 () {
    isnonpositive '+0.0'
}
function predicates-isnonpositive-1.5 () {
    isnonpositive '-0.0'
}
function predicates-isnonpositive-1.6 () {
    ! isnonpositive 'NaN'
}
function predicates-isnonpositive-1.7 () {
    ! isnonpositive 'inf'
}
function predicates-isnonpositive-1.8 () {
    ! isnonpositive '+inf'
}
function predicates-isnonpositive-1.9 () {
    isnonpositive '-inf'
}


#### isnonnegative

function predicates-isnonnegative-1.1 () {
    isnonnegative 1.2
}
function predicates-isnonnegative-1.2 () {
    ! isnonnegative -1.2
}
function predicates-isnonnegative-1.3 () {
    isnonnegative '0.0'
}
function predicates-isnonnegative-1.4 () {
    isnonnegative '+0.0'
}
function predicates-isnonnegative-1.5 () {
    isnonnegative '-0.0'
}
function predicates-isnonnegative-1.6 () {
    ! isnonnegative 'NaN'
}
function predicates-isnonnegative-1.7 () {
    isnonnegative 'inf'
}
function predicates-isnonnegative-1.8 () {
    isnonnegative '+inf'
}
function predicates-isnonnegative-1.9 () {
    ! isnonnegative '-inf'
}


#### iscanonical

function predicates-iscanonical-1.1 () {
    iscanonical 1.2
}


#### isnormal

function predicates-isnormal-1.1 () {
    isnormal 1.2
}


#### issignaling

function predicates-issignaling-1.1 () {
    ! issignaling 1.2
}


#### issubnormal

function predicates-issubnormal-1.1 () {
    ! issubnormal 1.2
}


#### let's go

dotest predicates-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
