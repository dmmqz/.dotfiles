# see ~/.config/zsh for additional configuration
export GTK_THEME=Adwaita-dark
export MANPAGER="nvim +Man!"
export EDITOR="nvim"
xdg-settings set default-web-browser librewolf.desktop

# Explicitly import first so custom keybindings are not overwritten
source ~/.config/zsh/p10k.sh

# Import additional configuration files
for file (~/.config/zsh/*); do
    [[ "$file" == "$HOME/.config/zsh/p10k.sh" ]] || source $file
done
