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
sin_main (int argc, char *argv[])
{
  if (2 != argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double	op, rop;
    int		rv;

    rv = mmux_bash_libc_math_parse_double(&op, argv[1], "sin");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = sin(op);
    return mmux_bash_libc_math_print_result(rop);
  }
}
static int
sin_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = sin_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "sin: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * sin_doc[] = {
  "Compute the trigonometric sine, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "XXX_struct" from the command
   line argument "XXX" we have given to the "enable" builtin. */
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


static int
cos_main (int argc, char *argv[])
{
  if (2 != argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double	op, rop;
    int		rv;

    rv = mmux_bash_libc_math_parse_double(&op, argv[1], "cos");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = cos(op);
    return mmux_bash_libc_math_print_result(rop);
  }
}
static int
cos_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = cos_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "cos: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * cos_doc[] = {
  "Compute the trigonometric cosine, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "XXX_struct" from the command
   line argument "XXX" we have given to the "enable" builtin. */
struct builtin cos_struct = {
  .name		= "cos",		/* Builtin name */
  .function	= cos_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= cos_doc,		/* Array of long documentation strings. */
  .short_doc	= "cos DOUBLE",		/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};
/* Called when  the builtin is  enabled and loaded from  the shared object.   If this
   function returns 0, the load fails. */
int
cos_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
{
  mmux_bash_libc_math_library_init();
  return (1);
}
#if 0
/* Called when `cos' is disabled. */
void
cos_builtin_unload (char *name)
{
}
#endif


static int
tan_main (int argc, char *argv[])
{
  if (2 != argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double	op, rop;
    int		rv;

    rv = mmux_bash_libc_math_parse_double(&op, argv[1], "tan");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = tan(op);
    return mmux_bash_libc_math_print_result(rop);
  }
}
static int
tan_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = tan_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "tan: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * tan_doc[] = {
  "Compute the trigonometric tangent, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "XXX_struct" from the command
   line argument "XXX" we have given to the "enable" builtin. */
struct builtin tan_struct = {
  .name		= "tan",		/* Builtin name */
  .function	= tan_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= tan_doc,		/* Array of long documentation strings. */
  .short_doc	= "tan DOUBLE",		/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};
/* Called when  the builtin is  enabled and loaded from  the shared object.   If this
   function returns 0, the load fails. */
int
tan_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
{
  mmux_bash_libc_math_library_init();
  return (1);
}
#if 0
/* Called when `tan' is disabled. */
void
tan_builtin_unload (char *name)
{
}
#endif


static int
asin_main (int argc, char *argv[])
{
  if (2 != argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double	op, rop;
    int		rv;

    rv = mmux_bash_libc_math_parse_double(&op, argv[1], "asin");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = asin(op);
    return mmux_bash_libc_math_print_result(rop);
  }
}
static int
asin_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = asin_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "asin: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * asin_doc[] = {
  "Compute the trigonometric arc sine, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "XXX_struct" from the command
   line argument "XXX" we have given to the "enable" builtin. */
struct builtin asin_struct = {
  .name		= "asin",		/* Builtin name */
  .function	= asin_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= asin_doc,		/* Array of long documentation strings. */
  .short_doc	= "asin DOUBLE",		/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};
/* Called when  the builtin is  enabled and loaded from  the shared object.   If this
   function returns 0, the load fails. */
int
asin_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
{
  mmux_bash_libc_math_library_init();
  return (1);
}
#if 0
/* Called when `asin' is disabled. */
void
asin_builtin_unload (char *name)
{
}
#endif


static int
acos_main (int argc, char *argv[])
{
  if (2 != argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double	op, rop;
    int		rv;

    rv = mmux_bash_libc_math_parse_double(&op, argv[1], "acos");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = acos(op);
    return mmux_bash_libc_math_print_result(rop);
  }
}
static int
acos_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = acos_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "acos: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * acos_doc[] = {
  "Compute the trigonometric arc cosine, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "XXX_struct" from the command
   line argument "XXX" we have given to the "enable" builtin. */
struct builtin acos_struct = {
  .name		= "acos",		/* Builtin name */
  .function	= acos_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= acos_doc,		/* Array of long documentation strings. */
  .short_doc	= "acos DOUBLE",		/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};
/* Called when  the builtin is  enabled and loaded from  the shared object.   If this
   function returns 0, the load fails. */
int
acos_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
{
  mmux_bash_libc_math_library_init();
  return (1);
}
#if 0
/* Called when `acos' is disabled. */
void
acos_builtin_unload (char *name)
{
}
#endif


static int
atan_main (int argc, char *argv[])
{
  if (2 != argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double	op, rop;
    int		rv;

    rv = mmux_bash_libc_math_parse_double(&op, argv[1], "atan");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = atan(op);
    return mmux_bash_libc_math_print_result(rop);
  }
}
static int
atan_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = atan_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "atan: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * atan_doc[] = {
  "Compute the trigonometric arc tangent, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "XXX_struct" from the command
   line argument "XXX" we have given to the "enable" builtin. */
struct builtin atan_struct = {
  .name		= "atan",		/* Builtin name */
  .function	= atan_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= atan_doc,		/* Array of long documentation strings. */
  .short_doc	= "atan DOUBLE",		/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};
/* Called when  the builtin is  enabled and loaded from  the shared object.   If this
   function returns 0, the load fails. */
int
atan_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
{
  mmux_bash_libc_math_library_init();
  return (1);
}
#if 0
/* Called when `atan' is disabled. */
void
atan_builtin_unload (char *name)
{
}
#endif


static int
atan2_main (int argc, char *argv[])
{
  if (3 != argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double	op1, op2, rop;
    int		rv;

    rv = mmux_bash_libc_math_parse_double(&op1, argv[1], "atan2");
    if (EXECUTION_SUCCESS != rv) { return rv; }

    rv = mmux_bash_libc_math_parse_double(&op2, argv[2], "atan2");
    if (EXECUTION_SUCCESS != rv) { return rv; }

    rop = atan2(op1, op2);
    return mmux_bash_libc_math_print_result(rop);
  }
}
static int
atan2_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = atan2_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "atan2: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * atan2_doc[] = {
  "Compute the trigonometric arc tangent, print the result on stdout.",
  (char *)NULL
};
/* Bash will search  for this struct building the name  "XXX_struct" from the command
   line argument "XXX" we have given to the "enable" builtin. */
struct builtin atan2_struct = {
  .name		= "atan2",		/* Builtin name */
  .function	= atan2_builtin,	/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= atan2_doc,		/* Array of long documentation strings. */
  .short_doc	= "atan2 DOUBLE",	/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};
/* Called when  the builtin is  enabled and loaded from  the shared object.   If this
   function returns 0, the load fails. */
int
atan2_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
{
  mmux_bash_libc_math_library_init();
  return (1);
}
#if 0
/* Called when `atan2' is disabled. */
void
atan2_builtin_unload (char *name)
{
}
#endif


/* end of file */
