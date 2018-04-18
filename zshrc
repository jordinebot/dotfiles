#
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh
# User configuration sourced by interactive shells
#

# Change default zim location
export ZIM_HOME=${ZDOTDIR:-${HOME}}/.zim

# Start zim
[[ -s ${ZIM_HOME}/init.zsh ]] && source ${ZIM_HOME}/init.zsh

# Customize prompt colors
# prompt steeef [username_color] [hostname_color] [pwd_color] [branch_color]
# prompt steeef 166 136 64 61
prompt lean

source ${ZDOTDIR:-${HOME}}/dotfiles/exports
source ${ZDOTDIR:-${HOME}}/dotfiles/aliases

# Enable vi mode
bindkey -v

### SOME INTERESTING READS
# https://dougblack.io/words/zsh-vi-mode.html


export PATH="$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"
