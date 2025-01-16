# NeoVim custom config
This is my custom NeoVim config.

## Main plugins
- lazy.nvim
- mason.nvim

## Python setup
Pylint linter requires the directory to modules to lint accurately. Add the following line to your .zshrc/.bashrc:
`export PYTHONPATH=$PYTHONPATH:/home/<user>/venv/lib/python3.12/site-packages`
`export PYTHONPATH=$PYTHONPATH:/home/caplox/miniconda3/envs/sim-mesa/lib/python3.12/site-packages`
