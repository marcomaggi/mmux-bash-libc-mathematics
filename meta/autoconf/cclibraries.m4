#
# Part of: CCLibraries
# Contents: macros for library configuration
# Date: Jul 16, 2014
#
# Abstract
#
#       Macros used in "configure.ac".  Every package in the CCLibraries
#       project must include  this file in its configuration  and use at
#       least the macro CCLIB_CONFIG_SETUP macro.
#
#       Some of these  macros are reused from the  infrastructure of the
#       the package Vicare Scheme.
#
# Copyright (C) 2014, 2017, 2018, 2020 Marco Maggi <mrc.mgg@gmail.com>
#
# This program is  free software: you can redistribute  it and/or modify
# it  under the  terms  of  the GNU  Lesser  General  Public License  as
# published by  the Free  Software Foundation, either  version 3  of the
# License, or (at your option) any later version.
#
# This program  is distributed in the  hope that it will  be useful, but
# WITHOUT   ANY  WARRANTY;   without  even   the  implied   warranty  of
# MERCHANTABILITY  or FITNESS  FOR A  PARTICULAR PURPOSE.   See the  GNU
# General Public License for more details.
#
# You should  have received  a copy  of the  GNU General  Public License
# along with this program.  If not, see <http://www.gnu.org/licenses/>.
#


# CCLIB_CONFIG_SETUP --
#
# Synopsis:
#
#   CCLIB_CONFIG_SETUP()
#
# Setup  base configuration  for  packages in  the CCLibraries  project:
# every package in  the CCLibraries project and  every package depending
# on a  CCLibraries package  must use this  macro in  its "configure.ac"
# file.
#
AC_DEFUN([CCLIB_CONFIG_SETUP],
  [CCLIB_CHECK_C_COMPILER_FUNC_ATTRIBUTES([always_inline],[const],[dllexport],[dllimport],[format],[hot],[leaf],[nonnull],[noreturn],[pure],[returns_nonnull],[unused],[used],[visibility])])

AC_DEFUN([CCLIB_CHECK_C_COMPILER_FUNC_ATTRIBUTES],
  [AX_REQUIRE_DEFINED([AX_GCC_FUNC_ATTRIBUTE])
   m4_map([AX_GCC_FUNC_ATTRIBUTE],[$@])])


# CCLIB_ENABLE_OPTION --
#
# Synopsis:
#
#   CCLIB_ENABLE_OPTION(UPCASE_OPNAME, COMMAND_LINE_OPTION, DEFAULT,
#                       CHECKING_OPTION_MESSAGE, ENABLE_OPTION_MESSAGE)
#
# Wrapper for  AC_ARG_ENABLE which adds  verbose messages and  defines a
# shell variable "cclib_enable_$1" set to "yes" or "no".
#
# $1 - upper case option name
# $2 - command line option name "--enable-$2"
# $3 - default (yes, no)
# $4 - text for the "checking option... " message
# $5 - text for the "enable option... " message
#
AC_DEFUN([CCLIB_ENABLE_OPTION],
  [AS_VAR_SET(cclib_enable_$1,$3)
   AC_MSG_CHECKING([$4])
   AC_ARG_ENABLE([$2],
     [AS_HELP_STRING([--enable-$2],
        [$5 (default is $3)])],
     [AS_CASE([$enableval],
        [yes],[cclib_enable_$1=yes],
        [no], [cclib_enable_$1=no],
        [AC_MSG_ERROR([bad value $enableval for --enable-$2])])],
     [AS_VAR_SET(cclib_enable_$1,$3)])
   AC_MSG_RESULT([$cclib_enable_$1])])


# CCLIB_VALUEOF_TEST --
#
# Synopsis:
#
#    CCLIB_VALUEOF_TEST(VALUEOF_STEM, SYMBOL, INCLUDES)
#
# Wrapper for AC_COMPUTE_INT which computes and  caches the value of a C
# language constant.  For  example, to compute the value  of the "errno"
# constant EPERM we do:
#
#    CCLIB_VALUEOF_TEST([EPERM],[EPERM],[#include <errno.h>])
#
# this macro  expansion: defines  the shell variable  "VALUEOF_EPERM" to
# the    value     of    EPERM;     defines    the     shell    variable
# "cclib_cv_valueof_EPERM"  to  cache  the value;  defines  an  Autoconf
# substitution for the symbol "VALUEOF_EPERM".
#
# $1 - the stem to use to define shell variables representing the result
#      of this test
# $2 - the name of a C language constant whose value is an integer
# $3 - a list of include directive to include C language header files
#
AC_DEFUN([CCLIB_VALUEOF_TEST],
  [AS_VAR_SET(VALUEOF_$1,"-1")
   AC_CACHE_CHECK([the value of '$2'],
     [cclib_cv_valueof_$1],
     [AC_COMPUTE_INT([cclib_cv_valueof_$1],
        [$2],
        [$3],
        [AS_VAR_SET(cclib_cv_valueof_$1,"-1")])])
    AS_VAR_SET(VALUEOF_$1,"$cclib_cv_valueof_$1")
    AC_DEFINE_UNQUOTED([VALUEOF_$1],$VALUEOF_$1,[value of constant $1])])


### done

# end of file
# Local Variables:
# mode: autoconf
# End:
