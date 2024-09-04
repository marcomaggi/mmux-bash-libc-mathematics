/*
  Part of: MMUX Bash Libc Mathematics
  Contents: private header file
  Date: Sep  4, 2024

  Abstract

	This header file is for internal definitions.  It must be included by all the
	source files in this package.

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

#ifndef MMUX_BASH_LIBC_MATHEMATICS_INTERNALS_H
#define MMUX_BASH_LIBC_MATHEMATICS_INTERNALS_H 1


/** --------------------------------------------------------------------
 ** Headers.
 ** ----------------------------------------------------------------- */

#ifdef HAVE_CONFIG_H
#  include <config.h>
#endif

/* Enable everything GNU. */
#define _GNU_SOURCE		1

/* Enable latest POSIX features. */
#undef _POSIX_C_SOURCE
#define _POSIX_C_SOURCE		200809L

#include <stddef.h>
#include <stdbool.h>
#include <stdio.h>
#include <inttypes.h>
#include <math.h>
#include <complex.h>
#include <regex.h>

/* We  really need  to pay  attention to  the order  in which  we include  the files,
   otherwise errors will ensue. */
#include "bashtypes.h"
#include "builtins.h"
#include "shell.h"
#include "common.h"

#include "mmux-bash-libc-mathematics.h"


/** --------------------------------------------------------------------
 ** Preprocessor macros.
 ** ----------------------------------------------------------------- */

#undef  MMUX_BASH_LIBC_MATH_DEFAULT_DOUBLE_FORMAT
#define MMUX_BASH_LIBC_MATH_DEFAULT_DOUBLE_FORMAT	"%lf"


/** --------------------------------------------------------------------
 ** Constants.
 ** ----------------------------------------------------------------- */




/** --------------------------------------------------------------------
 ** Function prototypes.
 ** ----------------------------------------------------------------- */

mmux_bash_libc_math_private_decl void mmux_bash_libc_math_trigonometric_init_module (void);


/** --------------------------------------------------------------------
 ** Done.
 ** ----------------------------------------------------------------- */

#ifdef __cplusplus
} // extern "C"
#endif

#endif /* MMUX_BASH_LIBC_MATHEMATICS_INTERNALS_H */

/* end of file */
