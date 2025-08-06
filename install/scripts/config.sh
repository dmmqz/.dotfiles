#!/bin/bash

yay -S --noconfirm --needed stow

cd ~/.dotfiles
stow --adopt *
git restore .
cd -
