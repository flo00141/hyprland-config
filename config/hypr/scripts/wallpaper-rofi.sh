#!/usr/bin/env bash

# 📁 Dossier contenant tes fonds d’écran
WALL_DIR="$HOME/Images/wallpaper"

# Vérifie que le dossier existe
if [ ! -d "$WALL_DIR" ]; then
  echo "❌ Dossier introuvable : $WALL_DIR"
  exit 1
fi

# 📜 Affiche la liste des fichiers images avec Rofi
SELECTED=$(find "$WALL_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | sort | rofi -dmenu -p "🌄 Choisir un fond d'écran")

# 🛑 Si l'utilisateur annule
if [[ -z "$SELECTED" ]]; then
  exit 0
fi

# 🔁 Applique le fond d’écran
hyprctl hyprpaper wallpaper "eDP-1,$SELECTED"

# 🎨 Génère le thème avec Matugen
matugen image "$SELECTED" --config ~/.config/matugen/matugen.toml

# 🔄 Recharge Waybar et Hyprland
pkill -SIGUSR2 waybar
sleep 0.5
hyprctl reload

notify-send "✅ Wallpaper appliqué" "$(basename "$SELECTED")"
