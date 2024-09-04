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
  }
}


/** --------------------------------------------------------------------
 ** Helpers.
 ** ----------------------------------------------------------------- */

int
mmux_bash_libc_math_print_result (double rop)
{
  printf("%lf\n", rop);
  return EXECUTION_SUCCESS;
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


/* end of file */
