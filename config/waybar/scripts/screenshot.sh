#!/usr/bin/env bash

# Capture une zone sélectionnée à la souris
grim -g "$(slurp)" - | wl-copy --type image/png

# Notification optionnelle
notify-send "📸 Capture dans le presse-papier"
