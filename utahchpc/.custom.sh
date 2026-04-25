#!/bin/bash

# Here add custom module loads for all CHPC Linux systems

# set default forced session type
#   for locked-down environments.
#   Uncomment type of session you prefer
#forced_session=“screen”
#forced_session=“tmux”

# vim mode in bash
set -o vi

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# globals for moving cache dirs to scratch
export PIP_CACHE_DIR=/scratch/general/nfs1/$USER/pip_cache
export HF_HOME="/scratch/general/vast/$USER/hf_home"
export UV_CACHE_DIR="/scratch/general/vast/$USER/.cache/uv"
export APPTAINER_CACHEDIR="/scratch/general/vast/$USER/.apptainer/cache"
export APPTAINER_TMPDIR="/scratch/general/vast/$USER/.apptainer/tmp"

# loading the environment variables
. "$HOME/.local/bin/env"

# sourcing the tmux config file
tmux source-file ~/.config/tmux/tmux.conf

# for a fish-like experience, I'm using ble.sh: https://github.com/akinomyoga/ble.sh
source -- ~/.local/share/blesh/ble.sh

# ----------------------------------------------------------------------
if [[ "$UUFSCELL" = "kingspeak.peaks" ]] ; then
# add custom module loads after this
     :

# ----------------------------------------------------------------------
# Do Notchpeak specific initializations
elif [[ "$UUFSCELL" = "notchpeak.peaks" ]] ; then
# add custom module loads after this
     :

# ----------------------------------------------------------------------
# Do Lonepeak specific initializations
elif [[ "$UUFSCELL" = "lonepeak.peaks" ]] ; then
# add custom module loads after this
     :

# ----------------------------------------------------------------------
# Do Granite specific initializations
elif [[ "$UUFSCELL" = "granite" ]] ; then
# add custom module loads after this
     :

# ----------------------------------------------------------------------
# Do Tangent specific initializations
elif [[ "$UUFSCELL" = "tangent.peaks" ]] ; then
# add custom module loads after this
     :

# ----------------------------------------------------------------------
# Do astro.utah.edu specific initializations
elif [[ "$UUFSCELL" = "astro.utah.edu" ]] ; then
# add custom module loads after this
	:

fi

# # Uncomment to set TMPDIR from default (and small) /tmp to /scratch/local
# if [ ! -d /scratch/local/$USER ] ; then
#      mkdir /scratch/local/$USER 
# fi
# export TMPDIR=/scratch/local/$USER 
