# Tmux
alias t="tmux"
alias tl="tmux list-sessions"
alias tn="tmux new -s"
alias ta="tmux attach -t"
alias ts="tmux switch -t"
alias tk="tmux kill-session -t"

# Vim
alias v="vim"

# Git Composed Aliases
alias g="git"
alias pull="git fetch && git pull"
alias push="git push"
alias main="git checkout main && git pull && fnm use"

# Web Development
alias C="cd ~/Code"
alias phoenix="fnm use && rm -rf package-lock.json node_modules && npm install"
