# general
alias refresh="source $HOME/.bashrc"
alias ll="ls -al"
alias md="mkdir -p"

# git
alias g="git"
alias gst="git status"
alias ga="git add"
alias gc="git commit -v"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"

# tm
alias tm="tmux -u new -A -s"            # create a new session, or attach to it if exists
alias tml="tmux list-sessions"           
alias tma='tmux attach -t $(tmux list-sessions -F "#{session_name}" | fzf)'

# zoxide
alias cd="z"
