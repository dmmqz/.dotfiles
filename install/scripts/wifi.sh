if [ ! -d "/proc/acpi/button/lid" ]; then
    return
fi

# TODO: test this
yay -S networkmanager network-manager-applet

systemctl enable NetworkManager.service
