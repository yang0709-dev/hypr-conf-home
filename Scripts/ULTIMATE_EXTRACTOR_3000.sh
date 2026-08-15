#!/usr/bin/env bash
# e(errexit) ==> exists when script failed (returns non-zero)
# u(nounset) ==> unset variable cause exit
# o pipefail ==> exit state will be the rightmost failed one
set -euo pipefail

# check if $1 is unset or empty
# ${1+1} expands to "1" if $1 is set, nothing if not set
if [ -z "${1+1}" ]; then
  echo "Error: No file path provided"
  echo "Usage: $0 <OPTION> <FILEPATH>"
  exit 1
fi

deleteMode=false

function extractFile() {
  file="${1}"
  local dirName
  dirName="$(dirname "$file")"
  echo "$dirName"
  if [[ "$file" == *.tar.xz || "$file" == *.tar.gz || "$file" == *.tar.bz2 ]]; then
    tar -xvf "$file" -C "$dirName"
  elif [[ "$file" == *.zip ]]; then
    unzip -d "$dirName" "$file"
  elif [[ "$file" == *.7z ]]; then
    7z x -o "$dirName" "$file"
  else
    echo "$file is not a extractable file, skipping..."
  fi

  if [ "$deleteMode" = true ] && [ -f "$file" ]; then
    rm --preserve-root "$file" 2>/dev/null
  fi
}

SCRIPT_DIR=$(dirname "$0")

# reads the help page
if [[ "$1" == "--help" ]]; then
  cat $SCRIPT_DIR/help-ue3.md | less && exit 0
fi

# loop all the arguements
for dir in "$@"; do
  # positional flag, deletes original compressed file AFTER the -d option

  if [[ "$dir" == "-d" ]]; then
    deleteMode=true
    continue
  fi

  # it is a file
  if [ ! -d "$dir" ]; then
    extractFile "$dir"
  else
    files=("$dir"/*)
    if [ ${#files[@]} -eq 0 ]; then
      echo "$dir directory is empty. Skipping."
      continue
    fi
    for f in "${files[@]}"; do
      if [ -d "$f" ]; then
        echo "Skipping subdirectory: $f"
      else
        extractFile "$f"
      fi
    done
  fi
done

exit 0
