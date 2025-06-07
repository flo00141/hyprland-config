#!/usr/bin/env bash

if ! bluetoothctl show | grep -q "Powered: yes"; then
  echo " OFF"
  exit
fi

CONNECTED=$(bluetoothctl devices Connected | awk '{$1=$2=""; print substr($0,3)}')

if [ -z "$CONNECTED" ]; then
  echo "  ON "
else
  echo "  $CONNECTED "
fi
