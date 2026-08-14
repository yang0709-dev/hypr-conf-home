#!/usr/bin/env bash
set -euo pipefail

input="$(cat)"
input="${input%\\}"
# Truncate everything after &list
input="${input%%&list*}"

# Normalize the "watch" part (handle "watch\?..." -> "watch?...", and ensure "watch/?")
input="${input//\\\?/?}"
input="$(printf '%s' "$input" | sed 's#watch\?#watch/#')"

# Extract v=... (supports both "v=" and "v\=" forms), stop at next &
vval="$(printf '%s' "$input" | sed -n 's#.*[?&]v\\\=\([^&]*\).*#\1#p; t; s#.*[?&]v=\([^&]*\).*#\1#p')"

if [[ -z "${vval:-}" ]]; then
  echo "Could not extract v parameter from: $input" >&2
  exit 1
fi

url="https://www.youtube.com/watch/?v=$vval"
outdir="$HOME/Videos"

yt-dlp -f "bestvideo[height<=480]+bestaudio/best[height<=480]/best" -P "$outdir" "$url"
