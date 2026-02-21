# Copilot Instructions

## Overview

Arch Linux dotfiles managed with [GNU Stow](https://www.gnu.org/software/stow/). The repo lives at `~/.dotfiles` and is symlinked into `$HOME` via stow.

## Applying Changes

To deploy dotfiles after editing:

```bash
cd ~/.dotfiles
stow --adopt .   # symlink everything into $HOME
git restore .    # discard any changes stow made to tracked files
```

The `install/` directory is excluded from stow (see `.stow-global-ignore`).

## Repository Structure

- **Root dotfiles** (`.zshrc`, `.tmux.conf`, `.gitconfig`, `.p10k.zsh`, `.clang-format`) — symlinked directly to `$HOME`
- **`.config/`** — application configs symlinked to `~/.config/`; each subdirectory maps to one application
- **`install/`** — one-shot Arch Linux bootstrap scripts; not managed by stow

## Install Scripts

`install/install.sh` is the entry point. It clones the repo and sources scripts in order:

1. `yay.sh` — builds and installs the yay AUR helper
2. `desktop.sh`, `applications.sh`, `development.sh`, `misc.sh`, `terminal.sh` — package installation via `yay -S`
3. `zsh.sh`, `services.sh`, `wifi.sh` — system configuration
4. `config.sh` — runs `stow --adopt . && git restore .` to link dotfiles

## Zsh Configuration

`.zshrc` sources every file in `~/.config/zsh/` (all are in this repo under `.config/zsh/`). To add new shell config, create a new `.sh` file in `.config/zsh/`.

## Neovim Configuration

Config lives in `.config/nvim/`. Plugin manager is [lazy.nvim](https://github.com/folke/lazy.nvim). All Lua modules are namespaced under `caplox/`:

- `lua/caplox/lazy.lua` — plugin declarations
- `lua/caplox/mappings.lua` — keymaps
- `lua/caplox/settings.lua` — vim options
- `lua/caplox/configs/` — per-plugin configuration (LSP, conform, mason, etc.)
- `after/ftplugin/` — filetype-specific overrides

Theme: `tokyonight-storm`. Completion: `blink.cmp` (manual trigger with `<C-j>`).

## Gitignored Secrets

These files must be created manually and are never committed:

- `.config/alacritty/extra.toml` — machine-specific alacritty overrides
- `.config/i3blocks/.env` — i3blocks environment (defines CITY and API_KEY used by the weather block)
- `.config/nvim/lazy-lock.json` — lockfile (intentionally excluded)

## i3 and i3blocks

- `.config/i3/` contains the i3 window manager configuration (main file: `.config/i3/config`). Key behaviors and notes:
  - Sets `$mod` to `Mod4` and defines workspace and window management keybindings.
  - Binds media keys and volume controls (uses `pactl`/`amixer`) and adds media player bindings via `playerctl`.
  - Auto-starts background services (e.g., `mullvad-vpn`, `picom`, `redshift`) and loads wallpaper via `~/.config/.fehbg`.
  - Configures `i3bar` to run `i3blocks` with: `status_command SCRIPT_DIR=~/.config/i3blocks/statusbar i3blocks`.

- `.config/i3blocks/` holds the `config` and `statusbar/` scripts:
  - `config` forwards to `$SCRIPT_DIR/$BLOCK_NAME` and defines blocks like `mediaplayer`, `volume-custom`, `weather`, and `time`.
  - `statusbar/mediaplayer` is a Perl script that prefers `playerctl` and supports `BLOCK_INSTANCE` to target a specific player; `statusbar/volume-custom` is a small bash script using `amixer`.
  - `statusbar/` scripts rely on machine-specific environment variables; `.config/i3blocks/.env` is gitignored and defines CITY and API_KEY used by the weather block.
  - To test individual blocks locally, set `SCRIPT_DIR` and run the script directly, for example:
    - `SCRIPT_DIR=~/.config/i3blocks/statusbar bash ~/.config/i3blocks/statusbar/volume-custom`
    - `SCRIPT_DIR=~/.config/i3blocks/statusbar BLOCK_INSTANCE=cmus perl ~/.config/i3blocks/statusbar/mediaplayer`