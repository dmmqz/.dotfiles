#!/bin/bash

yay -S --noconfirm --needed stow

cd $HOME/.dotfiles
stow --adopt .
git restore .
cd -
