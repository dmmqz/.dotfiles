#!/bin/bash

yay -S --noconfirm --needed \
    rustup uv git-lfs php rsync texlive cmake nvim npm

rustup install stable
rustup default stable
