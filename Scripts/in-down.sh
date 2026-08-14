#!/usr/bin/env bash
set -euo pipefail

input="$(cat)"
# % operator removes the suffix
input="${input%\\}" # drop trailing "\" if present

# // removes every occurence of the pattern
# / removes the first one
# \\\? is the search pattern, \\ means one literal backslash, \? is ?
#
input="${input//\\\?/?}"                                  # watch\? -> watch?
input="$(printf '%s' "$input" | sed 's#watch\?#watch/#')" # watch? -> watch/

# Extract v=... (supports both "v=" and "v\="), stop at next &
vval="$(printf '%s' "$input" | sed -n 's#.*[?&]v\\\=\([^&]*\).*#\1#p; t; s#.*[?&]v=\([^&]*\).*#\1#p')"
if [[ -z "${vval:-}" ]]; then
  # >&2 sends the output to stderr
  # & tells the shell what follows is a file descripter
  echo "Could not extract v from: $input" >&2
  exit 1
fi

url="https://www.youtube.com/watch/?v=$vval"
outdir="$HOME/Videos"

yt-dlp -f "bestvideo[height<=480]+bestaudio/best[height<=480]/best" -P "$outdir" "$url"

# Find the most recently downloaded file in outdir and play it in VLC
file="$(ls -t "$outdir" 2>/dev/null | head -n 1)"
if [[ -z "${file:-}" ]]; then
  echo "Download finished but no output file was found in: $outdir" >&2
  exit 1
fi

vlc "$outdir/$file"
