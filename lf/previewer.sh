#!/bin/sh
# from lf wiki (https://github.com/gokcehan/lf/wiki/Previews)
draw() {
  ~/.config/lf/draw_img.sh "$@"
  exit 1
}

hash() {
  printf '%s/.cache/lf/%s' "$HOME" \
    "$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' -- "$(readlink -f "$1")" | sha256sum | awk '{print $1}')"
}

cache() {
  if [ -f "$1" ]; then
    draw "$@"
  fi
}

file="$1"
shift

if [ ! -s "$file" ]; then
  echo "\033[0;41mempty file\033[0m"
  exit 0
fi

if [ -n "$FIFO_UEBERZUG" ]; then
  case "$(file -Lb --mime-type -- "$file")" in
    image/*)
      orientation="$(identify -format '%[EXIF:Orientation]\n' -- "$file")"
      if [ -n "$orientation" ] && [ "$orientation" != 1 ]; then
        cache="$(hash "$file").jpg"
        cache "$cache" "$@"
        convert -- "$file" -auto-orient "$cache"
        draw "$cache" "$@"
      else
        draw "$file" "$@"
      fi
      ;;
    video/*)
      cache="$(hash "$file").jpg"
      cache "$cache" "$@"
      ffmpegthumbnailer -i "$file" -o "$cache" -s 0
      draw "$cache" "$@"
      ;;
    text/*)
      bat --plain --theme=Dracula --paging=never --color=always "$file"
      ;;
    */pdf)
      pdftotext -l 5 "$file" -
      ;;
    application/gzip)
      echo "\033[36mGzip Archive:\033[0m"
      tar -tzf "$file" | xargs -I{} echo " {}"
      ;;
    application/x-tar|applicationx-ustar)
      echo "\033[36mTar archive:\033[0m"
      tar -tf "$file" | xargs -I{} echo " {}"
      ;;
    application/zip)
      echo "\033[36mZip archive:\033[0m"
      zipinfo "$file"
      ;;
    application/json)
      bat --plain --theme=Dracula --paging=never --color=always "$file"
      ;;
    audio/*)
      mediainfo "$file"
      ;;
    message/rfc822)
      cat "$file"
      ;;
    *)
      [ -x "$file" ] \
        && echo "\033[0;46mbinary executable\033[0m" \
        || echo "\033[0;46mbinary file\033[0m"
      ;;
  esac
fi

file -Lb -- "$1" | fold -s -w "$width"
exit 0
