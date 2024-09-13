/*
  Part of: MMUX Bash Libc Mathematics
  Contents: implementation of predicates builtins
  Date: Sep 13, 2024

  Abstract

	This module implements predicates builtins.

  Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>

  This program is free  software: you can redistribute it and/or  modify it under the
  terms of the  GNU Lesser General Public  License as published by  the Free Software
  Foundation, either version 3 of the License, or (at your option) any later version.

  This program  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
  WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
  PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.

  You should have received a copy of the GNU Lesser General Public License along with
  this program.  If not, see <http://www.gnu.org/licenses/>.
*/


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#include "mmux-bash-libc-mathematics-internals.h"


/** --------------------------------------------------------------------
 ** Helpers.
 ** ----------------------------------------------------------------- */

/* FIXME  Should we  take into  account  "+0.0" and  "-0.0"?  (Marco  Maggi; Sep  13,
   2024)*/

static inline bool
mmux_ispositive (double X)
{
  if (isnan(X)) {
    return false;
  } else if (iszero(X)) {
    if (signbit(X)) {
      return false;
    } else {
      return true;
    }
  } else {
    return (0.0 < X)? true : false;
  }
}
static inline bool
mmux_isnegative (double X)
{
  if (isnan(X)) {
    return false;
  } else if (iszero(X)) {
    if (signbit(X)) {
      return true;
    } else {
      return false;
    }
  } else {
    return (0.0 > X)? true : false;
  }
}
static inline bool
mmux_isnonpositive (double X)
{
  if (isnan(X)) {
    return false;
  } else if (iszero(X)) {
    return true;
  } else {
    return (0.0 > X)? true : false;
  }
}
static inline bool
mmux_isnonnegative (double X)
{
  if (isnan(X)) {
    return false;
  } else if (iszero(X)) {
    return true;
  } else {
    return (0.0 < X)? true : false;
  }
}
static inline bool
mmux_isinfinite (double X)
{
  return (FP_INFINITE == (fpclassify(X)))? true : false;
}


/** --------------------------------------------------------------------
 ** Predicates for real numbers.
 ** ----------------------------------------------------------------- */

m4_define([[[MMUX_DEFINE_DOUBLE_PREDICATE]]],[[[
static int
$1_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"$1"
{
  double	op;

  int rv = mmux_bash_libc_math_parse_real(&op, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  if (0) {fprintf(stderr, "%s: real=%lf result=%d\n", __func__, op, $2(op));}

  if ($2(op)) {
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[$1]]],
    [[[(2 == argc)]]],
    [[["$1 DOUBLE"]]],
    [[["Return true if the predicate is satisfied; otherwise return false."]]])
]]])

MMUX_DEFINE_DOUBLE_PREDICATE([[[isnan]]],		[[[isnan]]])
MMUX_DEFINE_DOUBLE_PREDICATE([[[isfinite]]],		[[[isfinite]]])
MMUX_DEFINE_DOUBLE_PREDICATE([[[iscanonical]]],		[[[iscanonical]]])
MMUX_DEFINE_DOUBLE_PREDICATE([[[isnormal]]],		[[[isnormal]]])
MMUX_DEFINE_DOUBLE_PREDICATE([[[issignaling]]],		[[[issignaling]]])
MMUX_DEFINE_DOUBLE_PREDICATE([[[issubnormal]]],		[[[issubnormal]]])
MMUX_DEFINE_DOUBLE_PREDICATE([[[iszero]]],		[[[iszero]]])

MMUX_DEFINE_DOUBLE_PREDICATE([[[ispositive]]],		[[[mmux_ispositive]]])
MMUX_DEFINE_DOUBLE_PREDICATE([[[isnegative]]],		[[[mmux_isnegative]]])
MMUX_DEFINE_DOUBLE_PREDICATE([[[isnonpositive]]],	[[[mmux_isnonpositive]]])
MMUX_DEFINE_DOUBLE_PREDICATE([[[isnonnegative]]],	[[[mmux_isnonnegative]]])
MMUX_DEFINE_DOUBLE_PREDICATE([[[isinfinite]]],		[[[mmux_isinfinite]]])


static int
fpclassify_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char * argv[])
#undef  MMUX_BUILTIN_NAME
#define MMUX_BUILTIN_NAME	"fpclassify"
{
  double	op;

  int rv = mmux_bash_libc_math_parse_real(&op, argv[1], MMUX_BUILTIN_NAME);
  if (EXECUTION_SUCCESS != rv) { return rv; }

  printf("%d", fpclassify(op));
  return EXECUTION_SUCCESS;
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[fpclassify]]],
    [[[(2 == argc)]]],
    [[["fpclassify DOUBLE"]]],
    [[["Print an exact integer representing the classification of DOUBLE."]]])

/* end of file */
