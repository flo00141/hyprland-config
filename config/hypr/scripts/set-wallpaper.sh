#!/usr/bin/env bash

WALLPAPER="$HOME/.config/hypr/wallpapers/everforest.webp"

# Générer les fichiers de thème
matugen image "$WALLPAPER" --mode dark --output ~/.cache/matugen/colors-kitty.conf --template kitty
matugen image "$WALLPAPER" --mode dark --output ~/.cache/matugen/colors-waybar.css --template waybar
matugen image "$WALLPAPER" --mode dark --output ~/.cache/matugen/colors-rofi.rasi --template rofi

# Recharger les applications
pkill waybar && waybar &
# Pour Rofi, le rechargement dépend de ton gestionnaire de fenêtres
