#!/bin/bash

yay -S --noconfirm --needed \
    rustup uv git-lfs php rsync texlive cmake nvim npm \
    github-cli tree-sitter-cli

rustup install stable
rustup default stable
