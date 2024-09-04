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


static void
bind_it (const char * name, double value)
{
  SHELL_VAR *	v MMUX_BASH_LIBC_MATH_UNUSED;
  char		str[1024];
  /* I do  not know what  FLAGS is for,  but setting it  to zero seems  fine.  (Marco
     Maggi; Sep 4, 2024) */
  int		flags = 0;

  snprintf(str, 1024, "%lf", value);
  v = bind_global_variable(name, str, flags);
}
void
mmux_bash_libc_math_trigonometric_init_module (void)
{
  bind_it("M_E",		M_E);
  bind_it("M_LOG2E",		M_LOG2E);
  bind_it("M_LOG10E",		M_LOG10E);
  bind_it("M_LN2",		M_LN2);
  bind_it("M_LN10",		M_LN10);
  bind_it("M_PI",		M_PI);
  bind_it("M_PI_2",		M_PI_2);
  bind_it("M_PI_4",		M_PI_4);
  bind_it("M_1_PI",		M_1_PI);
  bind_it("M_2_PI",		M_2_PI);
  bind_it("M_2_SQRTPI",		M_2_SQRTPI);
  bind_it("M_SQRT2",		M_SQRT2);
  bind_it("M_SQRT1_2",		M_SQRT1_2);
  bind_it("FP_NAN",		FP_NAN);
  bind_it("FP_INFINITE",	FP_INFINITE);
  bind_it("FP_ZERO",		FP_ZERO);
  bind_it("FP_SUBNORMAL",	FP_SUBNORMAL);
  bind_it("FP_NORMAL",		FP_NORMAL);
}


static int
sin_builtin (WORD_LIST * list)
{
  char *	s_op;
  double	op, rop;
  int		rv;

  if (!list) {
    builtin_usage();
    return EX_USAGE;
  }

  s_op = list->word->word;
  rv   = sscanf(s_op, "%lf", &op);
  if ((0 == rv) || (EOF == rv)) {
    fprintf(stderr, "sin: error: invalid argument: \"%s\"\n", s_op);
    return EXECUTION_FAILURE;
  }
  rop  = sin(op);
  return mmux_bash_libc_math_print_result(rop);
}

static char * sin_doc[] = {
  "Compute the trigonometric sine, print the result on stdout.",
  (char *)NULL
};

/* Bash will search for this struct  building the name "ciao_struct" from the command
   line argument "ciao" we have given to the "enable" builtin. */
struct builtin sin_struct = {
  .name		= "sin",		/* Builtin name */
  .function	= sin_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= sin_doc,		/* Array of long documentation strings. */
  .short_doc	= "sin DOUBLE",		/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};

/* Called when  the builtin is  enabled and loaded from  the shared object.   If this
   function returns 0, the load fails. */
int
sin_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
{
  mmux_bash_libc_math_library_init();
  return (1);
}

#if 0
/* Called when `sin' is disabled. */
void
sin_builtin_unload (char *name)
{
}
#endif

/* end of file */
