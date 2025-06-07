#!/usr/bin/env bash

choice=$(echo -e " Verrouiller\n󰍃 Déconnexion\n󰜉 Redémarrer\n󰐥 Éteindre\n Annuler" | fuzzel --dmenu -p "florian  |    $(date '+%A %d %B – %H:%M')" --width 50 --lines 5)

case "$choice" in
" Verrouiller") hyprlock ;;
"󰍃 Déconnexion") hyprctl dispatch exit ;;
"󰜉 Redémarrer") systemctl reboot ;;
"󰐥 Éteindre") systemctl poweroff ;;
" Annuler") exit 0 ;;
esac
