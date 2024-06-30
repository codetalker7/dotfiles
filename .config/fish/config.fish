#!/usr/bin/env fish

set -gx XDG_DATA_HOME "$HOME/.local/share"
set -gx XDG_CONFIG_HOME "$HOME/.config"
set -gx XDG_STATE_HOME "$HOME/.local/state"
set -gx XDG_CACHE_HOME "$HOME/.cache"

set -g fish_key_bindings fish_vi_key_bindings 

# editors; invoke with Alt+E to edit command in fish
set -gx VISUAL "nvim"
set -gx EDITOR "nvim"

# load pyenv
pyenv init - | source

# starship prompt
starship init fish | source
