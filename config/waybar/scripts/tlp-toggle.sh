#!/usr/bin/env bash

TLP="/run/current-system/sw/bin/tlp"
STATE_FILE="/tmp/.tlp_mode"
current=$(cat "$STATE_FILE" 2>/dev/null)

if [[ "$current" == "AC" ]]; then
  sudo $TLP bat
  echo "BAT" >"$STATE_FILE"
  notify-send "TLP" "󰁹 Mode Économie activé"
else
  sudo $TLP ac
  echo "AC" >"$STATE_FILE"
  notify-send "TLP" "󰚥 Mode Performance activé"
fi
