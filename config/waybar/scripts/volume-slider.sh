#!/usr/bin/env bash
current=$(pamixer --get-volume)

chosen=$(yad --scale \
  --text="Volume" \
  --min-value=0 --max-value=150 --value="$current" \
  --button="OK:0" --button="Cancel:1" \
  --title="Volume" \
  --width=300 --height=100)

[ $? -eq 0 ] && pamixer --set-volume "$chosen"
