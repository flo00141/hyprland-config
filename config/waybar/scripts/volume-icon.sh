#!/usr/bin/env bash
vol=$(pamixer --get-volume)
mute=$(pamixer --get-mute)

if [ "$mute" = true ]; then
  icon=""
else
  if [ "$vol" -gt 70 ]; then
    icon=""
  elif [ "$vol" -gt 30 ]; then
    icon=""
  else
    icon=""
  fi
fi

echo "{\"text\": \"$icon\", \"tooltip\": \"Volume: $vol%\"}"
