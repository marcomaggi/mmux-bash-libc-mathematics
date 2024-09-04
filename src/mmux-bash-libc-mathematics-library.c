/*
  Part of: MMUX Bash Libc Mathematics
  Contents: library functions
  Date: Sep  4, 2024

  Abstract

	This module implements library initialisation and version numbers inspection.

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

#undef  MMUX_BASH_LIBC_MATH_RESULT_FORMAT_MAXLEN
#define MMUX_BASH_LIBC_MATH_RESULT_FORMAT_MAXLEN	1023
static char mmux_bash_libc_math_result_format[1+MMUX_BASH_LIBC_MATH_RESULT_FORMAT_MAXLEN];


/** --------------------------------------------------------------------
 ** Version functions.
 ** ----------------------------------------------------------------- */

char const *
mmux_bash_libc_math_version_string (void)
{
  return mmux_bash_libc_mathematics_VERSION_INTERFACE_STRING;
}
int
mmux_bash_libc_math_version_interface_current (void)
{
  return mmux_bash_libc_mathematics_VERSION_INTERFACE_CURRENT;
}
int
mmux_bash_libc_math_version_interface_revision (void)
{
  return mmux_bash_libc_mathematics_VERSION_INTERFACE_REVISION;
}
int
mmux_bash_libc_math_version_interface_age (void)
{
  return mmux_bash_libc_mathematics_VERSION_INTERFACE_AGE;
}


/** --------------------------------------------------------------------
 ** Library initialisation.
 ** ----------------------------------------------------------------- */

void
mmux_bash_libc_math_library_init (void)
{
  static bool	to_be_initialised = true;

  if (to_be_initialised) {
    to_be_initialised = false;
    mmux_bash_libc_math_trigonometric_init_module();
    mmux_bash_libc_math_result_format_set(MMUX_BASH_LIBC_MATH_DEFAULT_RESULT_FORMAT);
  }
}


/** --------------------------------------------------------------------
 ** Helpers.
 ** ----------------------------------------------------------------- */

int
mmux_bash_libc_math_print_result (double rop)
{
  if (1) {
    fprintf(stderr, "%s: using result format: %s\n", __func__, mmux_bash_libc_math_result_format);
  }
  printf(mmux_bash_libc_math_result_format, rop);
  return EXECUTION_SUCCESS;
}

int
mmux_bash_libc_math_result_format_set (const char * new_result_format)
{
  int	new_result_format_len = strlen(new_result_format);

  if (new_result_format_len <= MMUX_BASH_LIBC_MATH_RESULT_FORMAT_MAXLEN) {
    if (1) {
      fprintf(stderr, "%s: setting new format: %s\n", __func__, new_result_format);
    }
    /* We tell "strncpy()" to copy the from  buffer and fill everything else with nul
       bytes.  See the documentation of "strncpy()". */
    strncpy(mmux_bash_libc_math_result_format, new_result_format, MMUX_BASH_LIBC_MATH_RESULT_FORMAT_MAXLEN);
    if (1) {
      fprintf(stderr, "%s: result format is now: %s\n", __func__, mmux_bash_libc_math_result_format);
    }
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
}

int
mmux_bash_libc_math_parse_double (double * op, const char * s_op, const char * caller_name)
{
  int	rv = sscanf(s_op, "%lf", op);
  if ((0 == rv) || (EOF == rv)) {
    fprintf(stderr, "%s: error: invalid argument, expected double: \"%s\"\n", caller_name, s_op);
    return EXECUTION_FAILURE;
  }
  return EXECUTION_SUCCESS;
}


/** --------------------------------------------------------------------
 ** Result number format configuration.
 ** ----------------------------------------------------------------- */

static int
mmuxbashlibcmathresultformat_main (int argc,  char * argv[])
{
  if ((3 == argc) || (2 == argc)) {
    SHELL_VAR *	var;

    /* If requested: store the old format string  into a local variable whose name is
       specified as second argument. */
    if (3 == argc) {
      var = make_local_variable(argv[2], 0);
      if (NULL == var) {
	return EXECUTION_FAILURE;
      }
      var = bind_variable(argv[1], mmux_bash_libc_math_result_format, 0);
      if (NULL == var) {
	return EXECUTION_FAILURE;
      }
    }

    if (0) {
      /* Print the old format. */
      printf("%s\n", mmux_bash_libc_math_result_format);

    }

    /* Set the new format. */
    return mmux_bash_libc_math_result_format_set(argv[1]);
  } else {
    builtin_usage();
    return EX_USAGE;
  }
}
static int
mmuxbashlibcmathresultformat_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = mmuxbashlibcmathresultformat_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "mmuxbashlibcmathresultformat: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}

static char * mmuxbashlibcmathresultformat_doc[] = {
  "Configure the printf format for floating-point result numbers.",
  (char *)NULL
};

/* Bash will search for this struct  building the name "ciao_struct" from the command
   line argument "ciao" we have given to the "enable" builtin. */
struct builtin mmuxbashlibcmathresultformat_struct = {
  .name		= "mmuxbashlibcmathresultformat",		/* Builtin name */
  .function	= mmuxbashlibcmathresultformat_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,				/* Initial flags for builtin */
  .long_doc	= mmuxbashlibcmathresultformat_doc,		/* Array of long documentation strings. */
  .short_doc	= "mmuxbashlibcmathresultformat FORMAT_STRING [OLD_FORMAT_VARNAME]",	/* Usage synopsis; becomes short_doc */
  .handle	= 0						/* Reserved for internal use */
};

/* Called when  the builtin is  enabled and loaded from  the shared object.   If this
   function returns 0, the load fails. */
int
mmuxbashlibcmathresultformat_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
{
  mmux_bash_libc_math_library_init();
  return (1);
}

#if 0
/* Called when `mmuxbashlibcmathresultformat' is disabled. */
void
mmuxbashlibcmathresultformat_builtin_unload (char *name)
{
}
#endif

/* end of file */
