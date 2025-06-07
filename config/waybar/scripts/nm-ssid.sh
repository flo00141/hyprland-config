#!/usr/bin/env bash

ssid=$(nmcli -t -f NAME,TYPE connection show --active | grep ":802-11-wireless" | cut -d: -f1)

if [ -n "$ssid" ]; then
  echo "󰤨 $ssid"
else
  echo "❌ Offline"
fi
