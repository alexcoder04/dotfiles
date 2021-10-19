
# What is sx?

sx is the superior way to start an X server (aka your GUI). Xorg itself and
xinit and startx are a way too bloated and outdated. Unfortunately, the whole
Linux world depends on them.

sx (check out https://github.com/Earnestly/sx) solves at least the problem of
startx and xinit: this 47-line shell script replaces two whole programs in
starting up Xorg.

I check in my `sxrc` whether an environmental variable defines which window
manager to start or it just starts the default one (i3) if not.

