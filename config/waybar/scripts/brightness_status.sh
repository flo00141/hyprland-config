#!/usr/bin/env bash

PERCENT=$(brightnessctl | grep -oP '\(\K[0-9]+(?=%\))')
echo "  ${PERCENT}% "
