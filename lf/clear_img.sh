#!/bin/sh
# from lf wiki (https://github.com/gokcehan/lf/wiki/Previews)
if [ -n "$FIFO_UEBERZUG" ]; then
  printf '{"action": "remove", "identifier": "preview"}\n' >"$FIFO_UEBERZUG"
fi
