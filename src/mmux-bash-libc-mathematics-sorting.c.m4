/*
  Part of: MMUX Bash Libc Mathematics
  Contents: implementation of sorting builtins
  Date: Sep  5, 2024

  Abstract

	This module implements sorting builtins.

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
 ** Sorting for real numbers.
 ** ----------------------------------------------------------------- */

static int
min_main (int argc,  char * argv[])
{
  double	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_double(&ops[i], argv[i], "min");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  for (int i = 2; i < argc; ++i) {
    ops[1] = fmin(ops[1], ops[i]);
  }
  return mmux_bash_libc_math_print_double(ops[1]);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[min]]],[[[(2 > argc)]]],
    [[["min DOUBLE DOUBLE ..."]]],
    [[["Select the minimum between floating-point numbers, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
max_main (int argc,  char * argv[])
{
  double	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_double(&ops[i], argv[i], "max");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  for (int i = 2; i < argc; ++i) {
    ops[1] = fmax(ops[1], ops[i]);
  }
  return mmux_bash_libc_math_print_double(ops[1]);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[max]]],[[[(2 > argc)]]],
    [[["max DOUBLE DOUBLE ..."]]],
    [[["Select the maximum between floating-point numbers, print the result on stdout."]]])


/* end of file */
