# following steps from here: https://www.chpc.utah.edu/documentation/software/singularity.php#Building%20Your%20Own%20Singularity%20Container
# do this in an interactive job with salloc
cd /scratch/general/vast/u1591895
module load apptainer
apptainer build --sandbox ubuntulatest-sbx docker://ubuntu:latest
mkdir ubuntulatest-sbx/uufs
touch ubuntulatest-sbx/etc/localtime
mkdir -p ubuntulatest-sbx/uufs/chpc.utah.edu
mkdir ubuntulatest-sbx/scratch

# load the container; after loading, make any necessary installations and stuff
# here, we don't need the --nv flag for the gpu; that will be used later when we're only
# running the container; make sure to use --fakeroot here to have root-like privileges inside the container
apptainer shell --fakeroot -w --home /scratch/general/vast/$USER/ubuntulatest-sbx-home ubuntulatest-sbx          # install stuff here now; follow your usual setup; no need to use sudo

# installing some standard stuff
apt update
apt install curl unzip software-properties-common rsync htop nvtop ncdu fzf fish yadm tmux clang llvm
apt-get install ca-certificates build-essential

# setup fish things
curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher
fisher install PatrickF1/fzf.fish
# after this, clone the fish config file from your dotfiles (i have a separate config file for the server); see the steps below

# from this point on, you can use your usual dotfiles
# first, let's do bob and nvim
curl -fsSL https://raw.githubusercontent.com/MordechaiHadad/bob/master/scripts/install.sh | bash
fish_add_path $HOME/.local/bin
bob use latest
fish_add_path $HOME/.local/share/bob/nvim-bin

# get dotfiles
yadm clone https://github.com/codetalker7/dotfiles.git
# in the tmux.conf file, change the tmux prefix to C-m; also, change default
# shell to fish with: set-option -g default-shell /usr/bin/fish

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
# also keep copy of image on home
apptainer build ubuntulatest-sbx.sif ubuntulatest-sbx
rm -rf ubuntulatest-sbx               # can recreate this from .sif file
cp ubuntulatest-sbx.sif $HOME/
cp -r ubuntulatest-sbx-home $HOME/

# can access the container using the sif file now;
apptainer exec --fakeroot --nv --home /scratch/general/vast/$USER/ubuntulatest-sbx-home ubuntulatest-sbx.sif /usr/bin/fish          # install stuff here now; follow your usual setup; no need to use sudo

# later, can re-build the writeable sandbox from .sif file (to install additional stuff)
apptainer build --fakeroot --sandbox /scratch/general/vast/$USER/ubuntulatest-sbx ubuntulatest-sbx.sif

# in this re-built sandbox, you can install things again; make sure to save the image again! (follow the steps above)
