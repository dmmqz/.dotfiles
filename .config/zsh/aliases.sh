#!/usr/bin/env bash

alias doas=sudo
alias sd="systemctl poweroff"
alias record="ffmpeg -f x11grab -framerate 30 -i :0.0 -c:v libx264 ${filename:-output.mp4}"
