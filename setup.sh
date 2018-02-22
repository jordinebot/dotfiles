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
else
    echo 'Skipping ZIM installation...'
fi

# ln -fs ~/dotfiles/bash_profile ~/.bash_profile
ln -fs ~/dotfiles/zshrc ~/.zshrc
ln -fs ~/dotfiles/gitignore ~/.gitignore
