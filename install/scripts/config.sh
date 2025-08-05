#!/bin/bash

yay -S --noconfirm --needed stow

stow --target ~ /tmp/.dotfiles
