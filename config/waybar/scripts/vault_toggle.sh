#!/usr/bin/env bash

MOUNT="$HOME/Vault/clear"
SOURCE="$HOME/Vault/encrypted"

ICON_LOCKED="󰌾"
ICON_UNLOCKED="󰍁"

# Démontage si déjà monté
if mountpoint -q "$MOUNT"; then
  cd ~
  fusermount -u "$MOUNT"
  sleep 0.5
  if mountpoint -q "$MOUNT"; then
    notify-send "❌ Échec du démontage"
    echo "$ICON_UNLOCKED"
  else
    notify-send "🔒 Vault démonté"
    echo "$ICON_LOCKED"
  fi
  exit 0
fi

# Sinon : lancer une fenêtre Kitty pour demander le mot de passe
kitty --class vaultpass --title "Vault" -e bash -c '
  TMP=$(mktemp)
  chmod 600 "$TMP"
  echo "🔐 Saisir le mot de passe Vault :"
  read -s PASSWORD
  echo "$PASSWORD" > "$TMP"
  echo ""

  gocryptfs -extpass "cat $TMP" ~/Vault/encrypted ~/Vault/clear
  STATUS=$?

  shred -u "$TMP"

  if [ $STATUS -eq 0 ]; then
    notify-send "🔓 Vault monté"
  else
    notify-send "❌ Échec du montage"
  fi

  read -p "Appuyez sur Entrée pour fermer ce terminal..."
'

# Affichage dans Waybar
if mountpoint -q "$MOUNT"; then
  echo "$ICON_UNLOCKED"
else
  echo "$ICON_LOCKED"
fi
