#!/usr/bin/env bash

status=$(playerctl status 2>/dev/null)

case "$status" in
Playing)
  icon=" "
  ;;
Paused)
  icon=" "
  ;;
Stopped | *)
  icon=" "
  ;;
esac

title=$(playerctl metadata title 2>/dev/null | cut -c1-30)
artist=$(playerctl metadata artist 2>/dev/null | cut -c1-20)

if [ -n "$title" ] || [ -n "$artist" ]; then
  tooltip="$artist - $title  "
else
  tooltip="Aucun média "
fi

echo " {\"text\": \"$icon $title - $artist\", \"tooltip\": \"$tooltip\", \"class\": \"$status\"} "
