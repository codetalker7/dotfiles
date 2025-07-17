#!/usr/bin/env fish

i3-msg "workspace $argv[1]; append_layout ~/.config/i3/math_workspace.json" & alacritty --class MathNvimTerm,mathnvimterm -e fish -c "cd /home/codetalker7/math && tmux new-session -A -s math 'nvim; fish'" & alacritty --class BookdownTerm,bookdownterm -e fish -c "cd /home/codetalker7/math && R; exec fish" & zathura
