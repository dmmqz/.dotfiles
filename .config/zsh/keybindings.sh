cmd_to_clip() {
    xclip -selection clipboard -in <<<"$BUFFER"
}

zle -N cmd_to_clip
bindkey '^X^Y' cmd_to_clip
bindkey -M viins '^X^Y' cmd_to_clip
