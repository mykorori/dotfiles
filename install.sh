#!/bin/bash

if [ "$(uname)" == 'Darwin' ]; then
    OS='mac'
elif [ "$(expr substr $(uname -s) 1 5)" == 'Linux' ]; then
    OS='linux'
fi

git clone https://github.com/mykorori/dotfiles.git ~/dotfiles

if [ "$OS" = "mac" ]; then
    # create vscode dir
    mkdir -p ~/Library/Application\ Support/Code/User

    xcode-select --install
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
    brew install ansible
    ansible-playbook -i ~/dotfiles/hosts ~/dotfiles/playbook.mac.yml --ask-become-pass
elif [ "$OS" = "linux" ]; then
    if [ `which apt` ]; then
        sudo apt update
        sudo apt install ansible
        ansible-playbook -i ~/dotfiles/hosts ~/dotfiles/playbook.ubuntu.yml --ask-become-pass
    fi
fi
