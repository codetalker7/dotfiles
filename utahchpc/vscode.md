# SSHing from VSCode to compute nodes

Page to follow: https://www.chpc.utah.edu/documentation/software/vscode.php#remote

I'm assuming that the SSH setup has been already done.

There is a `tunnel.slr` script that is ready. This script is specific to the
shared node (for quick access; this is good for quick development and stuff).

From the interactive node, run this script via `sbatch`:

    sbatch tunnel.slr

Check the compute node where the script is job is running:

    squeue --me --name=tunnel --states=R -h -O Comment

This will give you the name of the node where the job is running. For instance,
suppose it is `notchpeak308`. In that case, update the `~/.ssh/config` file.
After that, connect to `notchpeak308` from your local terminal:

    ssh notchpeak308

Enter the password and everything one time. After this, you can ssh into
`notchpeak308` from VSCode direclty without having to enter the password again.
After you're done, `scancel` the job!
