#!/bin/bash

yay -S --noconfirm --needed \
    rustup uv git-lfs php rsync texlive

rustup install stable
rustup default stable
