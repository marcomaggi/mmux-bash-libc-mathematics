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
function format-G-1.2 () {
    mmux-bash-libc-math-double-format "%lG"
    dotest-equal 1 $(add '1')
}

### ------------------------------------------------------------------------

# Select the precision.
function format-G-2.1 () {
    mmux-bash-libc-math-double-format "%.1G"
    dotest-equal '1E+08' $(add '123456789.0987654321')
}
function format-G-2.2 () {
    mmux-bash-libc-math-double-format "%.2G"
    dotest-equal '1.2E+08' $(add '123456789.0987654321')
}
function format-G-2.3 () {
    mmux-bash-libc-math-double-format "%.3G"
    dotest-equal '1.23E+08' $(add '123456789.0987654321')
}
function format-G-2.4 () {
    mmux-bash-libc-math-double-format "%.4G"
    dotest-equal '1.235E+08' $(add '123456789.0987654321')
}

### ------------------------------------------------------------------------

# Select the minimum field width.
function format-G-3.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%20G"
    printf -v RESULT '{%s}' "$(add '123456789.0987654321')"
    dotest-equal '{         1.23457E+08}' QQ(RESULT)
    #              01234567890123456789
}
function format-G-3.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%5.0G"
    printf -v RESULT '{%s}' "$(add '12345')"
    dotest-equal '{1E+04}' QQ(RESULT)
    #              01234
}
function format-G-3.3 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%6.0G"
    printf -v RESULT '{%s}' "$(add '12345')"
    dotest-equal '{ 1E+04}' QQ(RESULT)
    #              012345
}

### ------------------------------------------------------------------------

# Always include a decimal point, even if ".0" requests zero digits after the decimal point.
function format-G-4.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%#.0G"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1.E+08}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Group digits.  This is a GNU Extension.
function format-G-5.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%'.8G"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1.2345679E+08}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Pad the field with zeros.
function format-G-6.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%013.4G"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{00001.235E+08}' QQ(RESULT)
    #              0123456789012
}

# Ignore the padding with zero when left-justification is requested.
function format-G-6.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%-013.3G"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1.23E+08     }' QQ(RESULT)
    #              0123456789012
}

### ------------------------------------------------------------------------

# Always include a plus/minus sign.
function format-G-7.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%+.0G"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{+1E+08}' QQ(RESULT)
}
function format-G-7.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%+.0G"
    printf -v RESULT '{%s}' "$(add '-123456789')"
    dotest-equal '{-1E+08}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Left justify, fill with spaces.
function format-G-8.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%-13.0G"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1E+08        }' QQ(RESULT)
    #              0123456789012
}

### ------------------------------------------------------------------------

# Prefix with a space if the output does not include a plus/minus sign.
function format-G-9.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% .0G"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{ 1E+08}' QQ(RESULT)
}
function format-G-9.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% .0G"
    printf -v RESULT '{%s}' "$(add '-123456789')"
    dotest-equal '{-1E+08}' QQ(RESULT)
}
function format-G-9.3 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% +.0G"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{+1E+08}' QQ(RESULT)
}


#### %e

function format-e-1.1 () {
    mmux-bash-libc-math-double-format "%e"
    dotest-equal 1.000000e+00 $(add '1')
}
function format-e-1.2 () {
    mmux-bash-libc-math-double-format "%le"
    dotest-equal 1.000000e+00 $(add '1')
}

### ------------------------------------------------------------------------

# Select the precision.
function format-e-2.1 () {
    mmux-bash-libc-math-double-format "%.1e"
    dotest-equal '1.2e+08' $(add '123456789.0987654321')
}
function format-e-2.2 () {
    mmux-bash-libc-math-double-format "%.2e"
    dotest-equal '1.23e+08' $(add '123456789.0987654321')
}
function format-e-2.3 () {
    mmux-bash-libc-math-double-format "%.3e"
    dotest-equal '1.235e+08' $(add '123456789.0987654321')
}
function format-e-2.4 () {
    mmux-bash-libc-math-double-format "%.4e"
    dotest-equal '1.2346e+08' $(add '123456789.0987654321')
}

### ------------------------------------------------------------------------

# Select the minimum field width.
function format-e-3.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%20e"
    printf -v RESULT '{%s}' "$(add '123456789.0987654321')"
    dotest-equal '{        1.234568e+08}' QQ(RESULT)
    #              01234567890123456789
}
function format-e-3.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%5.0e"
    printf -v RESULT '{%s}' "$(add '12345')"
    dotest-equal '{1e+04}' QQ(RESULT)
    #              01234
}
function format-e-3.3 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%6.0e"
    printf -v RESULT '{%s}' "$(add '12345')"
    dotest-equal '{ 1e+04}' QQ(RESULT)
    #              012345
}

### ------------------------------------------------------------------------

# Always include a decimal point, even if ".0" requests zero digits after the decimal point.
function format-e-4.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%#.0e"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1.e+08}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Group digits.  This is a GNU Extension.
function format-e-5.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%'.8e"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1.23456789e+08}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Pad the field with zeros.
function format-e-6.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%013.4e"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{0001.2346e+08}' QQ(RESULT)
    #              0123456789012
}

# Ignore the padding with zero when left-justification is requested.
function format-e-6.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%-013.3e"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1.235e+08    }' QQ(RESULT)
    #              0123456789012
}

### ------------------------------------------------------------------------

# Always include a plus/minus sign.
function format-e-7.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%+.0e"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{+1e+08}' QQ(RESULT)
}
function format-e-7.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%+.0e"
    printf -v RESULT '{%s}' "$(add '-123456789')"
    dotest-equal '{-1e+08}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Left justify, fill with spaces.
function format-e-8.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%-13.0e"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1e+08        }' QQ(RESULT)
    #              0123456789012
}

### ------------------------------------------------------------------------

# Prefix with a space if the output does not include a plus/minus sign.
function format-e-9.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% .0e"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{ 1e+08}' QQ(RESULT)
}
function format-e-9.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% .0e"
    printf -v RESULT '{%s}' "$(add '-123456789')"
    dotest-equal '{-1e+08}' QQ(RESULT)
}
function format-e-9.3 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% +.0e"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{+1e+08}' QQ(RESULT)
}


#### %E

function format-E-1.1 () {
    mmux-bash-libc-math-double-format "%E"
    dotest-equal 1.000000E+00 $(add '1')
}
function format-E-1.2 () {
    mmux-bash-libc-math-double-format "%lE"
    dotest-equal 1.000000E+00 $(add '1')
}

### ------------------------------------------------------------------------

# Select the precision.
function format-E-2.1 () {
    mmux-bash-libc-math-double-format "%.1E"
    dotest-equal '1.2E+08' $(add '123456789.0987654321')
}
function format-E-2.2 () {
    mmux-bash-libc-math-double-format "%.2E"
    dotest-equal '1.23E+08' $(add '123456789.0987654321')
}
function format-E-2.3 () {
    mmux-bash-libc-math-double-format "%.3E"
    dotest-equal '1.235E+08' $(add '123456789.0987654321')
}
function format-E-2.4 () {
    mmux-bash-libc-math-double-format "%.4E"
    dotest-equal '1.2346E+08' $(add '123456789.0987654321')
}

### ------------------------------------------------------------------------

# Select the minimum field width.
function format-E-3.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%20E"
    printf -v RESULT '{%s}' "$(add '123456789.0987654321')"
    dotest-equal '{        1.234568E+08}' QQ(RESULT)
    #              01234567890123456789
}
function format-E-3.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%5.0E"
    printf -v RESULT '{%s}' "$(add '12345')"
    dotest-equal '{1E+04}' QQ(RESULT)
    #              01234
}
function format-E-3.3 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%6.0E"
    printf -v RESULT '{%s}' "$(add '12345')"
    dotest-equal '{ 1E+04}' QQ(RESULT)
    #              012345
}

### ------------------------------------------------------------------------

# Always include a decimal point, even if ".0" requests zero digits after the decimal point.
function format-E-4.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%#.0E"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1.E+08}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Group digits.  This is a GNU Extension.
function format-E-5.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%'.8E"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1.23456789E+08}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Pad the field with zeros.
function format-E-6.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%013.4E"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{0001.2346E+08}' QQ(RESULT)
    #              0123456789012
}

# Ignore the padding with zero when left-justification is requested.
function format-E-6.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%-013.3E"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1.235E+08    }' QQ(RESULT)
    #              0123456789012
}

### ------------------------------------------------------------------------

# Always include a plus/minus sign.
function format-E-7.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%+.0E"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{+1E+08}' QQ(RESULT)
}
function format-E-7.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%+.0E"
    printf -v RESULT '{%s}' "$(add '-123456789')"
    dotest-equal '{-1E+08}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Left justify, fill with spaces.
function format-E-8.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%-13.0E"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{1E+08        }' QQ(RESULT)
    #              0123456789012
}

### ------------------------------------------------------------------------

# Prefix with a space if the output does not include a plus/minus sign.
function format-E-9.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% .0E"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{ 1E+08}' QQ(RESULT)
}
function format-E-9.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% .0E"
    printf -v RESULT '{%s}' "$(add '-123456789')"
    dotest-equal '{-1E+08}' QQ(RESULT)
}
function format-E-9.3 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% +.0E"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{+1E+08}' QQ(RESULT)
}


#### %a

function format-a-1.1 () {
    mmux-bash-libc-math-double-format "%a"
    dotest-equal '0x1p+0' $(add '1')
}
function format-a-1.2 () {
    mmux-bash-libc-math-double-format "%la"
    dotest-equal '0x1p+0' $(add '1')
}
function format-a-1.3 () {
    mmux-bash-libc-math-double-format "%a"
    dotest-equal '(0x1.3333333333333p+0)+i*(0x1.b333333333333p+1)' $(cadd '(1.2)+i*(3.4)')
}
function format-a-1.4 () {
    declare -r Z='(0x1.3333333333333p+0)+i*(0x1.b333333333333p+1)'
    mmux-bash-libc-math-double-format "%a"
    dotest-equal QQ(Z) $(cadd QQ(Z))
}

### ------------------------------------------------------------------------

# Select the precision.
function format-a-2.1 () {
    mmux-bash-libc-math-double-format "%.1a"
    dotest-equal '0x1.dp+26' $(add '123456789.0987654321')
}
function format-a-2.2 () {
    mmux-bash-libc-math-double-format "%.2a"
    dotest-equal '0x1.d7p+26' $(add '123456789.0987654321')
}
function format-a-2.3 () {
    mmux-bash-libc-math-double-format "%.3a"
    dotest-equal '0x1.d6fp+26' $(add '123456789.0987654321')
}
function format-a-2.4 () {
    mmux-bash-libc-math-double-format "%.4a"
    dotest-equal '0x1.d6f3p+26' $(add '123456789.0987654321')
}

### ------------------------------------------------------------------------

# Select the minimum field width.
function format-a-3.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%30a"
    printf -v RESULT '{%s}' "$(add '123456789.0987654321')"
    dotest-equal '{         0x1.d6f34546522c4p+26}' QQ(RESULT)
    #              012345678901234567890123456789
}
function format-a-3.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%4.0a"
    printf -v RESULT '{%s}' "$(add '12345')"
    dotest-equal '{0x2p+13}' QQ(RESULT)
    #              01234
}
function format-a-3.3 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%10.0a"
    printf -v RESULT '{%s}' "$(add '12345')"
    dotest-equal '{   0x2p+13}' QQ(RESULT)
    #              0123456789
}

### ------------------------------------------------------------------------

# Always include a decimal point, even if ".0" requests zero digits after the decimal point.
function format-a-4.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%#.0a"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{0x2.p+26}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Group digits.  This is a GNU Extension.  Ignored for this format.
function format-a-5.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%'.8a"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{0x1.d6f34540p+26}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Pad the field with zeros.
function format-a-6.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%020.4a"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{0x000000001.d6f3p+26}' QQ(RESULT)
    #              01234567890123456789
}

# Ignore the padding with zero when left-justification is requested.
function format-a-6.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%-020.3a"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{0x1.d6fp+26         }' QQ(RESULT)
    #              01234567890123456789
}

### ------------------------------------------------------------------------

# Always include a plus/minus sign.
function format-a-7.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%+.0a"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{+0x2p+26}' QQ(RESULT)
}
function format-a-7.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%+.0a"
    printf -v RESULT '{%s}' "$(add '-123456789')"
    dotest-equal '{-0x2p+26}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Left justify, fill with spaces.
function format-a-8.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%-13.0a"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{0x2p+26      }' QQ(RESULT)
    #              0123456789012
}

### ------------------------------------------------------------------------

# Prefix with a space if the output does not include a plus/minus sign.
function format-a-9.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% .0a"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{ 0x2p+26}' QQ(RESULT)
}
function format-a-9.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% .0a"
    printf -v RESULT '{%s}' "$(add '-123456789')"
    dotest-equal '{-0x2p+26}' QQ(RESULT)
}
function format-a-9.3 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% +.0a"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{+0x2p+26}' QQ(RESULT)
}


#### %A

function format-A-1.1 () {
    mmux-bash-libc-math-double-format "%A"
    dotest-equal '0X1P+0' $(add '1')
}
function format-A-1.2 () {
    mmux-bash-libc-math-double-format "%lA"
    dotest-equal '0X1P+0' $(add '1')
}
function format-A-1.3 () {
    mmux-bash-libc-math-double-format "%A"
    dotest-equal '(0X1.3333333333333P+0)+i*(0X1.B333333333333P+1)' $(cadd '(1.2)+i*(3.4)')
}
function format-A-1.4 () {
    declare -r Z='(0X1.3333333333333P+0)+i*(0X1.B333333333333P+1)'
    mmux-bash-libc-math-double-format "%A"
    dotest-equal QQ(Z) $(cadd QQ(Z))
}

### ------------------------------------------------------------------------

# Select the precision.
function format-A-2.1 () {
    mmux-bash-libc-math-double-format "%.1A"
    dotest-equal '0X1.DP+26' $(add '123456789.0987654321')
}
function format-A-2.2 () {
    mmux-bash-libc-math-double-format "%.2A"
    dotest-equal '0X1.D7P+26' $(add '123456789.0987654321')
}
function format-A-2.3 () {
    mmux-bash-libc-math-double-format "%.3A"
    dotest-equal '0X1.D6FP+26' $(add '123456789.0987654321')
}
function format-A-2.4 () {
    mmux-bash-libc-math-double-format "%.4A"
    dotest-equal '0X1.D6F3P+26' $(add '123456789.0987654321')
}

### ------------------------------------------------------------------------

# Select the minimum field width.
function format-A-3.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%30A"
    printf -v RESULT '{%s}' "$(add '123456789.0987654321')"
    dotest-equal '{         0X1.D6F34546522C4P+26}' QQ(RESULT)
    #              012345678901234567890123456789
}
function format-A-3.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%4.0A"
    printf -v RESULT '{%s}' "$(add '12345')"
    dotest-equal '{0X2P+13}' QQ(RESULT)
    #              01234
}
function format-A-3.3 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%10.0A"
    printf -v RESULT '{%s}' "$(add '12345')"
    dotest-equal '{   0X2P+13}' QQ(RESULT)
    #              0123456789
}

### ------------------------------------------------------------------------

# Always include a decimal point, even if ".0" requests zero digits after the decimal point.
function format-A-4.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%#.0A"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{0X2.P+26}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Group digits.  This is a GNU Extension.  Ignored for this format.
function format-A-5.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%'.8A"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{0X1.D6F34540P+26}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Pad the field with zeros.
function format-A-6.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%020.4A"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{0X000000001.D6F3P+26}' QQ(RESULT)
    #              01234567890123456789
}

# Ignore the padding with zero when left-justification is requested.
function format-A-6.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%-020.3A"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{0X1.D6FP+26         }' QQ(RESULT)
    #              01234567890123456789
}

### ------------------------------------------------------------------------

# Always include a plus/minus sign.
function format-A-7.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%+.0A"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{+0X2P+26}' QQ(RESULT)
}
function format-A-7.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%+.0A"
    printf -v RESULT '{%s}' "$(add '-123456789')"
    dotest-equal '{-0X2P+26}' QQ(RESULT)
}

### ------------------------------------------------------------------------

# Left justify, fill with spaces.
function format-A-8.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "%-13.0A"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{0X2P+26      }' QQ(RESULT)
    #              0123456789012
}

### ------------------------------------------------------------------------

# Prefix with a space if the output does not include a plus/minus sign.
function format-A-9.1 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% .0A"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{ 0X2P+26}' QQ(RESULT)
}
function format-A-9.2 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% .0A"
    printf -v RESULT '{%s}' "$(add '-123456789')"
    dotest-equal '{-0X2P+26}' QQ(RESULT)
}
function format-A-9.3 () {
    declare RESULT

    mmux-bash-libc-math-double-format "% +.0A"
    printf -v RESULT '{%s}' "$(add '123456789')"
    dotest-equal '{+0X2P+26}' QQ(RESULT)
}


#### let's go

dotest format-
dotest-final-report

### end of file
# Local Variables:
# mode: sh
# End:
