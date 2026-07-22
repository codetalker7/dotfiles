# gpus

## notchpeak

quickly access cpu (use notchpeak-shared-short):
    
    salloc --time=01:00:00 --nodes=1 --ntasks=1 --mem=50G --account=notchpeak-shared-short --partition=notchpeak-shared-short --job=name=quick_test

quickly access any gpu:

    salloc --time=01:00:00 --nodes=1 --ntasks=1 --account=soc-gpu-np --partition=soc-gpu-np --qos=soc-gpu-np --gres=gpu:1 --job=name=vllm
    salloc --time=01:00:00 --nodes=1 --ntasks=1 --account=notchpeak-gpu --partition=notchpeak-gpu --qos=notchpeak-gpu --gres=gpu:1 --job=name=vllm
    salloc --time=01:00:00 --nodes=1 --ntasks=1 --account=owner-gpu-guest --partition=notchpeak-gpu-guest --qos=notchpeak-gpu-guest --gres=gpu:1 --job=name=vllm

standard gpus: 3090 (24GB), a6000 (48GB), titanx (12GB), p100 (16GB)

    salloc --time=01:00:00 --nodes=1 --ntasks=1 --mem=50G --account=notchpeak-gpu --partition=notchpeak-gpu --gres=gpu:3090:1 --job=name=vllm
    salloc --time=01:00:00 --nodes=1 --ntasks=1 --mem=50G --account=notchpeak-gpu --partition=notchpeak-gpu --gres=gpu:a6000:1 --job=name=vllm
    salloc --time=01:00:00 --nodes=1 --ntasks=1 --mem=40G --account=owner-gpu-guest --partition=notchpeak-gpu-guest --qos=notchpeak-gpu-guest --gres=gpu:a6000:1 --job=name=vllm
    salloc --time=01:00:00 --nodes=1 --ntasks=1 --mem=40G --account=notchpeak-shared-short --partition=notchpeak-shared-short --gres=gpu:t4:1 --job=name=vllm

debug gpus: t4 (16GB), 1080ti (11GB). 1080ti will not work due to low compute capability. use t4 if possible.

    salloc --time=08:00:00 --nodes=1 --ntasks=1 --mem=40G --account=notchpeak-shared-short --partition=notchpeak-shared-short --gres=gpu:t4:1 --job=name=vllm
    salloc --time=08:00:00 --nodes=1 --ntasks=1 --mem=40G --account=notchpeak-shared-short --partition=notchpeak-shared-short --gres=gpu:1080ti:1 --job=name=vllm

# using `sbatch` instead of `salloc` to hold sessions

`salloc` is neat, but it is probably better to hold sessions using `sbatch`.
With this, it becomes much easier for your compute nodes to persist even if
there are accidental network issues or something. For instance, look at
`tunnel.slr`. Create scripts like this for quick access.

# scratch space

    export SCRDIR=/scratch/general/vast/$USER/vllm
    mkdir -p $SCRDIR
    cd $SCRDIR

# apptainer container

    module load apptainer
    cd /scratch/general/vast/$USER/
    apptainer exec --fakeroot --nv --home /scratch/general/vast/$USER/ubuntulatest-sbx-home ubuntulatest-sbx.sif /usr/bin/fish

# setting up a uv env
    
    uv venv --python 3.11
    source .venv/bin/activate.fish
    uv pip install <package name>

# conda virtual environment as a user

    module load miniforge3
    module load cuda/12.8.1
    conda activate <env-name>

