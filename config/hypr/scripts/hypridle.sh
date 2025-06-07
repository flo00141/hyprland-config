#!/usr/bin/env bash

USER=florian
HOME_DIR="/home/$USER"

mkdir -p "$HOME_DIR/.config/hypr"
mkdir -p "$HOME_DIR/.config/systemd/user"

cp /etc/hypridle/hypridle.conf "$HOME_DIR/.config/hypr/hypridle.conf"
cp /etc/hypridle/hypridle.service "$HOME_DIR/.config/systemd/user/hypridle.service"

chown -R "$USER:$USER" "$HOME_DIR/.config/hypr" "$HOME_DIR/.config/systemd"

sudo -u "$USER" systemctl --user daemon-reexec
sudo -u "$USER" systemctl --user daemon-reload
sudo -u "$USER" systemctl --user enable --now hypridle.service
