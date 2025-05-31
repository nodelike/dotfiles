#!/usr/bin/env zsh

# Toggle between two audio output devices
SWITCHAUDIO="/opt/homebrew/bin/SwitchAudioSource"
CURRENT="$($SWITCHAUDIO -c)"
if [[ "$CURRENT" == "MacBook Air Speakers (eqMac)" ]]; then
  $SWITCHAUDIO -s "SA-D40M2"
else
  $SWITCHAUDIO -s "MacBook Air Speakers"
fi