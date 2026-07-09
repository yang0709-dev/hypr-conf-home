#!/usr/bin/env bash
set -euo pipefail

export WAYLAND_DISPLAY="wayland-1"
export XDG_RUNTIME_DIR="/run/user/1000"

WALLPAPER_DIR="${1:-$HOME/Pictures/desktop-wallpapers}"
NAMESPACE="$(pgrep -a awww-daemon | cut -d' ' -f1 | head -n1)"


mapfile -t images < <(find "$WALLPAPER_DIR" -maxdepth 1 -type f \
  \( -iname '*.png' -o -iname '*.jpg' -o -iname '*.jpeg' \
     -o -iname '*.webp' -o -iname '*.gif' -o -iname '*.bmp' \) )

if [ ${#images[@]} -eq 0 ]; then
  echo "No images found in $WALLPAPER_DIR" >&2
  exit 1
fi

chosen="${images[RANDOM % ${#images[@]}]}"

awww img "$chosen" \
  --transition-type grow \
  --transition-duration 2 \
  --transition-fps 60

