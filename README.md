
# My dotfiles

This repository contains the configuration files I use on the daily basis on my
Linux machine. Most of them rely on my scripts
(https://github.com/alexcoder04/scripts) to function properly.

**Note**: the configs are made to fit my specific needs and work only well on my
machine so far.

## Installation system

**Note**: the install and reconf scripts are very buggy and cannot deal with any
kind of misformed input.

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

