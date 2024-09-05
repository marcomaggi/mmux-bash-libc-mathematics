/*
  Part of: MMUX Bash Libc Mathematics
  Contents: implementation of arithmetics builtins
  Date: Sep  4, 2024

  Abstract

	This module implements arithmetics builtins.

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
 ** Arithmetics for real numbers.
 ** ----------------------------------------------------------------- */

static int
add_main (int argc,  char * argv[])
{
  double	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_double(&ops[i], argv[i], "add");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  for (int i = 2; i < argc; ++i) {
    ops[1] += ops[i];
  }
  return mmux_bash_libc_math_print_double(ops[1]);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[add]]],[[[(2 > argc)]]],
    [[["add DOUBLE DOUBLE ..."]]],
    [[["Compute the addition between floating-point numbers, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
sub_main (int argc,  char * argv[])
{
  double	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_double(&ops[i], argv[i], "sub");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  for (int i = 2; i < argc; ++i) {
    ops[1] -= ops[i];
  }
  return mmux_bash_libc_math_print_double(ops[1]);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[sub]]],[[[(2 > argc)]]],
    [[["sub DOUBLE DOUBLE ..."]]],
    [[["Compute the subtraction between floating-point numbers, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
mul_main (int argc,  char * argv[])
{
  double	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_double(&ops[i], argv[i], "mul");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  for (int i = 2; i < argc; ++i) {
    ops[1] *= ops[i];
  }
  return mmux_bash_libc_math_print_double(ops[1]);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[mul]]],[[[(2 > argc)]]],
    [[["mul DOUBLE DOUBLE ..."]]],
    [[["Compute the multiplication between floating-point numbers, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
div_main (int argc,  char * argv[])
{
  double	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_double(&ops[i], argv[i], "div");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  for (int i = 2; i < argc; ++i) {
    ops[1] /= ops[i];
  }
  return mmux_bash_libc_math_print_double(ops[1]);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[div]]],[[[(2 > argc)]]],
    [[["div DOUBLE DOUBLE ..."]]],
    [[["Compute the division between floating-point numbers, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
neg_main (int argc MMUX_BASH_LIBC_MATH_UNUSED,  char * argv[])
{
  double	op;

  int rv = mmux_bash_libc_math_parse_double(&op, argv[1], "neg");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  return mmux_bash_libc_math_print_double(-op);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[neg]]],[[[(2 != argc)]]],
    [[["neg DOUBLE"]]],
    [[["Compute the negision of a floating-point number, print the result on stdout."]]])


/** --------------------------------------------------------------------
 ** Arithmetics for complex numbers.
 ** ----------------------------------------------------------------- */

static int
cadd_main (int argc,  char * argv[])
{
  double complex	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_complex(&ops[i], argv[i], "cadd");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  for (int i = 2; i < argc; ++i) {
    ops[1] += ops[i];
  }
  return mmux_bash_libc_math_print_complex(ops[1]);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[cadd]]],[[[(2 > argc)]]],
    [[["cadd COMPLEX COMPLEX ..."]]],
    [[["Compute the addition between complex floating-point numbers, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
csub_main (int argc,  char * argv[])
{
  double complex	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_complex(&ops[i], argv[i], "csub");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  for (int i = 2; i < argc; ++i) {
    ops[1] -= ops[i];
  }
  return mmux_bash_libc_math_print_complex(ops[1]);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[csub]]],[[[(2 > argc)]]],
    [[["csub COMPLEX COMPLEX ..."]]],
    [[["Compute the subtraction between complex floating-point numbers, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
cmul_main (int argc,  char * argv[])
{
  double complex	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_complex(&ops[i], argv[i], "cmul");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  for (int i = 2; i < argc; ++i) {
    ops[1] *= ops[i];
  }
  return mmux_bash_libc_math_print_complex(ops[1]);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[cmul]]],[[[(2 > argc)]]],
    [[["cmul COMPLEX COMPLEX ..."]]],
    [[["Compute the multiplication between complex floating-point numbers, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
cdiv_main (int argc,  char * argv[])
{
  double complex	ops[argc]; /* we allocate one more of these, not a problem */

  for (int i = 1; i < argc; ++i) {
    int rv = mmux_bash_libc_math_parse_complex(&ops[i], argv[i], "cdiv");
    if (EXECUTION_SUCCESS != rv) { return rv; }
  }

  for (int i = 2; i < argc; ++i) {
    ops[1] /= ops[i];
  }
  return mmux_bash_libc_math_print_complex(ops[1]);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[cdiv]]],[[[(2 > argc)]]],
    [[["cdiv COMPLEX COMPLEX ..."]]],
    [[["Compute the division between complex floating-point numbers, print the result on stdout."]]])

/* ------------------------------------------------------------------ */

static int
cneg_main (int argc MMUX_BASH_LIBC_MATH_UNUSED,  char * argv[])
{
  double complex	op;

  int rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "cneg");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  return mmux_bash_libc_math_print_complex(-op);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[cneg]]],[[[(2 != argc)]]],
    [[["cneg COMPLEX"]]],
    [[["Compute the negision of a complex floating-point number, print the result on stdout."]]])

/* end of file */
