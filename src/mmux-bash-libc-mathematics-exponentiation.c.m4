/*
  Part of: MMUX Bash Libc Mathematics
  Contents: implementation of exponentiation and logarithms builtins
  Date: Sep  6, 2024

  Abstract

	This  module implements exponentiation and logarithms builtins.

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
exp_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_double(&op, argv[1], "exp");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = exp(op);
  return mmux_bash_libc_math_print_double(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[exp]]],[[[(2 != argc)]]],
    [[["exp DOUBLE"]]],
    [[["Compute 'e' raised to the power of a real number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
exp2_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_double(&op, argv[1], "exp2");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = exp2(op);
  return mmux_bash_libc_math_print_double(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[exp2]]],[[[(2 != argc)]]],
    [[["exp2 DOUBLE"]]],
    [[["Compute '2' raised to the power of a real number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
exp10_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_double(&op, argv[1], "exp10");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = exp10(op);
  return mmux_bash_libc_math_print_double(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[exp10]]],[[[(2 != argc)]]],
    [[["exp10 DOUBLE"]]],
    [[["Compute '10' raised to the power of a real number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
expm1_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_double(&op, argv[1], "expm1");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = expm1(op);
  return mmux_bash_libc_math_print_double(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[expm1]]],[[[(2 != argc)]]],
    [[["expm1 DOUBLE"]]],
    [[["Compute 'exp(DOUBLE) - 1', print the result on stdout."]]])


static int
log_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_double(&op, argv[1], "log");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = log(op);
  return mmux_bash_libc_math_print_double(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[log]]],[[[(2 != argc)]]],
    [[["log DOUBLE"]]],
    [[["Compute the base 'e' logarithm of a real number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
log2_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_double(&op, argv[1], "log2");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = log2(op);
  return mmux_bash_libc_math_print_double(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[log2]]],[[[(2 != argc)]]],
    [[["log2 DOUBLE"]]],
    [[["Compute the base '2' logarithm of a real number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
log10_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_double(&op, argv[1], "log10");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = log10(op);
  return mmux_bash_libc_math_print_double(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[log10]]],[[[(2 != argc)]]],
    [[["log10 DOUBLE"]]],
    [[["Compute the base '10' logarithm of a real number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
logb_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_double(&op, argv[1], "logb");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = logb(op);
  return mmux_bash_libc_math_print_double(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[logb]]],[[[(2 != argc)]]],
    [[["logb DOUBLE"]]],
    [[["Extract the exponent of a real number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
log1p_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_double(&op, argv[1], "log1p");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = log1p(op);
  return mmux_bash_libc_math_print_double(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[log1p]]],[[[(2 != argc)]]],
    [[["log1p DOUBLE"]]],
    [[["Compute 'log(1 + DOUBLE)', print the result on stdout."]]])


static int
pow_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op1, op2, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_double(&op1, argv[1], "pow");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_libc_math_parse_double(&op2, argv[2], "pow");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rop = pow(op1, op2);
  return mmux_bash_libc_math_print_double(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[pow]]],[[[(3 != argc)]]],
    [[["pow DOUBLE_BASE DOUBLE_EXPONENT"]]],
    [[["Compute BASE raised to the power of EXPONENT for real numbers, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
sqrt_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_double(&op, argv[1], "sqrt");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = sqrt(op);
  return mmux_bash_libc_math_print_double(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[sqrt]]],[[[(2 != argc)]]],
    [[["sqrt DOUBLE"]]],
    [[["Compute the square root a real number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
cbrt_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_double(&op, argv[1], "cbrt");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = cbrt(op);
  return mmux_bash_libc_math_print_double(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[cbrt]]],[[[(2 != argc)]]],
    [[["cbrt DOUBLE"]]],
    [[["Compute the cube root a real number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
hypot_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op1, op2, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_double(&op1, argv[1], "hypot");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_libc_math_parse_double(&op2, argv[2], "hypot");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rop = hypot(op1, op2);
  return mmux_bash_libc_math_print_double(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[hypot]]],[[[(3 != argc)]]],
    [[["hypot DOUBLE_X DOUBLE_Y"]]],
    [[["Compute 'sqrt(DOUBLE_X^2 + DOUBLE_Y^2)', print the result on stdout."]]])


static int
cexp_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "cexp");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = cexp(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[cexp]]],[[[(2 != argc)]]],
    [[["cexp DOUBLE"]]],
    [[["Compute 'e' raised to the power of a complex number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
clog_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "clog");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = clog(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[clog]]],[[[(2 != argc)]]],
    [[["clog DOUBLE"]]],
    [[["Compute the base 'e' logarithm of a complex number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
clog10_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "clog10");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = clog10(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[clog10]]],[[[(2 != argc)]]],
    [[["clog10 DOUBLE"]]],
    [[["Compute the base '10' logarithm of a complex number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
csqrt_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "csqrt");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = csqrt(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[csqrt]]],[[[(2 != argc)]]],
    [[["csqrt DOUBLE"]]],
    [[["Compute the square root a complex number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
cpow_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op1, op2, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op1, argv[1], "cpow");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rv = mmux_bash_libc_math_parse_complex(&op2, argv[2], "cpow");
  if (EXECUTION_SUCCESS != rv) { return rv; }

  rop = cpow(op1, op2);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[cpow]]],[[[(3 != argc)]]],
    [[["cpow DOUBLE_BASE DOUBLE_EXPONENT"]]],
    [[["Compute BASE raised to the power of EXPONENT for complex numbers, print the result on stdout."]]])


/* end of file */
