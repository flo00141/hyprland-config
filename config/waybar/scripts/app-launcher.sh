#!/usr/bin/env bash

# Choix de la catégorie
CATEGORY=$(printf "󰖟  Internet\n󰎈  Multimédia\n󰆍  Terminal & outils\n󰜺  Quitter" | fuzzel --dmenu -p "Catégorie :")

case "$CATEGORY" in
"󰖟  Internet")
  APP=$(printf "  Vivaldi" | fuzzel --dmenu -p "Internet :")
  case "$APP" in
  *Vivaldi*) exec vivaldi ;;
  esac
  ;;

"󰎈  Multimédia")
  APP=$(printf "  Spotify\n󰕾  Pavucontrol\n  Gimp" | fuzzel --dmenu -p "Multimédia :")
  case "$APP" in
  *Spotify*) exec spotify ;;
  *Pavucontrol*) exec pavucontrol ;;
  *Gimp*) exec gimp ;;
  esac
  ;;

"󰆍  Terminal & outils")
  APP=$(printf "  Kitty\n󰤨  Nmtui\n󰂯  Blueman" | fuzzel --dmenu -p "Outils :")
  case "$APP" in
  *Kitty*) exec kitty ;;
  *Nmtui*) kitty -e nmtui ;;
  *Blueman*) exec blueman-manager ;;
  esac
  ;;

"󰜺  Quitter")
  exit 0
  ;;
esac
