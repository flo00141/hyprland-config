#!/usr/bin/env bash

WALL_DIR="$HOME/Images/wallpaper"
CACHE_PREVIEW="$HOME/.cache/wallpaper-previews"
mkdir -p "$CACHE_PREVIEW"

# Génère les previews (si non existantes)
generate_previews() {
  for img in "$WALL_DIR"/*.{jpg,png}; do
    [[ -f "$img" ]] || continue
    base=$(basename "$img")
    preview="$CACHE_PREVIEW/$base.png"
    if [ ! -f "$preview" ]; then
      convert "$img" -resize 300x200 "$preview"
    fi
  done
}

generate_previews

# Création du fichier rofi
LIST=$(find "$WALL_DIR" -type f \( -iname '*.jpg' -o -iname '*.png' \) | sort | while read -r img; do
  base=$(basename "$img")
  echo -en "$base\x00icon\x1f$CACHE_PREVIEW/$base.png\n"
done)

# Rofi avec prévisualisation
SELECTED=$(echo -e "$LIST" | rofi -dmenu -i -p "🌄 Sélectionne un fond" -show-icons -theme-str 'element-icon { size: 1.5em; }')

[[ -z "$SELECTED" ]] && exit 0

SELECTED_PATH="$WALL_DIR/$SELECTED"

# Appliquer fond d’écran et relancer
hyprctl hyprpaper wallpaper "eDP-1,$SELECTED_PATH"
matugen image "$SELECTED_PATH" --config ~/.config/matugen/matugen.toml
pkill -SIGUSR2 waybar
sleep 0.5
hyprctl reload

notify-send "✅ Wallpaper appliqué" "$SELECTED"
