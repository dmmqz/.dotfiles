#!/bin/bash

yay -S --noconfirm --needed \
    alacritty fastfetch fzf wget curl zip unzip \
    ripgrep jq htop man tlrc-bin less plocate \
    ffmpeg tmux yt-dlp

# Setup tmux plugins

git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
tmux source ~/.tmux.conf
~/.tmux/plugins/tpm/bin/install_plugins
