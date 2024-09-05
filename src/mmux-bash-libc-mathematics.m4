m4_divert(-1)m4_dnl
m4_dnl
m4_dnl Part of: MMUX Bash Libc Mathematics
m4_dnl Contents: macros
m4_dnl Date: Sep  5, 2024
m4_dnl
m4_dnl Abstract
m4_dnl
m4_dnl	This library  defines macros to  automatically generate C  language functions
m4_dnl	for GNU Bash builtings implementation.
m4_dnl
m4_dnl Copyright (C) 2024 Marco Maggi <mrc.mgg@gmail.com>
m4_dnl
m4_dnl This is free software; you can redistribute  it and/or modify it under the terms of
m4_dnl the GNU Lesser General Public License as published by the Free Software Foundation;
m4_dnl either version 3.0 of the License, or (at your option) any later version.
m4_dnl
m4_dnl This library  is distributed in the  hope that it  will be useful, but  WITHOUT ANY
m4_dnl WARRANTY; without  even the implied  warranty of  MERCHANTABILITY or FITNESS  FOR A
m4_dnl PARTICULAR PURPOSE.  See the GNU Lesser General Public License for more details.
m4_dnl
m4_dnl You should have received a copy of the GNU Lesser General Public License along with
m4_dnl this library; if not, write to the Free Software Foundation, Inc., 59 Temple Place,
m4_dnl Suite 330, Boston, MA 02111-1307 USA.
m4_dnl


m4_dnl preamble

m4_changequote(`[[[', `]]]')


m4_dnl function definitions

m4_dnl $1 - bulitin identifier
m4_dnl $2 - C language expression about "argc": if true the number of argumets is wrong
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

m4_dnl $1 - bulitin identifier
m4_dnl $2 - C language expression about "argc": if true the number of argumets is wrong
m4_define([[[MMUX_BASH_LIBC_MATH_DEFINE_BUILTIN_FUNCTION]]],[[[m4_dnl
static int
$1_builtin (WORD_LIST * list)
{
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
]]])


m4_dnl data structures

m4_dnl $1 - bulitin identifier
m4_dnl $2 - C language string representing the short documentation
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

m4_dnl $1 - bulitin identifier
m4_dnl $2 - C language string representing a single-line long documentation
m4_define([[[MMUX_BASH_LIBC_MATH_DEFINE_BUILTIN_LONG_DOC_SINGLE_LINE]]],[[[m4_dnl
/* A NULL-terminated array of ASCIIZ strings representing the lines of the
   builtin long documentation. */
static char * $1_doc[] = {
  $2,
  (char *)NULL
};
]]])


m4_dnl usages

m4_dnl $1 - bulitin identifier
m4_dnl $2 - C language expression about "argc": if true the number of argumets is wrong
m4_dnl $3 - C language string representing the short documentation
m4_dnl $4 - C language string representing the long documentation, a single-line
m4_define([[[MMUX_BASH_LIBC_MATH_DEFINE_TYPICAL_BUILTIN_FUNCTION]]],[[[m4_dnl
m4_dnl Here we do not use the NO_OPTION  version of the implementation function: with that
m4_dnl version an argument  like "-1.2" is interpreted  as an option, and  an error raised
m4_dnl because there  are no  options allowed.   Here we  want such  arguments to  just go
m4_dnl through any validation and come to us as they are.
MMUX_BASH_LIBC_MATH_DEFINE_BUILTIN_FUNCTION([[[$1]]],[[[$2]]])
MMUX_BASH_LIBC_MATH_DEFINE_BUILTIN_LONG_DOC_SINGLE_LINE([[[$1]]],[[[$4]]])
MMUX_BASH_LIBC_MATH_DEFINE_BUILTIN_STRUCT([[[$1]]],[[[$3]]])
]]])

m4_dnl m4_dnlif 0
m4_dnl /* Called when  the builtin is  enabled and loaded from  the shared object.   If this
m4_dnl    function returns 0, the load fails. */
m4_dnl int
m4_dnl add_builtin_load (char *name MMUX_BASH_LIBC_MATH_UNUSED)
m4_dnl {
m4_dnl   return (1);
m4_dnl }
m4_dnl /* Called when `add' is disabled. */
m4_dnl void
m4_dnl add_builtin_unload (char *name)
m4_dnl {
m4_dnl }
m4_dnl #endif


m4_dnl let's go

m4_dnl end of file
m4_dnl Local Variables:
m4_dnl mode: m4
m4_dnl End:
m4_divert(0)m4_dnl
