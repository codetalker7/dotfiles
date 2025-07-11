# dotfiles

This repository contains my config for tools which I use in my workflow. Read on
if you want to know about how to reproduce it and build from it!

**Note:** This config has been tested on
[Ubuntu 22.04 LTS](https://releases.ubuntu.com/jammy/), but I believe it should
work out of the box for other distributions as well.

## Base directory specification

This config assumes the defaults of the
[`XDG Base Directory specification`](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html).
Please see the referenced page for details about the default locations.

## Use [`yadm`](https://yadm.io/docs/overview#) clone

I use [`yadm`](https://yadm.io/docs/install#) to maintain my dotfiles. You'll
need to install it on your system to clone use this config. For Ubuntu/Debian,
standard package repositories can be used:

    sudo apt-get install yadm

After a successfull install, you can clone this repository:

    yadm clone https://github.com/codetalker7/dotfiles.git
    yadm status

To run the initialization setup, you may use the `bootstrap` command:

    yadm bootstrap

**Note**: All encrypted files in this repository have been encrypted with
[`git-secret`](https://sobolevn.me/git-secret/) and not `yadm encrypt`.
Essentially, just replace `git` with `yadm`.

## Keys and other secrets

It's never a good idea to store keys and other private data on cloud (even a
private repository on GitHub). For this config, I'm assuming that all private
keys (for `ssh`, `gpg` or `pgp`) have been setup already.

## Config and installation scripts

All config files can be found either in the project root or in `.config/`.
Installation scripts can be found in `.config/yadm`. Scripts can either be ran
separately (given that their requirements are met), or they can be ran in the
correct order using `yadm bootstrap`.

## Details

- **DE**: [xfce](https://wiki.archlinux.org/title/Xfce)
  - **Config manager**:
    [`xfconf-query`](https://docs.xfce.org/xfce/xfconf/xfconf-query).
- **Terminal Emulator**:
  [`alacritty`](https://github.com/alacritty/alacritty/blob/master/INSTALL.md).
- **WM**: [`i3`](https://i3wm.org/).
- **Shell**: [`fish`](https://fishshell.com/).
- **Terminal Multiplexer:** [`tmux`](https://github.com/tmux/tmux/wiki/).
- **Editor**: [`nvim`](https://neovim.io/). I use the
  [`bob`](https://github.com/MordechaiHadad/bob) for version management.
- **Browser**: [`brave-browser`](https://brave.com/download/).
  - **Extensions**:
    - [Vimium](https://vimium.github.io/).
    - [Dark Reader](https://darkreader.org/).
    - [Bitwarden Password Manager](https://chromewebstore.google.com/detail/bitwarden-password-manage/nngceckbapebfimnlniiiahkandclblb)
- **PDF Viewers**:
  - [`zathura`](https://pwmt.org/projects/zathura/installation/).
- **Image Viewer**: [`eog`](https://help.gnome.org/users/eog/stable/) or `feh`.
- **Utils**: Here's a list of utilities that I use:
  - [git-secret](https://sobolevn.me/git-secret/), for managing secrets.

        $ git secret --version
        0.5.0

  - `git diff` tools:
    - [`nbdime`](https://nbdime.readthedocs.io/en/latest/), for diffing jupyter
      notebooks.
    - [`odt2txt`](https://github.com/dstosberg/odt2txt), for diffing Open
      Document formats.
  - [`xclip`](https://linux.die.net/man/1/xclip), clipboards.
  - [`fzf`](https://github.com/junegunn/fzf), a fuzzy-finder.
  - [`htop`](https://htop.dev/) and [`nvtop`](https://github.com/Syllo/nvtop).
  - [`pandoc`](https://pandoc.org/installing.html#linux), converting between
    markup formats.
  - [`jq`](https://jqlang.github.io/jq/download/), a very handy tool for
    processing `.json` data.
  - [`encfs`](https://wiki.archlinux.org/title/EncFS) or
    [`cryfs`](https://www.cryfs.org/), encrypting filesystems.

        $ cryfs --version
        CryFS Version 0.10.2

- **Signing commits**: I use my GPG key to sign `git` commits. More information
  is available in
  [here](https://docs.github.com/en/authentication/managing-commit-signature-verification/telling-git-about-your-signing-key)
  and
  [here](https://docs.github.com/en/authentication/managing-commit-signature-verification/signing-commits).

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

- **LaTeX**: a [`texlive`](https://tug.org/texlive/acquire-netinstall.html)
  distribution.
  [More details are available in my old branch](https://github.com/codetalker7/dotfiles/tree/old-dotfiles?tab=readme-ov-file#latex-installation-and-setup).
  - `zathura`.
  - [`latexmk`](https://mg.readthedocs.io/latexmk.html#).

- **Sync**: [`rclone`](https://rclone.org/) for cloud,
  [`syncthing`](https://syncthing.net/), `rsync` for device sync.

- **Knowledge Base management:** [`obsidian`](https://obsidian.md/) and
  [`papis`](https://github.com/papis/papis).

> [!CAUTION]
> Make sure to keep track of all crypto-related tools you're using to
> sign/encrypt/decrypt stuff. It's usually best practice to stick to the same
> version (so as to prevent any differences across the encryption/decryption
> algorithm over version changes; if any unforeseen change happens, you might
> lose your data). Always keep an unencrypted version of your files somewhere
> safe.

# Installing `texlive`

1. [Follow the steps from the official Tug documentation for `texlive`](https://www.tug.org/texlive/doc/texlive-en/texlive-en.html#installation).
   For me, the directory specification was as follows (these are all defaults):
   - `TEXDIR`: `/usr/local/texlive/2024`
   - `TEXMFLOCAL`: `/usr/local/texlive/texmf-local`
   - `TEXMFSYSVAR`: `/usr/local/texlive/2024/texmf-var`
   - `TEXMFSYSCONFIG`: `/usr/local/texlive/2024/texmf-config`
   - `TEXMFVAR`: `~/.texlive2024/texmf-var`
   - `TEXMFCONFIG`: `~/.texlive2024/texmf-config`
   - `TEXMFHOME`: `~/texmf`

2. After the installation is complete, set some paths; since I'm using `fish`, I
   did it like this (do all these _only once_):

       set -U fish_user_paths /usr/local/texlive/2024/bin/x86_64-linux $fish_user_paths

   To set the `MANPATH`, use the local `~/.manpath` file (see `man man` or
   [this post](https://unix.stackexchange.com/questions/344603/how-to-append-to-manpath)):

       # in ~/.manpath
       MANDATORY_MANPATH /usr/local/texlive/2024/texmf-dist/doc/man

3. Try installing a couple of useful packages:

       sudo $(which tlmgr) install latex latex-bin latexconfig latex-fonts
       sudo $(which tlmgr) install amsmath babel carlisle ec geometry graphics hyperref lm  marvosym oberdiek parskip graphics-def url

   Also, install `latexmk`:

       sudo $(which tlmgr) install latexmk

   Use `latexmk` to automate building and compiling the necessary files.

4. The installed packages can be found in `TEXDIR/texmf-dist/tex/`.

# `termux` + syncing between Android and Linux

I've realized that one of the better ways to sync between my Android and Linux
devices is via `termux`. I use `ssh` to connect my Android client with the Linux
server, and then use `rsync` to syncronize. To do this: just generate an `ssh`
public/private key pair on the
[Android device](https://wiki.termux.com/wiki/Remote_Access#SSH) and put the
public key in `~/.ssh/authorized_keys` of the Linux server. This should enable
`ssh`-based logins. Figure out the IP of the Linux host using `hostname -I`. I
put all of this in the `~/.ssh/config` file, so that I can just do
`ssh mylaptop` from termux.

Likewise, I put my Linux host's public key in the `~/.ssh/authorized_keys` of my
Android device so that I can `ssh` into my Android device from my Linux machine.
However, the ssh server on `termux` has to be
[started manually](https://wiki.termux.com/wiki/Remote_Access). Do the following
steps:

1. Run `sshd`.
2. Verify using `ps -A | grep sshd`.
3. Figure out the IP of the Android device using `ifconfig`. Then ssh normally.
4. Make sure that port you're connecting to is `8022`.

## Interal Storage

1. In termux, run `termux-setup-storage`. This sets up symlinks to allow you to
   access the Android filesystem easily,
   [creating a new directory `~/storage`](https://android.stackexchange.com/questions/166595/termux-how-do-i-create-a-directory-of-files-accessible-outside-of-termux/166637#166637).

2. From this `storage` directory, one can move to the internal storage of the
   device using `cd ~/storage/shared`.

## Use `rsync` for syncing

From this point on, it's straightforward to use `ssh` + `rsync` to sync between
the Linux host and the Android device. Just use the format

    rsync -raP src dest
