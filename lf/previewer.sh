#!/bin/sh

file="$1"; shift

# draw image with ueberzug
draw() {
  if [ -n "$FIFO_UEBERZUG" ]; then
    path="$(printf '%s' "$1" | sed 's/\\/\\\\/g;s/"/\\"/g')"
    printf '{"action": "add", "identifier": "preview", "x": %d, "y": %d, "width": %d, "height": %d, "scaler": "contain", "scaling_position_x": 0.5, "scaling_position_y": 0.5, "path": "%s"}\n' \
      "$4" "$5" "$2" "$3" "$1" >"$FIFO_UEBERZUG"
  fi
  exit 1
}

# image preview
preview_image(){
  if [ "$XDG_SESSION_TYPE" = "x11" ] && command -v ueberzug >/dev/null; then
    orientation="$(identify -format '%[EXIF:Orientation]\n' -- "$file")"
    if [ -n "$orientation" ] && [ "$orientation" != 1 ]; then
      cache_file="${XDG_CACHE_HOME:-$HOME/.cache}/lf/$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' "$file" | sha256sum | cut -d" " -f1).jpg"
      [ -f "$cache_file" ] || convert "$file" -auto-orient "$cache_file"
      draw "$cache_file" "$@"
    else
      draw "$file" "$@"
    fi
  else
    timg -g "${3}x${2}" "$file"
  fi
}

# video preview
preview_video(){
  cache_file="${XDG_CACHE_HOME:-$HOME/.cache}/lf/$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' "$file" | sha256sum | cut -d" " -f1).jpg"
  if [ ! -f "$cache_file" ]; then
    ffmpegthumbnailer -i "$file" -o "$cache_file" -s 0
    convert \
      "$cache_file" \
      "$DOTFILES_REPO/lf/play-icon.png" \
      -gravity center -composite -matte \
      "$cache_file"
  fi
  if [ "$XDG_SESSION_TYPE" = "x11" ] && command -v ueberzug >/dev/null; then
    draw "$cache_file" "$@"
  else
    timg -g "${3}x${2}" "$cache_file"
  fi
}

preview_pdf(){
  # as images on X11 with ueberzug
  if [ "$XDG_SESSION_TYPE" = "x11" ] && command -v ueberzug >/dev/null; then
    cache_file="${XDG_CACHE_HOME:-$HOME/.cache}/lf/$(stat --printf '%n\0%i\0%F\0%s\0%W\0%Y' "$file" | sha256sum | cut -d" " -f1)"
    [ -f "$cache_file" ] || pdftoppm -jpeg -singlefile "$file" "$cache_file"
    draw "$cache_file.jpg" "$@"
  # as text on wayland
  else
    pdftotext -l 5 "$file" -
  fi
}

# empty file
if [ ! -s "$file" ]; then
  echo "\033[0;41mEmpty file\033[0m"
  exit 0
fi

# check file type
case "$(file -Lb --mime-type -- "$file")" in
  image/*) # images
    preview_image "$@"
    ;;
  video/*) # videos
    preview_video "$@"
    ;;
  audio/*) # audio
    mediainfo "$1"
    ;;
  text/* | application/json | */xml) # text files with syntax highilghting
    case "${file##*.}" in
      config|conf|cfg|muttrc) lang="-l conf" ;;
      ino) lang="-l C" ;;
      lfrc) lang="-l conf" ;;
      prefs2) lang="-l sh" ;;
      *) lang="" ;;
    esac
    bat --plain --paging=never --color=always $lang "$file"
    ;;
  message/rfc822) # emails
    echo "\033[36mE-Mail:\033[0m"
    cat "$file"
    ;;
  */pdf) # pdfc as images
    preview_pdf "$@"
    ;;
  *opendocument*) # Libre Office documents
    odt2txt "$file"
    ;;
  # different archives
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
  *) # executables and binary files
    [ -x "$file" ] \
      && echo "\033[0;46mBinary executable\033[0m" \
      || echo "\033[0;46mBinary file\033[0m"
    ;;
esac

