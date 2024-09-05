/*
  Part of: MMUX Bash Libc Mathematics
  Contents: implementation of complex numbers builtins
  Date: Sep  5, 2024

  Abstract

	This module implements complex numbers utilities builtins.

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
 ** Complex numbers utilities.
 ** ----------------------------------------------------------------- */

static int
rectangular_main (int argc MMUX_BASH_LIBC_MATH_UNUSED,  char * argv[])
{
  double		re_op, im_op;
  double complex	rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_double(&re_op, argv[1], "rectangular");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_libc_math_parse_double(&im_op, argv[2], "rectangular");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rop = re_op + im_op * ((double complex)_Complex_I);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[rectangular]]],[[[(3 != argc)]]],
    [[["rectangular DOUBLE_REAL DOUBLE_IMAG"]]],
    [[["Compose a complex number from its real and imaginary parts, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
polar_main (int argc MMUX_BASH_LIBC_MATH_UNUSED,  char * argv[])
{
  double		magnitude_op, angle_op;
  double complex	rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_double(&magnitude_op, argv[1], "polar");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_libc_math_parse_double(&angle_op, argv[2], "polar");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rop = magnitude_op * cos(angle_op) + magnitude_op * sin(angle_op) * ((double complex)_Complex_I);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[polar]]],[[[(3 != argc)]]],
    [[["polar DOUBLE_MAGNITUDE DOUBLE_ANGLE"]]],
    [[["Compose a complex number from its magnitude and angle parts, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
creal_main (int argc MMUX_BASH_LIBC_MATH_UNUSED,  char * argv[])
{
  double complex	op;

  int rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "creal");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  return mmux_bash_libc_math_print_double(creal(op));
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[creal]]],[[[(2 != argc)]]],
    [[["creal COMPLEX"]]],
    [[["Compute the real part of a complex floating-point number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
cimag_main (int argc MMUX_BASH_LIBC_MATH_UNUSED,  char * argv[])
{
  double complex	op;

  int rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "cimag");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  return mmux_bash_libc_math_print_double(cimag(op));
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[cimag]]],[[[(2 != argc)]]],
    [[["cimag COMPLEX"]]],
    [[["Compute the real part of a complex floating-point number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
conj_main (int argc MMUX_BASH_LIBC_MATH_UNUSED,  char * argv[])
{
  double complex	op;

  int rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "conj");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  return mmux_bash_libc_math_print_complex(conj(op));
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[conj]]],[[[(2 != argc)]]],
    [[["conj COMPLEX"]]],
    [[["Compute the conjugate of a complex floating-point number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
carg_main (int argc MMUX_BASH_LIBC_MATH_UNUSED,  char * argv[])
{
  double complex	op;

  int rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "carg");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  return mmux_bash_libc_math_print_complex(carg(op));
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[carg]]],[[[(2 != argc)]]],
    [[["carg COMPLEX"]]],
    [[["Compute the argument of a complex floating-point number, print the result on stdout."]]])

/* end of file */
