dotfiles
========

My dotfiles repos.

## Installation
**当リポジトリの install.sh は OS X で動作します。**

  1. Xcode をインストール
  2. Xcode Command Line Tools をインストール

        xcode-select --install

  3. リポジトリをクローン

        git clone https://github.com/moltpw/dotfiles.git ~/dotfiles

  4. インストールスクリプトを実行

        cd ~/dotfiles
        ./install.sh

  5. zsh をログインシェルに設定

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
        chsh -s /usr/local/bin/zsh

### Sublime Text 3
Sublime Text 3 は `Packages/User` をバックアップしてあります。  
設定のリストア手順について記載します。

  1. Sublime Text 3 を起動

  2. `~/Library/Application Support/Sublime Text 3/Packages/User` が作成されたことを確認する

  3. [Package Control をインストール](https://sublime.wbond.net/installation)して終了

  4. シンボリックリンクを張る

        ln -sf ~/dotfiles/sublime-text/User ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User

  5. Sublime Text 3 を起動

### Atom

  1. シンボリックリンクを張る

        ln -sf ~/dotfiles/atom ~/.atom

  2. apm にログイン

        apm login

  3. apm からインストール

        apm stars --install

### Ruby

  1. インストール

        rbenv install 2.2.0

  2. グローバルに適用

        rbenv global 2.2.0

### Node.js

  1. インストール

        nvm install iojs
