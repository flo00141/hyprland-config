#!/usr/bin/env bash
pkill -SIGUSR2 waybar
sleep 0.5
hyprctl reload
