#!/bin/bash

yay -S --noconfirm --needed zsh

sh -c "$(wget https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh -O -)"

yay -S --noconfirm --needed zsh-theme-powerlevel10k-git

sudo chsh -s /bin/zsh $USER
