# NeoVim custom config
This is my custom NeoVim config.

## Main plugins
- lazy.nvim
- mason.nvim

## Python setup
Black formatter for Python is installed using a venv instead of Mason. This is because Mason caused some issues.
```sh
mkdir -p ~/.local/venv && cd ~/.local/venv
python3 -m venv nvim
cd nvim
. ./bin/activate
pip install pynvim black 
```
