#!/usr/bin/env bash

ICON_LOCKED=" 󰌾 Démonté "
ICON_UNLOCKED=" 󰍁 Monté "

MOUNT="$HOME/Vault/clear"

if mountpoint -q "$MOUNT"; then
  echo "$ICON_UNLOCKED"
else
  echo "$ICON_LOCKED"
fi
