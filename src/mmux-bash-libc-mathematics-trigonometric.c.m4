/*
  Part of: MMUX Bash Libc Mathematics
  Contents: implementation of trigonometric builtins
  Date: Sep  4, 2024

  Abstract

	This  module implements trigonometric builtins.

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


static int
sin_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_real(&op, argv[1], "sin");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = sin(op);
  return mmux_bash_libc_math_print_real(rop);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[sin]]],
    [[[(2 == argc)]]],
    [[["sin DOUBLE"]]],
    [[["Compute the trigonometric sine, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
cos_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_real(&op, argv[1], "cos");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = cos(op);
  return mmux_bash_libc_math_print_real(rop);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[cos]]],
    [[[(2 == argc)]]],
    [[["cos DOUBLE"]]],
    [[["Compute the trigonometric cosine, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
tan_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_real(&op, argv[1], "tan");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = tan(op);
  return mmux_bash_libc_math_print_real(rop);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[tan]]],
    [[[(2 == argc)]]],
    [[["tan DOUBLE"]]],
    [[["Compute the trigonometric tangent, print the result on stdout."]]])


static int
asin_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_real(&op, argv[1], "asin");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = asin(op);
  return mmux_bash_libc_math_print_real(rop);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[asin]]],
    [[[(2 == argc)]]],
    [[["asin DOUBLE"]]],
    [[["Compute the trigonometric arc sine, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
acos_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_real(&op, argv[1], "acos");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = acos(op);
  return mmux_bash_libc_math_print_real(rop);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[acos]]],
    [[[(2 == argc)]]],
    [[["acos DOUBLE"]]],
    [[["Compute the trigonometric arc cosine, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
atan_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_real(&op, argv[1], "atan");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = atan(op);
  return mmux_bash_libc_math_print_real(rop);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[atan]]],
    [[[(2 == argc)]]],
    [[["atan DOUBLE"]]],
    [[["Compute the trigonometric arc tangent, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
atan2_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op1, op2, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_real(&op1, argv[1], "atan2");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_libc_math_parse_real(&op2, argv[2], "atan2");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rop = atan2(op1, op2);
  return mmux_bash_libc_math_print_real(rop);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[atan2]]],
    [[[(3 == argc)]]],
    [[["atan2 DOUBLE"]]],
    [[["Compute the trigonometric arc tangent, print the result on stdout."]]])


static int
csin_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "csin");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = csin(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[csin]]],
    [[[(2 == argc)]]],
    [[["csin COMPLEX"]]],
    [[["Compute the trigonometric sine of a complex number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
ccos_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "ccos");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = ccos(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[ccos]]],
    [[[(2 == argc)]]],
    [[["ccos COMPLEX"]]],
    [[["Compute the trigonometric cosine of a complex number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
ctan_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "ctan");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = ctan(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[ctan]]],
    [[[(2 == argc)]]],
    [[["ctan COMPLEX"]]],
    [[["Compute the trigonometric tangent of a complex number, print the result on stdout."]]])


static int
casin_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "casin");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = casin(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[casin]]],
    [[[(2 == argc)]]],
    [[["casin COMPLEX"]]],
    [[["Compute the trigonometric arc sine of a complex number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
cacos_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "cacos");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = cacos(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[cacos]]],
    [[[(2 == argc)]]],
    [[["cacos COMPLEX"]]],
    [[["Compute the trigonometric arc cosine of a complex number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
catan_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "catan");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = catan(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[catan]]],
    [[[(2 == argc)]]],
    [[["catan COMPLEX"]]],
    [[["Compute the trigonometric arc tangent of a complex number, print the result on stdout."]]])

/* end of file */
