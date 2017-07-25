function peco-select-git-branches () {
    local selected_dir=$(git branch | peco --query "$LBUFFER" | tr -d ' ' | tr -d '*')
    if [ -n "$selected_dir" ]; then
        BUFFER="git checkout ${selected_dir}"
        zle accept-line
    fi
    zle clear-screen
}
zle -N peco-select-git-branches
