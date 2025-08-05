#!/bin/bash

REPO_DIR="/tmp/.dotfiles"
SCRIPT_DIR="$REPO_DIR/install/scripts/"

sudo pacman -S --noconfirm --needed git

rm -rf ${REPO_DIR}
git clone "https://github.com/dmmqz/.dotfiles" ${REPO_DIR}

source $SCRIPT_DIR/yay.sh

source $SCRIPT_DIR/config.sh

source $SCRIPT_DIR/desktop.sh
source $SCRIPT_DIR/applications.sh
source $SCRIPT_DIR/development.sh
source $SCRIPT_DIR/misc.sh
source $SCRIPT_DIR/terminal.sh

source $SCRIPT_DIR/zsh.sh

source $SCRIPT_DIR/services.sh

echo "Installation complete, rebooting..."
sleep 5
reboot
