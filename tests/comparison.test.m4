#!#
#!# Part of: MMUX Bash Libc Mathematics
#!# Contents: tests for comparison functions
#!# Date: Sep  5, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/comparison.bash ; less tests/comparison.log
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


#### isgreater

function comparison-isgreater-1.1 () {
    isgreater 2 1
}
function comparison-isgreater-1.2 () {
    ! isgreater 1 2
}
function comparison-isgreater-1.3 () {
    ! isgreater 1 1
}


#### isgreaterequal

function comparison-isgreaterequal-1.1 () {
    isgreaterequal 2 1
}
function comparison-isgreaterequal-1.2 () {
    ! isgreaterequal 1 2
}
function comparison-isgreaterequal-1.3 () {
    isgreaterequal 1 1
}


#### isless

function comparison-isless-1.1 () {
    ! isless 2 1
}
function comparison-isless-1.2 () {
    isless 1 2
}
function comparison-isless-1.3 () {
    ! isless 1 1
}


#### islessequal

function comparison-islessequal-1.1 () {
    ! islessequal 2 1
}
function comparison-islessequal-1.2 () {
    islessequal 1 2
}
function comparison-islessequal-1.3 () {
    islessequal 1 1
}


#### islessgreater

function comparison-islessgreater-1.1 () {
    islessgreater 2 1
}
function comparison-islessgreater-1.2 () {
    islessgreater 1 2
}
function comparison-islessgreater-1.3 () {
    ! islessgreater 1 1
}


#### isunordered

function comparison-isunordered-1.1 () {
    ! isunordered 2 1
}
function comparison-isunordered-1.2 () {
    ! isunordered 1 2
}
function comparison-isunordered-1.3 () {
    ! isunordered 1 1
}
function comparison-isunordered-1.4 () {
    isunordered 'NaN' 1
}
function comparison-isunordered-1.5 () {
    isunordered 1 'NaN'
}
function comparison-isunordered-1.6 () {
    isunordered 'NaN' 'NaN'
}


#### let's go

dotest comparison-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
