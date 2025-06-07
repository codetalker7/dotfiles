alias zathura="zathura -l error --fork"
alias fzathura='zathura -l error --fork $(fzf -m)'
alias tm="tmux -u"
# alias sioyek="nohup sioyek $argv > /dev/null & disown"
# alias fsioyek='sioyek $(fzf)'

function lsd -d 'List only directories (in the current dir)'
    ls -d */ | sed -Ee 's,/+$,,'
end

alias g git
