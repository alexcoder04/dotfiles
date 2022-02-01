#!/bin/sh

case "$XDG_SESSION_TYPE" in
  x11)
    command -v ueberzug >/dev/null \
      && "$XDG_CONFIG_HOME/lf/previewer-x11.sh" "$@" \
      || "$XDG_CONFIG_HOME/lf/previewer-plain.sh" "$@" ;;
  *)
    "$XDG_CONFIG_HOME/lf/previewer-plain.sh" "$@" ;;
esac

