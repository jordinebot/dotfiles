#!/bin/bash

# Get the repository dir (Credit: https://unix.stackexchange.com/a/17500)
DIR="$(cd "$(dirname "$0")" && pwd)";

function doInstall() {
    # Link this dotfiles repository to ~/.dotfiles
    ln -s $DIR ~/.dotfiles;

    # Link .bash_profile
    ln -s ~/.dotfiles/.bash_profile ~/.bash_profile;

    source ~/.bash_profile;
}

read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1;
echo "";
if [[ $REPLY =~ ^[Yy]$ ]]; then
    doInstall;
fi;
unset doInstall;
