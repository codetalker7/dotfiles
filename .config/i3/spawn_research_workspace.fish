#!/usr/bin/env fish

i3-msg "workspace $argv[1]; append_layout ~/.config/i3/research_workspace.json" & alacritty --class ResearchNvimTerm,researchnvimterm -e fish -c "cd /home/codetalker7/research-notes && tmux -u new-session -A -s research-notes 'nvim; fish'" & alacritty --class BookdownTerm,bookdownterm -e fish -c "cd /home/codetalker7/research-notes && R; exec fish" & zathura
