#!/bin/bash

if [ ! -d "/proc/acpi/button/lid" ]; then
    return
fi

yay -S networkmanager network-manager-applet

sudo systemctl enable NetworkManager.service --now

read -p "Wi-Fi SSID: " ssid
nmcli device wifi connect $ssid --ask
