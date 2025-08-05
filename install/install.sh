#!/bin/bash

REPO_DIR="/tmp/.dotfiles"

sudo pacman -S --noconfirm --needed git

rm -rf ${REPO_DIR}
git clone "https://github.com/dmmqz/.dotfiles" ${REPO_DIR}

source $REPO_DIR/install/initial/yay.sh
