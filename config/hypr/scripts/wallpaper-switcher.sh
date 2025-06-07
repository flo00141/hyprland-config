#!/usr/bin/env bash

# 📁 Dossier contenant les fonds d’écran
WALLPAPER="$1"

# Vérification du fichier
if [[ ! -f "$WALLPAPER" ]]; then
  echo "❌ Image non trouvée : $WALLPAPER"
  exit 1
fi

# 💻 Appliquer le fond via hyprctl
hyprctl hyprpaper wallpaper "eDP-1,$WALLPAPER"

# 🎨 Générer le thème avec Matugen
matugen image "$WALLPAPER" --config ~/.config/matugen/matugen.toml

# ✅ Recharger les éléments graphiques (facultatif si déjà dans post_hook)
pkill -SIGUSR2 waybar
sleep 0.5
hyprctl reload

echo "✅ Wallpaper et thème Matugen appliqués avec succès !"
