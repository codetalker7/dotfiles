# dotfiles 

This repository contains my config for tools which I use in my workflow. Read on if you want to know about how to reproduce it and build from it!

**Note:** This config has been tested on [Ubuntu 22.04 LTS](https://releases.ubuntu.com/jammy/), but I believe it should work out of the box for other distributions as well.

## Base directory specification

This config assumes the defaults of the [`XDG Base Directory specification`](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html). Please see the referenced page for details about the default locations.

## Use [`yadm`](https://yadm.io/docs/overview#) clone

I use [`yadm`](https://yadm.io/docs/install#) to maintain my dotfiles. You'll need to install it on your system to clone use this config. For Ubuntu/Debian, standard package repositories can be used:

    sudo apt-get install yadm

After a successfull install, you can clone this repository:

    yadm clone https://github.com/codetalker7/dotfiles.git
    yadm status

To run the initialization setup, you may use the `bootstrap` command:

    yadm bootstrap

**Note**: All encrypted files in this repository have been encrypted with [`git-secret`](https://sobolevn.me/git-secret/) and not `yadm encrypt`. Essentially, just replace `git` with `yadm`.

## Keys and other secrets

It's never a good idea to store keys and other private data on cloud (even a private repository on GitHub). For this config, I'm assuming that all private keys (for `ssh`, `gpg` or `pgp`) have been setup already.

## Config and installation scripts

All config files can be found either in the project root or in `.config/`. Installation scripts can be found in `.config/yadm`. Scripts can either be ran separately (given that their requirements are met), or they can be ran in the correct order using `yadm bootstrap`.

## Details

- **DE**: [xfce](https://wiki.archlinux.org/title/Xfce)
    - **Config manager**: [`xfconf-query`](https://docs.xfce.org/xfce/xfconf/xfconf-query).
- **Terminal Emulator**: [`alacritty`](https://github.com/alacritty/alacritty/blob/master/INSTALL.md).
- **WM**: [`i3`](https://i3wm.org/).
- **Shell**: [`fish`](https://fishshell.com/). 
- **Terminal Multiplexer:** [`tmux`](https://github.com/tmux/tmux/wiki/).
- **Editor**: [`nvim`](https://neovim.io/).
- **Browser**: [`brave-browser`](https://brave.com/download/) with the [`Vimium`](https://vimium.github.io/) extension.
- **PDF Viewer**: [`zathura`](https://pwmt.org/projects/zathura/installation/).
- **Image Viewer**: [`eog`](https://help.gnome.org/users/eog/stable/).
- **Utils**: Here's a list of utilities that I use:
    - [git-secret](https://sobolevn.me/git-secret/), for managing secrets.
        
            $ git secret --version
            0.5.0
    
    - [`xclip`](https://linux.die.net/man/1/xclip), clipboards.
    - [`fzf`](https://github.com/junegunn/fzf), a fuzzy-finder.
    - [`bat`](https://github.com/sharkdp/bat), a better `cat`.
    - [`eza`](https://github.com/eza-community/eza/tree/main), a better and faster `ls`.
    - [`htop`](https://htop.dev/) and [`nvtop`](https://github.com/Syllo/nvtop).
    - [`glow`](https://github.com/charmbracelet/glow), render markdown on the CLI.
    - [`pandoc`](https://pandoc.org/installing.html#linux), converting between markup formats. 
    - [`navi`](https://github.com/denisidoro/navi/blob/master/docs/installation.md), a cheatsheet maintainer.
    - [`papis`](https://github.com/papis/papis), a library and bibliography manager.
    - [`encfs`](https://wiki.archlinux.org/title/EncFS) or [`cryfs`](https://www.cryfs.org/), encrypting filesystems.
            
            $ cryfs --version
            CryFS Version 0.10.2

- **Signing commits**: I use my GPG key to sign `git` commits. More information is available in [here](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key) and [here](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits).
    
        $ gpg --version
        gpg (GnuPG) 2.2.27
        libgcrypt 1.9.4
        Copyright (C) 2021 Free Software Foundation, Inc.
        License GNU GPL-3.0-or-later <https://gnu.org/licenses/gpl.html>
        This is free software: you are free to change and redistribute it.
        There is NO WARRANTY, to the extent permitted by law.

        Home: /home/codetalker7/.gnupg
        Supported algorithms:
        Pubkey: RSA, ELG, DSA, ECDH, ECDSA, EDDSA
        Cipher: IDEA, 3DES, CAST5, BLOWFISH, AES, AES192, AES256, TWOFISH,
                CAMELLIA128, CAMELLIA192, CAMELLIA256
        Hash: SHA1, RIPEMD160, SHA256, SHA384, SHA512, SHA224
        Compression: Uncompressed, ZIP, ZLIB, BZIP2
        
- **LaTeX**: a [`texlive`](https://tug.org/texlive/acquire-netinstall.html) distribution. [More details are available in my old branch](https://github.com/codetalker7/dotfiles/tree/old-dotfiles?tab=readme-ov-file#latex-installation-and-setup).
    - `zathura`.
    - [`latexmk`](https://mg.readthedocs.io/latexmk.html#).

- **Sync**: [`rclone`](https://rclone.org/) for cloud, [`syncthing`](https://syncthing.net/) for device sync.

- **Knowledge Base management:** [`obsidian`](https://obsidian.md/) and [`papis`](https://github.com/papis/papis).

> [!CAUTION]
> Make sure to keep track of all crypto-related tools you're using to sign/encrypt/decrypt stuff. It's usually best practice to stick to the same version (so as to prevent any differences across the encryption/decryption algorithm over version changes; if any unforeseen change happens, you might lose your data). Always keep an unencrypted version of your files somewhere safe. 
