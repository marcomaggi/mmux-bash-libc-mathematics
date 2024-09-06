/*
  Part of: MMUX Bash Libc Mathematics
  Contents: implementation of hyperbolic builtins
  Date: Sep  5, 2024

  Abstract

	This  module implements hyperbolic builtins.

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
sinh_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_real(&op, argv[1], "sinh");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = sinh(op);
  return mmux_bash_libc_math_print_real(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[sinh]]],[[[(2 != argc)]]],
    [[["sinh DOUBLE"]]],
    [[["Compute the hyperbolic sine, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
cosh_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_real(&op, argv[1], "cosh");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = cosh(op);
  return mmux_bash_libc_math_print_real(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[cosh]]],[[[(2 != argc)]]],
    [[["cosh DOUBLE"]]],
    [[["Compute the hyperbolic cosine, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
tanh_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_real(&op, argv[1], "tanh");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = tanh(op);
  return mmux_bash_libc_math_print_real(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[tanh]]],[[[(2 != argc)]]],
    [[["tanh DOUBLE"]]],
    [[["Compute the hyperbolic tangent, print the result on stdout."]]])


static int
asinh_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_real(&op, argv[1], "asinh");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = asinh(op);
  return mmux_bash_libc_math_print_real(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[asinh]]],[[[(2 != argc)]]],
    [[["asinh DOUBLE"]]],
    [[["Compute the hyperbolic arc sine, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
acosh_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_real(&op, argv[1], "acosh");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = acosh(op);
  return mmux_bash_libc_math_print_real(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[acosh]]],[[[(2 != argc)]]],
    [[["acosh DOUBLE"]]],
    [[["Compute the hyperbolic arc cosine, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
atanh_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double	op, rop;
  int		rv;

  rv = mmux_bash_libc_math_parse_real(&op, argv[1], "atanh");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = atanh(op);
  return mmux_bash_libc_math_print_real(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[atanh]]],[[[(2 != argc)]]],
    [[["atanh DOUBLE"]]],
    [[["Compute the hyperbolic arc tangent, print the result on stdout."]]])


static int
csinh_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "csinh");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = csinh(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[csinh]]],[[[(2 != argc)]]],
    [[["csinh COMPLEX"]]],
    [[["Compute the hyperbolic sine of a complex number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
ccosh_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "ccosh");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = ccosh(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[ccosh]]],[[[(2 != argc)]]],
    [[["ccosh COMPLEX"]]],
    [[["Compute the hyperbolic cosine of a complex number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
ctanh_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "ctanh");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = ctanh(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[ctanh]]],[[[(2 != argc)]]],
    [[["ctanh COMPLEX"]]],
    [[["Compute the hyperbolic tangent of a complex number, print the result on stdout."]]])


static int
casinh_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "casinh");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = casinh(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[casinh]]],[[[(2 != argc)]]],
    [[["casinh COMPLEX"]]],
    [[["Compute the hyperbolic arc sine of a complex number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
cacosh_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "cacosh");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = cacosh(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[cacosh]]],[[[(2 != argc)]]],
    [[["cacosh COMPLEX"]]],
    [[["Compute the hyperbolic arc cosine of a complex number, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
catanh_main (int argc MMUX_BASH_LIBC_MATH_UNUSED, char *argv[])
{
  double complex	op, rop;
  int			rv;

  rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "catanh");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = catanh(op);
  return mmux_bash_libc_math_print_complex(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[catanh]]],[[[(2 != argc)]]],
    [[["catanh COMPLEX"]]],
    [[["Compute the hyperbolic arc tangent of a complex number, print the result on stdout."]]])

/* end of file */
