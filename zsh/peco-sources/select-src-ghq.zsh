## Refer to:
# http://weblog.bulknews.net/post/89635306479/ghq-pecopercol

function peco-select-src-ghq () {
    local selected_dir=$(ghq list --full-path | peco --query "$LBUFFER")
    if [ -n "$selected_dir" ]; then
        BUFFER="cd ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-select-src-ghq
