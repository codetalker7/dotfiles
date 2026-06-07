# Installing and configuring codex

We want to do a user install (and not a global one). To do that, just do:

    cd $HOME
    mkdir -p ~/codex-cli
    mkdir -p /scratch/general/vast/$USER/codex-data
    cd ~/codex-cli

As you can see, above, we need the `codex-data` directory in our scratch space. This
is where our codex home will be. See `env.sh` for example. We also need to latest version of node 
to run and install this; so, need to do:
    
    module load gcc/13.1.0
    module load nodejs/22.4.0
    npm install @openai/codex

To run this, we can simply do:

    $HOME/codex-cli/node_modules/.bin/codex

So it's better to add this to the path. See `path.sh` and `env.sh` for more
details about codex-related directories.
