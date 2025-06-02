# see ~/.config/zsh for additional configuration
export GTK_THEME=Adwaita-dark
export MANPAGER="nvim +Man!"
export EDITOR="nvim"

# Import additional configuration files
for file (~/.config/zsh/*); do
    source $file
done
