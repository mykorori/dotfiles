## Refer to:
# https://github.com/tcnksm/dotfiles/blob/master/homebrew/install.sh

# Check Homebrew
if ! type brew > /dev/null 2>&1; then
    echo "Installing homebrew..."
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update Homebrew's Fomula
printf "Update Fomula? [Y/n]: " && read ans
if [ "${ans}" = "Y" ]; then
    brew update
fi

# Upgrade Homebrew's Fomula
printf "Upgrade? [Y/n]: " && read ans
if [ "${ans}" = "Y" ]; then
    brew upgrade
fi

# Tap
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap caskroom/cask
brew tap caskroom/versions
brew tap caskroom/fonts
brew tap dart-lang/dart
brew tap peco/peco
brew tap homebrew/apache
brew tap homebrew/php

# Packages
packages=(

    # GNU core utilities
    coreutils

    # Tools
    grep
    gsed

    # Shell
    zsh

    # Language
    ghc
    cabal-install
    nvm
    rbenv
    ruby-build
    elixir
    go
    dart
    dartium
    lua
    python3

    # Editor
    macvim --with-lua --with-luajit --env-std --override-system-vim

    # Multiplexer
    tmux
    tmux-mem-cpu-load

    # Git
    git
    tig

    # DB
    mysql
    redis
    mongodb
    leveldb

    # Utils
    wget
    curl
    openssl
    readline
    pandoc
    z
    the_silver_searcher
    peco

    # Container
    docker
    boot2docker

    # PHP
    # php54 --with-apache
    # composer
)

echo "installing binaries..."
brew install ${packages[@]} && brew cleanup

# Casks
brew install brew-cask

apps=(
    # Browser
    google-chrome
    firefox-ja
    firefoxdeveloperedition-ja

    # Terminal
    iterm2

    # Editor
    atom
    sublime-text3
    coteditor

    # Communication
    skype

    # VM
    virtualbox
    vagrant
    vagrant-manager
    chefdk

    # etc
    karabiner
    google-japanese-ime
    appcleaner
    filezilla
    onyx
    skitch
    mysqlworkbench
)

echo "installing apps..."
brew cask install --appdir="/Applications" ${apps[@]}

# Fonts
fonts=(
    font-ubuntu
    font-ubuntu-mono-powerline
    font-clear-sans
    font-roboto
    font-noto-sans-japanese
    font-noto-sans
    font-noto-serif
    font-fontawesome
)

echo "installing fonts..."
brew cask install ${fonts[@]}
