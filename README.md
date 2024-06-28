# dotfiles 

This repository contains my config for tools which I use in my workflow. Read on if you want to know about how to reproduce it and build from it!

**Note:** This config has been tested on [Ubuntu 22.04 LTS](https://releases.ubuntu.com/jammy/), but I believe it should work out of the box for other distributions as well.

## Base directory specification

This config assumes the defaults of the [`XDG Base Directory specification`](https://specifications.freedesktop.org/basedir-spec/basedir-spec-latest.html). Please see the referenced page for details about the default locations.

## Use [`yadm`](https://yadm.io/docs/overview#) clone

I use [`yadm`](https://yadm.io/docs/install#) to maintain my dotfiles. You'll need to install it on your system to clone use this config. For Ubuntu/Debian, standard package repositories can be used.

```shell
    sudo apt-get install yadm
```
