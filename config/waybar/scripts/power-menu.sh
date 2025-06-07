#!/usr/bin/env bash

choice=$(printf "\uf011 Quitter Sway\n\uf2f1 Redémarrer\n\uf011 Éteindre\n\uf05e Annuler" |
  wofi --dmenu --cache-file /dev/null --prompt "Session")

case "$choice" in
*"Quitter Sway") swaymsg exit ;;
*"Redémarrer") systemctl reboot ;;
*"Éteindre") systemctl poweroff ;;
*) exit 0 ;;
esac
