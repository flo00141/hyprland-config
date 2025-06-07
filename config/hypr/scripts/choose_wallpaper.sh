#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/Images/wallpaper"

SELECTED=$(find "$WALLPAPER_DIR" -type f \( -iname "*.jpg" -o -iname "*.png" \) -printf "%f\n" | fuzzel --dmenu -p "🎨 Choisir un fond :")
[ -z "$SELECTED" ] && exit 0

FULL_PATH="$WALLPAPER_DIR/$SELECTED"

# Récupérer automatiquement le nom du moniteur
MONITOR=$(hyprctl monitors | grep "Monitor" | awk '{print $2}')

# Kill hyprpaper proprement (au cas où il bloque)
pkill hyprpaper
sleep 0.3

# Générer un fichier temporaire de config pour hyprpaper
cat >~/.config/hypr/hyprpaper.conf <<EOF
preload = $FULL_PATH
wallpaper = $MONITOR,$FULL_PATH
EOF

# Relancer hyprpaper avec ce fond
hyprpaper --config ~/.config/hypr/hyprpaper.conf &

# Appliquer les couleurs avec Matugen
matugen image "$FULL_PATH" --config ~/.config/matugen/matugen.toml --verbose

# Notification (facultatif)
notify-send "🖼️ Fond appliqué" "$SELECTED + thème matugen généré"
