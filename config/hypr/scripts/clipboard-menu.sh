#!/usr/bin/env bash

cliphist list | fuzzel --dmenu --lines 30 --width 60 --prompt "📋 Presse-papier" | cliphist decode | wl-copy
