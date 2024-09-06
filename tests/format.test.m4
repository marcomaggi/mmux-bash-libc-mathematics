#!#
#!# Part of: MMUX Bash Libc Mathematics
#!# Contents: tests for double format facilities
#!# Date: Sep  5, 2024
#!#
#!# Abstract
#!#
#!#	This file must be executed with one among:
#!#
#!#		$ make all check TESTS=tests/format.bash ; less tests/format.log
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


#### %f

function format-f-1.1 () {
    mmux-bash-libc-math-double-format "%f"
    dotest-equal 1.000000 $(add '1')
}
function format-f-1.2 () {
    mmux-bash-libc-math-double-format "%lf"
    dotest-equal 1.000000 $(add '1')
}

### ------------------------------------------------------------------------

# Select the precision.
function format-f-2.1 () {
    mmux-bash-libc-math-double-format "%.1f"
    dotest-equal '123456789.1' $(add '123456789.0987654321')
}
function format-f-2.2 () {
    mmux-bash-libc-math-double-format "%.2f"
    dotest-equal '123456789.10' $(add '123456789.0987654321')
}
function format-f-2.3 () {
    mmux-bash-libc-math-double-format "%.3f"
    dotest-equal '123456789.099' $(add '123456789.0987654321')
}
function format-f-2.4 () {
    mmux-bash-libc-math-double-format "%.4f"
    dotest-equal '123456789.0988' $(add '123456789.0987654321')
}

### ------------------------------------------------------------------------

# Select the minimum field width.
function format-f-3.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%20f"
    printf -v RESULT '{%s}' "$(add '123456789.0987654321')"
    dotest-equal '{    123456789.098765}' QQ(RESULT)
    #              01234567890123456789
}
function format-f-3.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%5.0f"
    printf -v RESULT '{%s}' "$(add '12345')"
    dotest-equal '{12345}' QQ(RESULT)
}
function format-f-3.3 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%6.0f"
    printf -v RESULT '{%s}' "$(add '12345')"
    dotest-equal '{ 12345}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Always include a decimal point, even if ".0" requests zero digits after the decimal point.
function format-f-4.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%#.0f"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{123456789.}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Group digits.  This is a GNU Extension.
function format-f-5.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%'.0f"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{123,456,789}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Pad the field with zeros.
function format-f-6.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%013.0f"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{0000123456789}' QQ(RESULT)
}

# Ignore the padding with zero when left-justification is requested.
function format-f-6.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%-013.0f"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{123456789    }' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Always include a plus/minus sign.
function format-f-7.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%+.0f"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{+123456789}' QQ(RESULT)
}
function format-f-7.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%+.0f"
    printf -v RESULT '{%s}' "$(add '-123456789')"
    dotest-equal '{-123456789}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Left justify, fill with spaces.
function format-f-8.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%-13.0f"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{123456789    }' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Prefix with a space if the output does not include a plus/minus sign.
function format-f-9.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% .0f"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{ 123456789}' QQ(RESULT)
}
function format-f-9.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% .0f"
    printf -v RESULT '{%s}' "$(add '-123456789')"
    dotest-equal '{-123456789}' QQ(RESULT)
}
function format-f-9.3 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% +.0f"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{+123456789}' QQ(RESULT)
}


#### %g

function format-g-1.1 () {
    mmux-bash-libc-math-double-format "%g"
    dotest-equal 1 $(add '1')
}
function format-g-1.2 () {
    mmux-bash-libc-math-double-format "%lg"
    dotest-equal 1 $(add '1')
}

### ------------------------------------------------------------------------

# Select the precision.
function format-g-2.1 () {
    mmux-bash-libc-math-double-format "%.1g"
    dotest-equal '1e+08' $(add '123456789.0987654321')
}
function format-g-2.2 () {
    mmux-bash-libc-math-double-format "%.2g"
    dotest-equal '1.2e+08' $(add '123456789.0987654321')
}
function format-g-2.3 () {
    mmux-bash-libc-math-double-format "%.3g"
    dotest-equal '1.23e+08' $(add '123456789.0987654321')
}
function format-g-2.4 () {
    mmux-bash-libc-math-double-format "%.4g"
    dotest-equal '1.235e+08' $(add '123456789.0987654321')
}

### ------------------------------------------------------------------------

# Select the minimum field width.
function format-g-3.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%20g"
    printf -v RESULT '{%s}' "$(add '123456789.0987654321')"
    dotest-equal '{         1.23457e+08}' QQ(RESULT)
    #              01234567890123456789
}
function format-g-3.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%5.0g"
    printf -v RESULT '{%s}' "$(add '12345')"
    dotest-equal '{1e+04}' QQ(RESULT)
    #              01234
}
function format-g-3.3 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%6.0g"
    printf -v RESULT '{%s}' "$(add '12345')"
    dotest-equal '{ 1e+04}' QQ(RESULT)
    #              012345
}

### ------------------------------------------------------------------------

# Always include a decimal point, even if ".0" requests zero digits after the decimal point.
function format-g-4.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%#.0g"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1.e+08}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Group digits.  This is a GNU Extension.
function format-g-5.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%'.8g"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1.2345679e+08}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Pad the field with zeros.
function format-g-6.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%013.4g"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{00001.235e+08}' QQ(RESULT)
    #              0123456789012
}

# Ignore the padding with zero when left-justification is requested.
function format-g-6.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%-013.3g"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1.23e+08     }' QQ(RESULT)
    #              0123456789012
}

### ------------------------------------------------------------------------

# Always include a plus/minus sign.
function format-g-7.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%+.0g"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{+1e+08}' QQ(RESULT)
}
function format-g-7.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%+.0g"
    printf -v RESULT '{%s}' "$(add '-123456789')"
    dotest-equal '{-1e+08}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Left justify, fill with spaces.
function format-g-8.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%-13.0g"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1e+08        }' QQ(RESULT)
    #              0123456789012
}

### ------------------------------------------------------------------------

# Prefix with a space if the output does not include a plus/minus sign.
function format-g-9.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% .0g"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{ 1e+08}' QQ(RESULT)
}
function format-g-9.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% .0g"
    printf -v RESULT '{%s}' "$(add '-123456789')"
    dotest-equal '{-1e+08}' QQ(RESULT)
}
function format-g-9.3 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% +.0g"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{+1e+08}' QQ(RESULT)
}


#### %G

function format-G-1.1 () {
    mmux-bash-libc-math-double-format "%G"
    dotest-equal 1 $(add '1')
}


#### %e

function format-e-1.1 () {
    mmux-bash-libc-math-double-format "%e"
    dotest-equal 1.000000e+00 $(add '1')
}


#### %E

function format-E-1.1 () {
    mmux-bash-libc-math-double-format "%e"
    dotest-equal 1.000000e+00 $(add '1')
}


#### let's go

dotest format-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
