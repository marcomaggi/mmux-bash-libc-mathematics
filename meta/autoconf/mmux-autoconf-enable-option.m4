# mmux-autoconf-enable-option.m4 --
#
# LICENSE
#
#   Copyright (c) 2020 Marco Maggi <mrc.mgg@gmail.com>
#
#   Copying and distribution of this file, with or without modification, are permitted in any medium
#   without royalty  provided the  copyright notice  and this  notice are  preserved.  This  file is
#   offered as-is, without any warranty.
#

# MMUX_AUTOCONF_ENABLE_OPTION --
#
# SYNOPSIS
#
#   MMUX_AUTOCONF_ENABLE_OPTION(UPCASE_OPNAME, COMMAND_LINE_OPTION,
#     DEFAULT, CHECKING_OPTION_MESSAGE, ENABLE_OPTION_MESSAGE)
#
# DESCRIPTION
#
#   Wrapper  for   AC_ARG_ENABLE  which  adds  verbose   messages  and  defines  a   shell  variable
#   "mmux_enable_$1" set to "yes" or "no".
#
# ARGUMENTS
#
#   $1 - upper case option name
#   $2 - command line option name "--enable-$2"
#   $3 - default (yes, no)
#   $4 - text for the "checking option... " message
#   $5 - text for the "enable option... " message
#
AC_DEFUN([MMUX_AUTOCONF_ENABLE_OPTION],
  [AS_VAR_SET(mmux_enable_$1,$3)
   AC_MSG_CHECKING([$4])
   AC_ARG_ENABLE([$2],
     [AS_HELP_STRING([--enable-$2],
        [$5 (default is $3)])],
     [AS_CASE([$enableval],
        [yes],[mmux_enable_$1=yes],
        [no], [mmux_enable_$1=no],
        [AC_MSG_ERROR([bad value $enableval for --enable-$2])])],
     [AS_VAR_SET(mmux_enable_$1,$3)])
   AC_MSG_RESULT([$mmux_enable_$1])])

### end of file
# Local Variables:
# mode: autoconf
# fill-column: 100
# End:
