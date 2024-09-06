/*
  Part of: MMUX Bash Libc Mathematics
  Contents: implementation of comparison builtins
  Date: Sep  5, 2024

  Abstract

	This module implements comparison builtins.

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
 ** Comparison for real numbers.
 ** ----------------------------------------------------------------- */

static int
isgreater_main (int argc,  char * argv[])
{
  double	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_real(&ops[i], argv[i], "isgreater");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  if (isgreater(ops[1], ops[2])) {
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[isgreater]]],[[[(2 > argc)]]],
    [[["isgreater DOUBLE DOUBLE"]]],
    [[["Return true if the first operand is greater than the second; otherwise return false."]]])

/* ------------------------------------------------------------------ */

static int
isgreaterequal_main (int argc,  char * argv[])
{
  double	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_real(&ops[i], argv[i], "isgreaterequal");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  if (isgreaterequal(ops[1], ops[2])) {
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[isgreaterequal]]],[[[(2 > argc)]]],
    [[["isgreaterequal DOUBLE DOUBLE"]]],
    [[["Return true if the first operand is greater than, or equal to, the second; otherwise return false."]]])

/* ------------------------------------------------------------------ */

static int
isless_main (int argc,  char * argv[])
{
  double	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_real(&ops[i], argv[i], "isless");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  if (isless(ops[1], ops[2])) {
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[isless]]],[[[(2 > argc)]]],
    [[["isless DOUBLE DOUBLE"]]],
    [[["Return true if the first operand is less than the second; otherwise return false."]]])

/* ------------------------------------------------------------------ */

static int
islessequal_main (int argc,  char * argv[])
{
  double	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_real(&ops[i], argv[i], "islessequal");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  if (islessequal(ops[1], ops[2])) {
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[islessequal]]],[[[(2 > argc)]]],
    [[["islessequal DOUBLE DOUBLE"]]],
    [[["Return true if the first operand is less than, or equal to, the second; otherwise return false."]]])

/* ------------------------------------------------------------------ */

static int
islessgreater_main (int argc,  char * argv[])
{
  double	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_real(&ops[i], argv[i], "islessgreater");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  if (islessgreater(ops[1], ops[2])) {
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[islessgreater]]],[[[(2 > argc)]]],
    [[["islessgreater DOUBLE DOUBLE"]]],
    [[["Return true if the first operand is less than, or greater than, the second; otherwise return false."]]])

/* ------------------------------------------------------------------ */

static int
isunordered_main (int argc,  char * argv[])
{
  double	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_real(&ops[i], argv[i], "isunordered");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  if (isunordered(ops[1], ops[2])) {
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[isunordered]]],[[[(2 > argc)]]],
    [[["isunordered DOUBLE DOUBLE"]]],
    [[["Return true if the first operand is unordered with respec to the second; otherwise return false."]]])


/* end of file */
