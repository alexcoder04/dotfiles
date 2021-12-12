#!/bin/sh

file="$1"
shift

if [ ! -s "$file" ]; then
  echo "\033[0;41mempty file\033[0m"
  exit 0
fi

case "$(file -Lb --mime-type -- "$file")" in
  text/*)
    case "${file##*.}" in
      ino) lang="-l C" ;;
      config|conf|cfg) lang="-l conf" ;;
      prefs2) lang="-l sh" ;;
      *) lang="" ;;
    esac
    bat --plain --theme=Dracula --paging=never --color=always $lang "$file"
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
  message/rfc822)
    cat "$file"
    ;;
  *)
    [ -x "$file" ] \
      && echo "\033[0;46mbinary executable\033[0m" \
      || echo "\033[0;46mbinary file\033[0m"
    ;;
esac

file -Lb -- "$1" | fold -s -w "$width"
exit 0
