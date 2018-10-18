#!/usr/bin/env zsh

# Install Brew
command -v brew >/dev/null 2>&1 || { echo >&2 "Installing Homebrew…"; \
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"; }

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

# TMUX
if [ ! -d ~/.tmux/plugins/tpm ]
then
    git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
else
    echo 'Skipping Tmux Plugin Manager installation...'
fi
ln -fs ~/dotfiles/tmux.conf ~/.tmux.conf

# Install Powerline modified fonts
git clone https://github.com/powerline/fonts.git --depth=1 /tmp/fonts
/tmp/fonts/install.sh && rm -rf /tmp/fonts

# Install custom tmux theme
cp -f ~/dotfiles/tmux-themes/custom.tmuxtheme ~/.tmux/plugins/tmux-themepack/powerline/default/custom.tmuxtheme

# Link zsh config file
ln -fs ~/dotfiles/zshrc ~/.zshrc
#
# Also link bash, because maybe I want/need to open a bash shell
ln -fs ~/dotfiles/bash_profile ~/.bash_profile

# Link global git files
ln -fs ~/dotfiles/gitignore ~/.gitignore
ln -fs ~/dotfiles/gitconfig ~/.gitconfig
