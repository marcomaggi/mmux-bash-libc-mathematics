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


void
mmux_bash_libc_math_trigonometric_init_module (void)
{
  return;
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
