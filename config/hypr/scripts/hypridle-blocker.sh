#!/usr/bin/env bash

while true; do
  if playerctl status 2>/dev/null | grep -q Playing; then
    pkill -STOP hypridle 2>/dev/null
  else
    pkill -CONT hypridle 2>/dev/null
  fi
  sleep 5
done
