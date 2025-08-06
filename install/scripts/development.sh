#!/bin/bash

yay -S --noconfirm --needed \
    rustup uv git-lfs php rsync texlive cmake

rustup install stable
rustup default stable
