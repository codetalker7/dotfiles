# following steps from here: https://www.chpc.utah.edu/documentation/software/singularity.php#Building%20Your%20Own%20Singularity%20Container
# do this in an interactive job with salloc
cd /scratch/general/vast/u1591895
module load apptainer
apptainer build --sandbox ubuntu2204-sbx docker://ubuntu:latest
mkdir ubuntu2204-sbx/uufs
touch ubuntu2204-sbx/etc/localtime
mkdir -p ubuntu2204-sbx/uufs/chpc.utah.edu
mkdir ubuntu2204-sbx/scratch

# load the container; after loading, make any necessary installations and stuff
# here, we don't need the --nv flag for the gpu; that will be used later when we're only
# running the container; make sure to use --fakeroot here to have root-like privileges inside the container
apptainer exec --fakeroot -w --home /scratch/general/vast/$USER/ubuntu2204-sbx-home ubuntu2204-sbx /usr/bin/fish          # install stuff here now; follow your usual setup; no need to use sudo

# installing some standard stuff
apt update
apt install curl unzip software-properties-common rsync htop nvtop ncdu fzf fish yadm tmux
apt-get install ca-certificates build-essential

# get dotfiles
yadm clone https://github.com/codetalker7/dotfiles.git

# from this point on, you can use your usual dotfiles
# first, let's do bob and nvim
curl -fsSL https://raw.githubusercontent.com/MordechaiHadad/bob/master/scripts/install.sh | bash
fish_add_path $HOME/.local/bin
bob use latest
fish_add_path $HOME/.local/share/bob/nvim-bin

# tmux
git clone https://github.com/tmux-plugins/tpm $HOME/.tmux/plugins/tpm

# install conda
curl -O https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh
bash Miniconda3-latest-Linux-x86_64.sh
fish_add_path $HOME/miniconda3/bin
conda init fish

# uv
curl -LsSf https://astral.sh/uv/install.sh | sh

# finally, exit from the container, and save the image; can load this image as above (not writable)
apptainer build ubuntu2204-sbx.sif ubuntu2204-sbx
