#!/usr/bin/env bash

alias doas=sudo
alias sd="systemctl poweroff"
alias record="ffmpeg -f x11grab -framerate 30 -i :0.0 -c:v libx264 ${filename:-output.mp4}"

# Find yay packages without leaving the terminal
alias yayf="yay -Slq | fzf --multi --preview 'yay -Sii {1}' --preview-window=down:75% | xargs -ro yay -S"
