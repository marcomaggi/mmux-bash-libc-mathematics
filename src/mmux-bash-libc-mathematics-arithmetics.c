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


static int
add_main (int argc,  char * argv[])
{
  if (2 > argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    char  *	s_op;
    double	op, rop = 0.0;
    int		rv, i;

    s_op = argv[1];
    rv   = sscanf(s_op, "%lf", &op);
    if ((0 == rv) || (EOF == rv)) {
      fprintf(stderr, "add: error: invalid argument: \"%s\"\n", s_op);
      return EXECUTION_FAILURE;
    }

    for (i = 2; i < argc; ++i) {
      s_op = argv[i];
      rv   = sscanf(s_op, "%lf", &op);
      if ((0 == rv) || (EOF == rv)) {
	fprintf(stderr, "add: error: invalid argument: \"%s\"\n", s_op);
	return EXECUTION_FAILURE;
      }
      rop += op;
    }
    return mmux_bash_libc_math_print_result(rop);
  }
}
static int
add_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = add_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "add: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}

static char * add_doc[] = {
  "Compute the addition between floating point numbers, print the result on stdout.",
  (char *)NULL
};

/* Bash will search for this struct  building the name "ciao_struct" from the command
   line argument "ciao" we have given to the "enable" builtin. */
struct builtin add_struct = {
  .name		= "add",		/* Builtin name */
  .function	= add_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= add_doc,		/* Array of long documentation strings. */
  .short_doc	= "add DOUBLE DOUBLE ...",	/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};

/* Called when  the builtin is  enabled and loaded from  the shared object.   If this
   function returns 0, the load fails. */
int
add_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
{
  mmux_bash_libc_math_library_init();
  return (1);
}

#if 0
/* Called when `add' is disabled. */
void
add_builtin_unload (char *name)
{
}
#endif

/* end of file */
