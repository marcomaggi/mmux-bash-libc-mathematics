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

#undef  MMUX_BASH_LIBC_MATH_DOUBLE_FORMAT_MAXLEN
#define MMUX_BASH_LIBC_MATH_DOUBLE_FORMAT_MAXLEN		63
static char mmux_bash_libc_math_double_format[1+MMUX_BASH_LIBC_MATH_DOUBLE_FORMAT_MAXLEN];

static regex_t mmux_bash_libc_math_complex_rex;


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

    {
      int	rv;

      rv = regcomp(&mmux_bash_libc_math_complex_rex, "^(\\([0-9\\.+-]\\+\\))+i\\*(\\([0-9\\.+-]\\+\\))$", 0);
      if (rv) {
	fprintf(stderr, "MMUX Bash Libc Mathematics: internal error: compiling regular expression\n");
	exit(EXIT_FAILURE);
      }
    }

    mmux_bash_libc_math_trigonometric_init_module();
    mmux_bash_libc_math_double_format_set(MMUX_BASH_LIBC_MATH_DEFAULT_DOUBLE_FORMAT);

    mmux_bash_libc_math_create_global_double_variable("M_E",		M_E);
    mmux_bash_libc_math_create_global_double_variable("M_LOG2E",	M_LOG2E);
    mmux_bash_libc_math_create_global_double_variable("M_LOG10E",	M_LOG10E);
    mmux_bash_libc_math_create_global_double_variable("M_LN2",		M_LN2);
    mmux_bash_libc_math_create_global_double_variable("M_LN10",		M_LN10);
    mmux_bash_libc_math_create_global_double_variable("M_PI",		M_PI);
    mmux_bash_libc_math_create_global_double_variable("M_PI_2",		M_PI_2);
    mmux_bash_libc_math_create_global_double_variable("M_PI_4",		M_PI_4);
    mmux_bash_libc_math_create_global_double_variable("M_1_PI",		M_1_PI);
    mmux_bash_libc_math_create_global_double_variable("M_2_PI",		M_2_PI);
    mmux_bash_libc_math_create_global_double_variable("M_2_SQRTPI",	M_2_SQRTPI);
    mmux_bash_libc_math_create_global_double_variable("M_SQRT2",	M_SQRT2);
    mmux_bash_libc_math_create_global_double_variable("M_SQRT1_2",	M_SQRT1_2);
    mmux_bash_libc_math_create_global_double_variable("FP_NAN",		FP_NAN);
    mmux_bash_libc_math_create_global_double_variable("FP_INFINITE",	FP_INFINITE);
    mmux_bash_libc_math_create_global_double_variable("FP_ZERO",	FP_ZERO);
    mmux_bash_libc_math_create_global_double_variable("FP_SUBNORMAL",	FP_SUBNORMAL);
    mmux_bash_libc_math_create_global_double_variable("FP_NORMAL",	FP_NORMAL);
  }
}


/** --------------------------------------------------------------------
 ** Selecting printf format for values of type double.
 ** ----------------------------------------------------------------- */

int
mmux_bash_libc_math_double_format_set (const char * new_result_format)
{
  int	new_result_format_len = strlen(new_result_format);

  if (new_result_format_len <= MMUX_BASH_LIBC_MATH_DOUBLE_FORMAT_MAXLEN) {
    if (0) {
      fprintf(stderr, "%s: setting new double format: %s\n", __func__, new_result_format);
    }
    /* We tell "strncpy()" to copy the from  buffer and fill everything else with nul
       bytes.  See the documentation of "strncpy()". */
    strncpy(mmux_bash_libc_math_double_format, new_result_format, MMUX_BASH_LIBC_MATH_DOUBLE_FORMAT_MAXLEN);
    if (0) {
      fprintf(stderr, "%s: double format is now: %s\n", __func__, mmux_bash_libc_math_double_format);
    }
    return EXECUTION_SUCCESS;
  } else {
    return EXECUTION_FAILURE;
  }
}


/** --------------------------------------------------------------------
 ** Printing double and complex.
 ** ----------------------------------------------------------------- */

int
mmux_bash_libc_math_print_double (double rop)
{
  if (0) {
    fprintf(stderr, "%s: using double format: %s\n", __func__, mmux_bash_libc_math_double_format);
  }
  printf(mmux_bash_libc_math_double_format, rop);
  return EXECUTION_SUCCESS;
}
int
mmux_bash_libc_math_print_complex (double complex rop)
{
  double	rop_re = creal(rop), rop_im = cimag(rop);

  if (0) {
    fprintf(stderr, "%s: using double format: %s\n", __func__, mmux_bash_libc_math_double_format);
  }

  printf("(");
  printf(mmux_bash_libc_math_double_format, rop_re);
  printf(")+i*(");
  printf(mmux_bash_libc_math_double_format, rop_im);
  printf(")");
  return EXECUTION_SUCCESS;
}


/** --------------------------------------------------------------------
 ** Parsing double and complex.
 ** ----------------------------------------------------------------- */

int
mmux_bash_libc_math_parse_double (double * p_op, const char * s_op, const char * caller_name)
{
  int	rv;

  /* Try all the formats before giving up. */
  rv = sscanf(s_op, "%lf", p_op);
  if ((0 == rv) || (EOF == rv)) {
    rv = sscanf(s_op, "%lg", p_op);
    if ((0 == rv) || (EOF == rv)) {
      rv = sscanf(s_op, "%le", p_op);
      if ((0 == rv) || (EOF == rv)) {
	rv = sscanf(s_op, "%la", p_op);
	if ((0 == rv) || (EOF == rv)) {
	  fprintf(stderr, "%s: error: invalid argument, expected double: \"%s\"\n", caller_name, s_op);
	  return EXECUTION_FAILURE;
	}
      }
    }
  }
  return EXECUTION_SUCCESS;
}

int
mmux_bash_libc_math_parse_complex (double complex * p_op, const char * s_op, const char * caller_name)
{
  int	len = strlen(s_op);

  if (len > 2048) {
    fprintf(stderr, "%s: error: invalid argument, string too long (max 2048 chars): \"%s\"\n", caller_name, s_op);
    return EXECUTION_FAILURE;
  } else {
    char	s_op_re[1024];
    char	s_op_im[1024];
    double	op_re, op_im;
    int		rv;
    size_t	nmatch = 3;
    regmatch_t	match[3];

    if (0) {
      fprintf(stderr, "%s: scanning %s\n", __func__, s_op);
    }

    /* First use a regular expression to  extract the real and imaginary parts.  Then
       we parse the real part and the imaginary part separately. */
    rv = regexec(&mmux_bash_libc_math_complex_rex, s_op, nmatch, &(match[0]), 0);
    if (rv) {
      char	error_message[1024];

      regerror(rv, &mmux_bash_libc_math_complex_rex, error_message, 1024);

      fprintf(stderr, "%s: error: invalid argument, expected complex number: %s: \"%s\"\n", caller_name, error_message, s_op);
      return EXECUTION_FAILURE;
    }

    {
      int	i, imax = match[1].rm_eo - match[1].rm_so;

      for (i=0; i < imax; ++i) {
	s_op_re[i] = s_op[match[1].rm_so + i];
      }
      s_op_re[imax] = '\0';
    }

    {
      int	i, imax = match[2].rm_eo - match[2].rm_so;

      for (i=0; i < imax; ++i) {
	s_op_im[i] = s_op[match[2].rm_so + i];
      }
      s_op_im[imax] = '\0';
    }

    if (0) {
      fprintf(stderr, "%s: scanned re='%s' im='%s'\n", __func__, s_op_re, s_op_im);
    }

    rv = mmux_bash_libc_math_parse_double(&op_re, s_op_re, caller_name);
    if (EXECUTION_FAILURE == rv) { return rv; }

    rv = mmux_bash_libc_math_parse_double(&op_im, s_op_im, caller_name);
    if (EXECUTION_FAILURE == rv) { return rv; }

    *p_op = op_re + op_im * ((double complex)_Complex_I);
    return EXECUTION_SUCCESS;
  }
}


/** --------------------------------------------------------------------
 ** Helpers.
 ** ----------------------------------------------------------------- */

void
mmux_bash_libc_math_create_global_double_variable (const char * name, double value)
{
  SHELL_VAR *	v MMUX_BASH_LIBC_MATH_UNUSED;
  char		str[1024];
  /* NOTE I do not know what FLAGS is for, but setting it to zero seems fine.  (Marco
     Maggi; Sep 4, 2024) */
  int		flags = 0;

  snprintf(str, 1024, "%lf", value);
  v = bind_global_variable(name, str, flags);
}


/** --------------------------------------------------------------------
 ** Double number format configuration.
 ** ----------------------------------------------------------------- */

static int
mmuxbashlibcmathdoubleformat_main (int argc,  char * argv[])
{
  if ((3 == argc) || (2 == argc)) {
    SHELL_VAR *	var;

    /* If requested: store the old format string  into a local variable whose name is
       specified as second argument. */
    if (3 == argc) {
      var = make_local_variable(argv[2], 0);
      /* NOTE I  do not know if  the return value is  meant to be NULL  when an error
	 occurs; checking it does not hurt.  (Marco Maggi; Sep 4, 2024) */
      if (NULL == var) {
	return EXECUTION_FAILURE;
      }
      var = bind_variable(argv[1], mmux_bash_libc_math_double_format, 0);
      /* NOTE I  do not know if  the return value is  meant to be NULL  when an error
	 occurs; checking it does not hurt.  (Marco Maggi; Sep 4, 2024) */
      if (NULL == var) {
	return EXECUTION_FAILURE;
      }
    }

    if (0) {
      /* Print the old format. */
      printf("%s\n", mmux_bash_libc_math_double_format);

    }

    /* Set the new format. */
    return mmux_bash_libc_math_double_format_set(argv[1]);
  } else {
    builtin_usage();
    return EX_USAGE;
  }
}
static int
mmuxbashlibcmathdoubleformat_builtin (WORD_LIST * list)
{
  char **	argv;
  int		argc;

  argv = make_builtin_argv(list, &argc);
  if (argv) {
    int		rv = mmuxbashlibcmathdoubleformat_main(argc, argv);
    free(argv);
    return rv;
  } else {
    fprintf(stderr, "mmuxbashlibcmathdoubleformat: error: internal error accessing list of builtin operands\n");
    return EXECUTION_FAILURE;
  }
}

static char * mmuxbashlibcmathdoubleformat_doc[] = {
  "Configure the printf format for floating-point double numbers.",
  (char *)NULL
};

/* Bash will search for this struct  building the name "ciao_struct" from the command
   line argument "ciao" we have given to the "enable" builtin. */
struct builtin mmuxbashlibcmathdoubleformat_struct = {
  .name		= "mmuxbashlibcmathdoubleformat",		/* Builtin name */
  .function	= mmuxbashlibcmathdoubleformat_builtin,		/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,				/* Initial flags for builtin */
  .long_doc	= mmuxbashlibcmathdoubleformat_doc,		/* Array of long documentation strings. */
  .short_doc	= "mmuxbashlibcmathdoubleformat FORMAT_STRING [OLD_FORMAT_VARNAME]",	/* Usage synopsis; becomes short_doc */
  .handle	= 0						/* Reserved for internal use */
};

/* Called when  the builtin is  enabled and loaded from  the shared object.   If this
   function returns 0, the load fails. */
int
mmuxbashlibcmathdoubleformat_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
{
  mmux_bash_libc_math_library_init();
  return 1;
}

#if 0
/* Called when `mmuxbashlibcmathdoubleformat' is disabled. */
void
mmuxbashlibcmathdoubleformat_builtin_unload (char *name)
{
}
#endif

/* end of file */
