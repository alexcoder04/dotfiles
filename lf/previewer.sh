#!/bin/sh

file="$1"; shift

# -----------------------------------------------------------------------------
# image stuff
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
# -----------------------------------------------------------------------------

preview_image_ueberzug(){
  orientation="$(identify -format '%[EXIF:Orientation]\n' -- "$file")"
  if [ -n "$orientation" ] && [ "$orientation" != 1 ]; then
    cache="$(hash "$file").jpg"
    cache "$cache" "$@"
    convert -- "$file" -auto-orient "$cache"
    draw "$cache" "$@"
  else
    draw "$file" "$@"
  fi
}

preview_video_ueberzug(){
  cache="$(hash "$file").jpg"
  cache "$cache" "$@"
  ffmpegthumbnailer -i "$file" -o "$cache" -s 0
  draw "$cache" "$@"
}

# image preview
preview_image(){
  if [ "$XDG_SESSION_TYPE" = "x11" ] && command -v ueberzug >/dev/null; then
    preview_image_ueberzug "$@"
  else
    timg -g "${2}x${3}" "$file"
  fi
}

# video preview
preview_video(){
  if [ "$XDG_SESSION_TYPE" = "x11" ] && command -v ueberzug >/dev/null; then
    preview_video_ueberzug "$@"
  else
    ffmpegthumbnailer -i "$file" -o - -c png -s 0 \
      | timg -g "${2}x${3}" -
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
  video/*)
    preview_video "$@"
    ;;
  text/* | application/json) # text files with syntax highilghting
    case "${file##*.}" in
      ino) lang="-l C" ;;
      config|conf|cfg|muttrc) lang="-l conf" ;;
      prefs2) lang="-l sh" ;;
      *) lang="" ;;
    esac
    bat --plain --paging=never --color=always $lang "$file"
    ;;
  message/rfc822) # emails
    echo "\033[36mE-Mail:\033[0m"
    cat "$file"
    ;;
  */pdf) # pdf text preview
    pdftotext -l 5 "$file" -
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

