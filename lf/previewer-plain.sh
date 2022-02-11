#!/bin/sh

file="$1"
shift

# if it's an empty file
if [ ! -s "$file" ]; then
  echo "\033[0;41mEmpty file\033[0m"
  exit 0
fi

case "$(file -Lb --mime-type -- "$file")" in
  # unicode image preview
  image/*)
    timg -g "${2}x${3}" "$file"
    ;;
  # same thing for videos
  video/*)
    ffmpegthumbnailer -i "$file" -o - -c png -s 0 \
      | timg -g "${2}x${3}" -
    ;;
  # syntax highlighting with bat, tell it the file type by extension
  text/*)
    case "${file##*.}" in
      ino) lang="-l C" ;;
      config|conf|cfg) lang="-l conf" ;;
      prefs2) lang="-l sh" ;;
      *) lang="" ;;
    esac
    bat --plain --theme=Dracula --paging=never --color=always $lang "$file"
    ;;
  application/json)
    bat --plain --theme=Dracula --paging=never --color=always "$file"
    ;;
  # pdf text preview
  */pdf)
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
  # emails
  message/rfc822)
    cat "$file"
    ;;
  # executables and binary files
  *)
    [ -x "$file" ] \
      && echo "\033[0;46mBinary executable\033[0m" \
      || echo "\033[0;46mBinary file\033[0m"
    ;;
esac

file -Lb -- "$1" | fold -s -w "$width"
exit 0
