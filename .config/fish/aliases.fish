alias zathura="zathura -l error --fork"
alias fzathura='zathura -l error --fork $(fzf -m)'
alias tm="tmux -u"
# alias sioyek="nohup sioyek $argv > /dev/null & disown"
# alias fsioyek='sioyek $(fzf)'

function lsd -d 'List only directories (in the current dir)'
    ls -d */ | sed -Ee 's,/+$,,'
end

# git
alias g git
alias gst="git status"
alias ga="git add"
alias gc="git commit -v"
alias gp="git push"
alias gl="git pull"
alias gd="git diff"

# system and utils
alias ll="ls -alh"
alias md="mkdir -p"        # Make directory (parent-safe)

# fish shell
alias config="nvim ~/.config/fish/config.fish"
