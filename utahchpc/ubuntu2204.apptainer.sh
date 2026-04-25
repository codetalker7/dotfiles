# following steps from here: https://www.chpc.utah.edu/documentation/software/singularity.php#Building%20Your%20Own%20Singularity%20Container
# do this in an interactive job with salloc
cd /scratch/general/vast/$USER
module load apptainer
apptainer build --sandbox ubuntu2204-sbx docker://ubuntu:latest
mkdir ubuntu2204-sbx/uufs
touch ubuntu2204-sbx/etc/localtime
mkdir -p ubuntu2204-sbx/uufs/chpc.utah.edu
mkdir ubuntu2204-sbx/scratch

# load the container; after loading, make any necessary installations and stuff
# here, we don't need the --nv flag for the gpu; that will be used later when we're only
# running the container; make sure to use --fakeroot here to have root-like privileges inside the container
apptainer shell --fakeroot -w ubuntu2204-sbx           # install stuff here now; follow your usual setup; no need to use sudo

# installing some standard stuff
apt update
apt install curl unzip software-properties-common
apt-get install ca-certificates build-essential

# from this point on, you can use your usual dotfiles
