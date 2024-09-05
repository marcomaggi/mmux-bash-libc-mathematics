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
  double	op, rop = 0.0;
  int		rv;

  rv = mmux_bash_libc_math_parse_double(&op, argv[1], "add");
  if (EXECUTION_SUCCESS != rv) { return rv; }
  rop = op;

  for (int i = 2; i < argc; ++i) {
    rv = mmux_bash_libc_math_parse_double(&op, argv[i], "add");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop += op;
  }
  return mmux_bash_libc_math_print_double(rop);
}
MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION([[[add]]],[[[(2 > argc)]]],
    [[["add DOUBLE DOUBLE ..."]]],
    [[["Compute the addition between floating point numbers, print the result on stdout."]]])


static int
sub_main (int argc,  char * argv[])
{
  if (2 > argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double	op, rop = 0.0;
    int		rv;

    rv = mmux_bash_libc_math_parse_double(&op, argv[1], "sub");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = op;

    for (int i = 2; i < argc; ++i) {
      rv = mmux_bash_libc_math_parse_double(&op, argv[i], "sub");
      if (EXECUTION_SUCCESS != rv) { return rv; }
      rop -= op;
    }
    return mmux_bash_libc_math_print_double(rop);
  }
}
static int
sub_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = sub_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "sub: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * sub_doc[] = {
  "Compute the subtraction between floating point numbers, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "ciao_struct" from the command
   line argument "ciao" we have given to the "enable" builtin. */
struct builtin sub_struct = {
  .name		= "sub",		/* Builtin name */
  .function	= sub_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= sub_doc,		/* Array of long documentation strings. */
  .short_doc	= "sub DOUBLE DOUBLE ...",	/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};
#if 0
/* Called when  the builtin is  enabled and loaded from  the shared object.   If this
   function returns 0, the load fails. */
int
sub_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
{
  return (1);
}
/* Called when `sub' is disabled. */
void
sub_builtin_unload (char *name)
{
}
#endif


static int
mul_main (int argc,  char * argv[])
{
  if (2 > argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double	op, rop = 0.0;
    int		rv;

    rv = mmux_bash_libc_math_parse_double(&op, argv[1], "mul");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = op;

    for (int i = 2; i < argc; ++i) {
      rv = mmux_bash_libc_math_parse_double(&op, argv[i], "mul");
      if (EXECUTION_SUCCESS != rv) { return rv; }
      rop *= op;
    }
    return mmux_bash_libc_math_print_double(rop);
  }
}
static int
mul_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = mul_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "mul: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * mul_doc[] = {
  "Compute the multiplication between floating point numbers, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "ciao_struct" from the command
   line argument "ciao" we have given to the "enable" builtin. */
struct builtin mul_struct = {
  .name		= "mul",		/* Builtin name */
  .function	= mul_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= mul_doc,		/* Array of long documentation strings. */
  .short_doc	= "mul DOUBLE DOUBLE ...",	/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};
#if 0
/* Called when  the builtin is  enabled and loaded from  the shared object.   If this
   function returns 0, the load fails. */
int
mul_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
{
  return (1);
}
/* Called when `mul' is disabled. */
void
mul_builtin_unload (char *name)
{
}
#endif


static int
div_main (int argc,  char * argv[])
{
  if (2 > argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double	op, rop = 0.0;
    int		rv;

    rv = mmux_bash_libc_math_parse_double(&op, argv[1], "div");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = op;

    for (int i = 2; i < argc; ++i) {
      rv = mmux_bash_libc_math_parse_double(&op, argv[i], "div");
      if (EXECUTION_SUCCESS != rv) { return rv; }
      rop = rop / op;
    }
    return mmux_bash_libc_math_print_double(rop);
  }
}
static int
div_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = div_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "div: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * div_doc[] = {
  "Compute the division between floating point numbers, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "ciao_struct" from the command
   line argument "ciao" we have given to the "enable" builtin. */
struct builtin div_struct = {
  .name		= "div",		/* Builtin name */
  .function	= div_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= div_doc,		/* Array of long documentation strings. */
  .short_doc	= "div DOUBLE DOUBLE ...",	/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};
#if 0
/* Called when  the builtin is  enabled and loaded from  the shared object.   If this
   function returns 0, the load fails. */
int
div_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
{
  return (1);
}
/* Called when `div' is disabled. */
void
div_builtin_unload (char *name)
{
}
#endif


static int
neg_main (int argc, char *argv[])
{
  if (2 != argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double	op, rop;
    int		rv;

    rv = mmux_bash_libc_math_parse_double(&op, argv[1], "neg");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = - op;
    return mmux_bash_libc_math_print_double(rop);
  }
}
static int
neg_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = neg_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "neg: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * neg_doc[] = {
  "Compute the negation of a floating point number, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "ciao_struct" from the command
   line argument "ciao" we have given to the "enable" builtin. */
struct builtin neg_struct = {
  .name		= "neg",		/* Builtin name */
  .function	= neg_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= neg_doc,		/* Array of long documentation strings. */
  .short_doc	= "neg DOUBLE",		/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};
#if 0
/* Called when  the builtin is  enabled and loaded from  the shared object.   If this
   function returns 0, the load fails. */
int
neg_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
{
  return (1);
}
/* Called when `neg' is disabled. */
void
neg_builtin_unload (char *name)
{
}
#endif


static int
cadd_main (int argc,  char * argv[])
{
  if (2 > argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double complex	op, rop = 0.0;
    int			rv;

    rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "cadd");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = op;

    for (int i = 2; i < argc; ++i) {
      rv = mmux_bash_libc_math_parse_complex(&op, argv[i], "cadd");
      if (EXECUTION_SUCCESS != rv) { return rv; }
      rop += op;
    }
    return mmux_bash_libc_math_print_complex(rop);
  }
}
static int
cadd_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = cadd_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "cadd: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * cadd_doc[] = {
  "Compute the complex addition between floating point numbers, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "ciao_struct" from the command
   line argument "ciao" we have given to the "enable" builtin. */
struct builtin cadd_struct = {
  .name		= "cadd",		/* Builtin name */
  .function	= cadd_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= cadd_doc,		/* Array of long documentation strings. */
  .short_doc	= "cadd COMPLEX COMPLEX ...",	/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};


static int
csub_main (int argc,  char * argv[])
{
  if (2 > argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double complex	op, rop = 0.0;
    int			rv;

    rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "csub");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = op;

    for (int i = 2; i < argc; ++i) {
      rv = mmux_bash_libc_math_parse_complex(&op, argv[i], "csub");
      if (EXECUTION_SUCCESS != rv) { return rv; }
      rop -= op;
    }
    return mmux_bash_libc_math_print_complex(rop);
  }
}
static int
csub_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = csub_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "csub: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * csub_doc[] = {
  "Compute the complex subtraction between floating point numbers, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "ciao_struct" from the command
   line argument "ciao" we have given to the "enable" builtin. */
struct builtin csub_struct = {
  .name		= "csub",		/* Builtin name */
  .function	= csub_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= csub_doc,		/* Array of long documentation strings. */
  .short_doc	= "csub COMPLEX COMPLEX ...",	/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};


static int
cmul_main (int argc,  char * argv[])
{
  if (2 > argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double complex	op, rop = 0.0;
    int			rv;

    rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "cmul");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = op;

    for (int i = 2; i < argc; ++i) {
      rv = mmux_bash_libc_math_parse_complex(&op, argv[i], "cmul");
      if (EXECUTION_SUCCESS != rv) { return rv; }
      rop *= op;
    }
    return mmux_bash_libc_math_print_complex(rop);
  }
}
static int
cmul_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = cmul_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "cmul: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * cmul_doc[] = {
  "Compute the complex multiplication between floating point numbers, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "ciao_struct" from the command
   line argument "ciao" we have given to the "enable" builtin. */
struct builtin cmul_struct = {
  .name		= "cmul",		/* Builtin name */
  .function	= cmul_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= cmul_doc,		/* Array of long documentation strings. */
  .short_doc	= "cmul COMPLEX COMPLEX ...",	/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};


static int
cdiv_main (int argc,  char * argv[])
{
  if (2 > argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double complex	op, rop = 0.0;
    int			rv;

    rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "cdiv");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = op;

    for (int i = 2; i < argc; ++i) {
      rv = mmux_bash_libc_math_parse_complex(&op, argv[i], "cdiv");
      if (EXECUTION_SUCCESS != rv) { return rv; }
      rop /= op;
    }
    return mmux_bash_libc_math_print_complex(rop);
  }
}
static int
cdiv_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = cdiv_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "cdiv: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * cdiv_doc[] = {
  "Compute the complex division between floating point numbers, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "ciao_struct" from the command
   line argument "ciao" we have given to the "enable" builtin. */
struct builtin cdiv_struct = {
  .name		= "cdiv",		/* Builtin name */
  .function	= cdiv_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= cdiv_doc,		/* Array of long documentation strings. */
  .short_doc	= "cdiv COMPLEX COMPLEX ...",	/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};


static int
cneg_main (int argc, char *argv[])
{
  if (2 != argc) {
    builtin_usage();
    return EX_USAGE;
  } else {
    double complex	op, rop;
    int			rv;

    rv = mmux_bash_libc_math_parse_complex(&op, argv[1], "cneg");
    if (EXECUTION_SUCCESS != rv) { return rv; }
    rop = - op;
    return mmux_bash_libc_math_print_complex(rop);
  }
}
static int
cneg_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = cneg_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "cneg: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}
static char * cneg_doc[] = {
  "Compute the complex negation of a floating point number, print the result on stdout.",
  (char *)NULL
};
/* Bash will search for this struct  building the name "ciao_struct" from the command
   line argument "ciao" we have given to the "enable" builtin. */
struct builtin cneg_struct = {
  .name		= "cneg",		/* Builtin name */
  .function	= cneg_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,	/* Initial flags for builtin */
  .long_doc	= cneg_doc,		/* Array of long documentation strings. */
  .short_doc	= "cneg COMPLEX",		/* Usage synopsis; becomes short_doc */
  .handle	= 0			/* Reserved for internal use */
};

/* end of file */
