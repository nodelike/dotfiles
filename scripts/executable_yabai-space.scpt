#!/usr/bin/osascript
-- ~/bin/yabai-newspace.scpt

-- 1) get the display UUID of the focused window
set displayUUID to do shell script "yabai -m query --windows --window | jq -r '.display'"

-- 2) create a new space on that display
do shell script "yabai -m space --create --display " & quoted form of displayUUID

-- 3) give yabai a moment
delay 0.1

-- 4) find the newly created space’s global index
set newSpace to do shell script "
  yabai -m query --spaces \
    | jq -r --arg uuid " & quoted form of displayUUID & " '\
        map(select(.display == $uuid)) \
        | sort_by(.index) \
        | last \
        | .index\
      '"

-- 5) move the focused window there
do shell script "yabai -m window --space " & newSpace

-- 6) switch to it
do shell script "yabai -m space --focus " & newSpace
