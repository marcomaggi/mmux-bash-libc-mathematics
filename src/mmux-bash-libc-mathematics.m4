m4_divert(-1)m4_dnl
#
# Part of: MMUX Bash Libc Mathematics
# Contents: macros
# Date: Sep  5, 2024
#
# Abstract
#
#	This library  defines macros to  automatically generate C  language functions
#	for GNU Bash builtings implementation.
#
# Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>
#
# This is free software; you can redistribute  it and/or modify it under the terms of
# the GNU Lesser General Public License as published by the Free Software Foundation;
# either version 3.0 of the License, or (at your option) any later version.
#
# This library  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
# WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
# PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public License along with
# this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place,
# Suite 330, Boston, MA 02111-1307 USA.
#


#### preamble

m4_changequote(`[[[', `]]]')


#### function definitions

# $1 - bulitin identifier
# $2 - C language expression about "argc": if true the number of argumets is wrong
m4_define([[[MMUX_BASH_LIBC_MATH_DEFINE_BUILTIN_FUNCTION_NO_OPTIONS]]],[[[m4_dnl
static int
$1_builtin (WORD_LIST * list)
{
  if (no_options (list)) {
    return (EX_USAGE);
  } else {
    char **	argv;
    int		argc;
    int		rv;

    argv = make_builtin_argv(list, &argc);
    if (argv) {
      if $2 {
        builtin_usage();
        rv = EX_USAGE;
      } else {
        rv = $1_main(argc, argv);
      }
      free(argv);
    } else {
      fprintf(stderr, "$1: error: internal error accessing list of builtin operands\n");
      rv = EXECUTION_FAILURE;
    }
    return rv;
  }
}
]]])


#### data structures

# $1 - bulitin identifier
# $2 - C language string representing the short documentation
m4_define([[[MMUX_BASH_LIBC_MATH_DEFINE_BUILTIN_STRUCT]]],[[[m4_dnl
/* Bash will search for this struct  building the name "$1_struct" from the command
   line argument "$1" we have given to the "enable" builtin. */
struct builtin $1_struct = {
  .name		= "$1",				/* Builtin name */
  .function	= $1_builtin,			/* Function implementing the builtin */
  .flags	= BUILTIN_ENABLED,		/* Initial flags for builtin */
  .long_doc	= $1_doc,			/* Array of long documentation strings. */
  .short_doc	= $2,				/* Usage synopsis; becomes short_doc */
  .handle	= 0				/* Reserved for internal use */
};
]]])

# $1 - bulitin identifier
# $2 - C language string representing a single-line long documentation
m4_define([[[MMUX_BASH_LIBC_MATH_DEFINE_BUILTIN_LONG_DOC_SINGLE_LINE]]],[[[m4_dnl
/* A NULL-terminated array of ASCIIZ strings representing the lines of the
   builtin long documentation. */
static char * $1_doc[] = {
  $2,
  (char *)NULL
};
]]])


#### typical usages

# $1 - bulitin identifier
# $2 - C language expression about "argc": if true the number of argumets is wrong
# $3 - C language string representing the short documentation
# $4 - C language string representing the long documentation, a single-line
m4_define([[[MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION]]],[[[m4_dnl
MMUX_BASH_LIBC_MATH_DEFINE_BUILTIN_FUNCTION_NO_OPTIONS([[[$1]]],[[[$2]]])
MMUX_BASH_LIBC_MATH_DEFINE_BUILTIN_LONG_DOC_SINGLE_LINE([[[$1]]],[[[$4]]])
MMUX_BASH_LIBC_MATH_DEFINE_BUILTIN_STRUCT([[[$1]]],[[[$3]]])
]]])

# #if 0
# /* Called when  the builtin is  enabled and loaded from  the shared object.   If this
#    function returns 0, the load fails. */
# int
# add_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
# {
#   return (1);
# }
# /* Called when `add' is disabled. */
# void
# add_builtin_unload (char *name)
# {
# }
# #endif


#### let's go

### end of file
# Local Variables:
# mode: m4
# End:
m4_divert(0)m4_dnl
