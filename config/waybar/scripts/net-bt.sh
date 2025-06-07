#!/usr/bin/env bash

bt_status=$(bluetoothctl show | grep "Powered: yes" && echo "󰂯" || echo "󰂲")
net_status=$(nmcli -t -f ACTIVE,SSID dev wifi | grep yes | cut -d: -f2)
echo "$bt_status $net_status"
