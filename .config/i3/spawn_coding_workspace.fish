#!/usr/bin/env fish

i3-msg "workspace $argv[1]; append_layout ~/.config/i3/coding_workspace.json" & alacritty --class CodingNvimTerm,codingnvimterm -e fish -c "cd /home/codetalker7/coding && tmux new-session -A -s coding 'nvim; fish'" & alacritty --class BookdownTerm,bookdownterm -e fish -c "cd /home/codetalker7/coding && R; exec fish" & zathura
