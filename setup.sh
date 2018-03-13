#!/usr/bin/env zsh

# Install ZIM if it doesn't exist
if [ ! -d ${ZDOTDIR:-${HOME}}/.zim ]
then
    git clone --recursive https://github.com/Eriner/zim.git ${ZDOTDIR:-${HOME}}/.zim

    setopt EXTENDED_GLOB
    for template_file ( ${ZDOTDIR:-${HOME}}/.zim/templates/* ); do
      user_file="${ZDOTDIR:-${HOME}}/.${template_file:t}"
      touch ${user_file}
      ( print -rn "$(<${template_file})$(<${user_file})" >! ${user_file} ) 2>/dev/null
    done

    source ${ZDOTDIR:-${HOME}}/.zlogin
    chsh -s $(which zsh)
else
    echo 'Skipping ZIM installation...'
fi

# Link zsh config file
ln -fs ~/dotfiles/zshrc ~/.zshrc
#
# Also link bash, because maybe I want/need to open a bash shell
ln -fs ~/dotfiles/bash_profile ~/.bash_profile

# Link global git files
ln -fs ~/dotfiles/gitignore ~/.gitignore
ln -fs ~/dotfiles/gitconfig ~/.gitconfig
