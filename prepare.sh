#!/usr/bin/env bash
# Use bash shebang cause it's OSX default.

PROJECTS_FOLDER=/git

# Install Brew
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew…"; \
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

# Install CLI utils
brew install \
     git \
     node \
     yarn \
     the_silver_searcher \
     tmux \
     fzy \
     python@2 \
     thefuck

# Create projects folder
sudo mkdir $PROJECTS_FOLDER
sudo chown $(id -un):$(id -gn) $PROJECTS_FOLDER

# Install neovim
pip2 install neovim
pip3 install neovim
brew install neovim
sudo gem install neovim
gem environment
yarn global add neovim

# Install Desktop Apps
brew cask install \
     iterm2 \
     firefox \
     firefox-nightly \
     firefox-developer-edition \
     slack

