dotfiles
========

My dotfiles repos.

## Installation
**現状 OS X 用の Playbook しかありません。**

  1. Xcode Command Line Tools をインストール

        xcode-select --install

  2. リポジトリをクローン

        git clone https://github.com/yukink/dotfiles.git ~/dotfiles

  3. Homebrew のインストール

        ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

  4. Ansible のインストール

        brew update
        brew install ansible

  5. Playbook の実行

        cd ~/dotfiles
        ansible-playbook -i hosts playbook.yml

  6. zsh をログインシェルに設定

        sudo vi /etc/shells
        cat /etc/shells
        # List of acceptable shells for chpass(1).
        # Ftpd will not allow users to connect who are not using
        # one of these shells.

        /bin/bash
        /bin/csh
        /bin/ksh
        /bin/sh
        /bin/tcsh
        /bin/zsh
        /usr/local/bin/zsh
        /usr/local/bin/fish
        chsh -s /usr/local/bin/zsh
