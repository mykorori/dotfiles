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
    gnu-sed

    # Shell
    zsh

    # Language
    ghc
    cabal-install
    scala
    nvm
    ruby
    go
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

    # Utils
    wget
    curl
    openssl
    readline
    pandoc
    z
    the_silver_searcher
    peco
)

echo "installing binaries..."
brew install ${packages[@]} && brew cleanup

# Casks
brew install brew-cask

apps=(
    # Browser
    google-chrome-canary
    firefoxdeveloperedition-ja

    # Terminal
    iterm2

    # Editor
    atom
    coteditor

    # Communication
    skype

    # VM
    virtualbox
    vagrant
    vagrant-manager

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
    font-source-han-sans
    font-source-han-code-jp
    font-fira-sans
    font-fira-mono
)

echo "installing fonts..."
brew cask install ${fonts[@]}
