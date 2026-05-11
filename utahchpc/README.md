# Steps to run the container from the image

First, install `apptainer` on your machine. If you can't install it on your machine, install
on some other machine (where you have root priveleges) and just `rsync` it to your machine.

Also, make sure to install `newuidmap`:

    sudo apt-get update && sudo apt-get install -y uidmap  

Now the container can be run easily. But it will miss the dotfiles needed to run the container. To do that,
run the container:

    apptainer exec --fakeroot --nv --home $HOME ubuntulatest-sbx.sif /usr/bin/fish

(make sure that your `--home` is somewhere where the files persist; for instance, here it's just 
in my usual `$HOME`) and then just do a `yadm clone` from inside the container:

    yadm clone https://github.com/codetalker7/dotfiles.git

Then, just launch the container again. At this point, all the dotfiles are present; we just need to
configure the `fish` paths. Note that `fish` stuff is installed in the `.config/fish` directory,
and so they will have to be installed again:

    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher    
    fisher install PatrickF1/fzf.fish

Note that things like `conda`, `uv`, and `bob` are usually installed in the home directory, so you'll have to install those again (just follow
the steps from the `ubuntu2204.apptainer.sh` file, hardly takes time).

