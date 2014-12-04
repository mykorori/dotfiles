#!/bin/zsh

# Refer to:
# https://github.com/tcnksm/dotfiles/blob/master/bootstrap.sh

cd "$(dirname "$0")"

set -e

info() {
    echo -e "\033[34m$@\033[m" # blue
}

warn() {
    echo -e "\033[33m$@\033[m" # yellow
}

error() {
    echo -e "\033[31m$@\033[m" # red
}

info "Install Homebrew Packages"
./homebrew/Brewfile.sh

if [[ ! -d ~/.zprezto ]]; then
    info "Setting up prezto"

    git clone --recursive https://github.com/sorin-ionescu/prezto.git "${ZDOTDIR:-$HOME}/.zprezto"

    setopt EXTENDED_GLOB
    for rcfile in "${ZDOTDIR:-$HOME}"/.zprezto/runcoms/^README.md(.N); do
        ln -s "$rcfile" "${ZDOTDIR:-$HOME}/.${rcfile:t}"
    done
    for orrcfile in "$(pwd)"/zsh/prezto-override/*; do
        ln -sf "$orrcfile" "${ZDOTDIR:-$HOME}/.${orrcfile:t}"
    done

    info "Set Homebrew's Zsh as your default shell:"
    echo "Add homebrew's zsh path to /etc/shells."
    echo "After,"
    echo "$ chsh -s /usr/local/bin/zsh"
fi

info "Enable dotfiles, make symlink to ' ${HOME}' directory"
ln -si "$(pwd)/tmux/.tmux.conf" "${ZDOTDIR:-$HOME}/.tmux.conf"
ln -si "$(pwd)/tig/.tigrc" "${ZDOTDIR:-$HOME}/.tigrc"
ln -si "$(pwd)/iterm/com.googlecode.iterm2.plist" "${ZDOTDIR:-$HOME}/Library/Preferences/com.googlecode.iterm2.plist"

if [[ ! -d  ~/.tmux/plugins/tmux-powerline ]]; then
    info "Install tmux-powerline"
    git clone https://github.com/erikw/tmux-powerline.git ~/.tmux/plugins/tmux-powerline
fi
