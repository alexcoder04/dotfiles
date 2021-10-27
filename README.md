
# My .files

![my desktop](./screenshots/i3-i3blocks-screenshot.png)

This repository contains the configuration files I use on the daily basis on my
Linux machine. The primary aim of this repository is to maintain my personal
files, but if you find something useful you can integrate it in your own setup.
Most of the configs rely on my scripts (https://github.com/alexcoder04/scripts)
to function properly.

## Installation system

**Note**: the install and reconf scripts are very buggy and cannot deal with any
kind of misformed input, not existing files etc.

Every folder contains the configuration files for a particular program as well
as an `install` script. These scripts are supposed to be called from the main
`install` script from the root of the repository and passing the name of the
program. For example:

```sh
./install zsh
```

These install scripts **override** existing configs with generated ones. The
install script copies files that can be copied 1:1 to their locations and runs
the `reconf` script on files that need to be adjusted. The reconf script
replaces strings like `+TERMINAL_MAIN+` with settings stored in `defaults` and
`<pc-name>.conf` (This is how I want to make the dotfiles portable to my other
machines). The pc-name is determined by: passed argument (e. g.
`./install zsh <machine>`); content of `$XDG_DATA_HOME/conf-pc-name`; content of
`/etc/hostname`.

## Licensing

The configs are written by after studying the according documentation for the
most part and published under the GNU GPLv3 (see `LICENSE`). However, some parts
are copied from other sources, so different licensing terms may apply to them.
For foreign code, you can always find the source I got it from in the comments
or README files in the subfolders.
