#!/bin/bash

# Here add custom module loads for all CHPC Linux systems

# set default forced session type
#   for locked-down environments.
#   Uncomment type of session you prefer
#forced_session=“screen”
#forced_session=“tmux”

# colors in bash
case "$TERM" in
	xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
	if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
	else
	color_prompt=
	fi
fi

if [ "$color_prompt" = yes ]; then
	PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
	PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# vim mode in bash
set -o vi
bind -m vi-insert '"\C-l": clear-screen'

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# globals for moving cache dirs to scratch
export SCRATCH_DIR=/scratch/general/vast/$USER
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
# source -- ~/.local/share/blesh/ble.sh

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
