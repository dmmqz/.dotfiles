# see ~/.config/zsh for additional configuration
export GTK_THEME=Adwaita-dark
export MANPAGER="nvim +Man!"
export EDITOR="nvim"

# Import additional configuration files
source ~/.config/zsh/secret.sh
for file (~/.config/zsh/*); do
    [[ $file -ef ~/.config/zsh/secret.sh ]] || source $file
done
