# 🌟 Florian's Hyprland Config

A personalized Hyprland setup running on NixOS, featuring:

- 🔹 Waybar (with custom modules)
- 🔹 Fuzzel launcher
- 🔹 Pastel color scheme + transparency
- 🔹 Dynamic theming possible with Matugen
- 🔹 Nerd Fonts + Rofi/Fuzzel
- 🔹 NixOS integration via `hyprland.nix`

## 📷 Screenshot
![preview](./hyprland_demo.gif)  # ← à modifier si tu veux afficher un fond

## 📁 Structure

config/
├── hypr/ → Hyprland config (keybinds, layouts, etc.)
├── waybar/ → Bar settings and modules
├── fuzzel/ → Launcher theme
├── wallpapers/ → Must adapt the way in hyprlock.conf & hyprpaper.conf
└── hyprland.nix → Optional config if you use NixOS

bash

## 🚀 Preview
```bash
git clone https://github.com/<ton_user>/hyprland-config ~/.config/hypr
