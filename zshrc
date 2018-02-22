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

# Link & enable custom theme
ln -sf ${ZDOTDIR:-${HOME}}/dotfiles/jordinebot.zsh-theme ${ZIM_HOME}/modules/prompt/themes/jordinebot.zsh-theme


source ${ZDOTDIR:-${HOME}}/dotfiles/exports
source ${ZDOTDIR:-${HOME}}/dotfiles/aliases

