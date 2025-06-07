#!/usr/bin/env bash

state=$(cat /tmp/.tlp_mode 2>/dev/null || echo "BAT")

if [[ "$state" == "AC" ]]; then
  echo " 󰚥 Perf "
else
  echo " 󰁹 Eco "
fi
