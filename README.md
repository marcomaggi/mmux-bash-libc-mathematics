# MMUX Bash Libc Mathematics

## Introduction

This package  implements additional  builtin commands  for the  GNU Bash
shell; to  do so  it installs a  C language library  and a  shell script
which is meant to be sourced in a Bash session or script.

  The library targets POSIX systems.

The  package uses  the  GNU  Autotools and  it  is  tested on  GNU+Linux
systems.  The  package relies on  `pkg-config` to find  the dependencies
installed on the system.

## License

Copyright (c) 2024 Marco Maggi<br/>
`mrc.mgg@gmail.com`<br/>
All rights reserved.

This program is free software: you  can redistribute it and/or modify it
under the terms of the GNU Lesser General Public License as published by
the Free  Software Foundation, either version  3 of the License,  or (at
your option) any later version.

This program  is distributed  in the  hope that it  will be  useful, but
WITHOUT   ANY   WARRANTY;  without   even   the   implied  warranty   of
MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU Lesser
General Public License for more details.

You should have received a copy of the GNU Lesser General Public License
along with this program.  If not, see <http://www.gnu.org/licenses/>.

## Install

To install from a proper release tarball, do this:

```
$ cd mmux-bash-libc-mathematics-0.1.0
$ mkdir build
$ cd build
$ ../configure
$ make
$ make check
$ make install
```

to inspect the available configuration options:

```
$ ../configure --help
```

The Makefile is designed to allow parallel builds, so we can do:

```
$ make -j4 all && make -j4 check
```

which,  on  a  4-core  CPU,   should  speed  up  building  and  checking
significantly.

The Makefile supports the DESTDIR  environment variable to install files
in a temporary location, example: to see what will happen:

```
$ make -n install DESTDIR=/tmp/mmux-bash-libc-mathematics
```

to really do it:

```
$ make install DESTDIR=/tmp/mmux-bash-libc-mathematics
```

After the  installation it is  possible to verify the  installed library
against the test suite with:

```
$ make installcheck
```

From a repository checkout or snapshot  (the ones from the Github site):
we  must install  the GNU  Autotools  (GNU Automake,  GNU Autoconf,  GNU
Libtool), then  we must first run  the script `autogen.sh` from  the top
source directory, to generate the needed files:

```
$ cd mmux-bash-libc-mathematics
$ sh autogen.sh

```

notice  that  `autogen.sh`  will   run  the  programs  `autoreconf`  and
`libtoolize`; the  latter is  selected through the  environment variable
`LIBTOOLIZE`,  whose  value  can  be  customised;  for  example  to  run
`glibtoolize` rather than `libtoolize` we do:

```
$ LIBTOOLIZE=glibtoolize sh autogen.sh
```

After this  the procedure  is the same  as the one  for building  from a
proper release tarball, but we have to enable maintainer mode:

```
$ ../configure --enable-maintainer-mode [options]
$ make
$ make check
$ make install
```

## Usage

Read the documentation generated from  the Texinfo sources.  The package
installs the documentation  in Info format; we can  generate and install
documentation in HTML format by running:

```
$ make html
$ make install-html
```

## Credits

The  stuff was  written by  Marco Maggi.   If this  package exists  it's
because of the great GNU software tools that he uses all the time.

## Bugs, vulnerabilities and contributions

Bug  and vulnerability  reports are  appreciated, all  the vulnerability
reports  are  public; register  them  using  the  Issue Tracker  at  the
project's GitHub  site.  For  contributions and  patches please  use the
Pull Requests feature at the project's GitHub site.

## Resources

The latest release of this package can be downloaded from:

[https://bitbucket.org/marcomaggi/mmux-bash-libc-mathematics/downloads](https://bitbucket.org/marcomaggi/mmux-bash-libc-mathematics/downloads)

development takes place at:

[http://github.com/marcomaggi/mmux-bash-libc-mathematics/](http://github.com/marcomaggi/mmux-bash-libc-mathematics/)

and as backup at:

[https://bitbucket.org/marcomaggi/mmux-bash-libc-mathematics/](https://bitbucket.org/marcomaggi/mmux-bash-libc-mathematics/)

the documentation is available online:

[http://marcomaggi.github.io/docs/mmux-bash-libc-mathematics.html](http://marcomaggi.github.io/docs/mmux-bash-libc-mathematics.html)

the GNU Project software can be found here:

[http://www.gnu.org/](http://www.gnu.org/)

