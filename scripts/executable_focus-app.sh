#!/usr/bin/env zsh
APP="$1"

# 1) Launch if needed
if ! pgrep -x "$APP" &>/dev/null; then
  open -a "$APP"
fi

# 2) Bring it front
open -a "$APP"
# 3) Check if the front window is truly fullscreen
FS=$(yabai -m query --windows --window | jq -r '.["is-native-fullscreen"]')

if [[ "$FS" != "1" && "$FS" != "true" ]]; then
  # → Not fullscreen yet: fullscreen it, then stop here
  osascript <<EOF
tell application "$APP" to activate
EOF
  exit
fi

# 4) At this point front window is fullscreen → cycle windows
CURRENT_ID=$(yabai -m query --windows --window | jq -r '.id')

# Build & sort this app’s window IDs
IDS=( ${(f)"$(
  yabai -m query --windows \
    | jq -r 'map(select(.app=="'"$APP"'")) | sort_by(.id) | .[].id'
)"} )

# Find its 1-based index
cur_idx=${IDS[(i)$CURRENT_ID]}
len=${#IDS[@]}

# Wrap to 1 if at end
next_idx=$(( cur_idx == len ? 1 : cur_idx + 1 ))

# Focus the next one
yabai -m window --focus "${IDS[$next_idx]}"
