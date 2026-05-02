# Source

I've taken inspiration from this blog: 
https://www.baeldung.com/linux/clean-up-linux-system.

Do the following to do a dry run:

    sudo bash ./remove-old-logs.sh

To actually delete the unnecessary files, do the following:

    sudo ./remove-old-logs exec

Next, delete temporary files in `/tmp`:

    sudo rm -rf /tmp

Remove unused dependencies:
    
    apt-get autoremove

Remove unused kernels; first, do a dry run:
    
    sudo bash ./remove-unused-kernels.sh

Then, run it with `exec`:

    sudo bash ./remove-unused-kernels.sh exec

For other stuff, probably use BleachBit.
