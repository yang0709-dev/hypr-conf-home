#!/usr/bin/env bash

set -euo pipefail

if [ -z "${1+1}" ]; then
  echo "Error: No argument provided"
  echo "Usage: $0 <Filename>"
  return 1
fi
desktopFile="$HOME/.local/share/applications/$1.desktop"
touch "$desktopFile"
cat ~/Templates/something.desktop >"$desktopFile"
chmod +x "$desktopFile"
nvim "$desktopFile"
