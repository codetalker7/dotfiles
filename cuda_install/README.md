# How to install CUDA

First, do:

    ubuntu-drivers devices

This will give you the list of NVIDIA drivers. There will be a "recommended" driver for you to intsall. Since we don't want to do things manually, we can do:

    sudo ubuntu-drivers install

to install the best driver automatically. After installation, do a reboot:

    sudo reboot

This will help us to do `nvidia-smi`:

    nvidia-smi



