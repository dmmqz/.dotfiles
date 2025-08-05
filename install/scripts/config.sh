#!/bin/bash

yay -S --noconfirm --needed stow

cd /tmp/.dotfiles
stow --target ~ .
cd -
