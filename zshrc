#
# User configuration sourced by interactive shells
#

eval $(thefuck --alias)

if type brew &>/dev/null; then
  FPATH=$(brew --prefix)/share/zsh/site-functions:$FPATH
fi

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
export PROMPT_LEAN_TMUX=""
prompt lean

source ${ZDOTDIR:-${HOME}}/dotfiles/exports
source ${ZDOTDIR:-${HOME}}/dotfiles/aliases

# Enable vi mode
bindkey -v

### SOME INTERESTING READS
# https://dougblack.io/words/zsh-vi-mode.html

# https://unix.stackexchange.com/questions/139082/zsh-set-term-screen-256color-in-tmux-but-xterm-256color-without-tmux
[[ $TMUX != "" ]] && export TERM="screen-256color"

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
