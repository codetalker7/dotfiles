# Setup

1. [`tmux`](https://github.com/tmux/tmux/wiki) + [`Oh my tmux`](https://github.com/gpakosz/.tmux#configuration).
2. [`zsh`](https://www.zsh.org/) + [Oh My Zsh](https://ohmyz.sh/) + [powerlevel10k](https://github.com/romkatv/powerlevel10k#fonts).
3. [`powerline`](https://github.com/powerline/powerline)

# `tmux` setup

If you're going to use `Oh my tmux`, IGNORE THE `.tmux.conf` FILE IN THIS REPO.

To set up `Oh my tmux`, do the following steps (the steps given in the docs for `Oh my tmux` are a bit messy).

```shell
git clone https://github.com/gpakosz/.tmux.git ~/oh-my-tmux   # clone
ln -s ~/oh-my-tmux/.tmux.conf ~/.tmux.conf    # create symbolic link pointing to the file in oh-my-tmux
cp ~/oh-my-tmux/.tmux.conf.local ~/.tmux.conf.local     # only make changes to this file
```

After this, DON'T touch the file `.tmux.conf`. Make all modifications required to `~/.tmux.conf.local` (see the documentation for `Oh my tmux`).

## A useful tutorial for setting up copy-paste in `tmux`

This is a nice tutorial for setting up a convenient method for copy-pasting in `tmux`: https://www.seanh.cc/2020/12/27/copy-and-paste-in-tmux/.

# GNOME settings

I use the  [Ubunto Mono Nerd Font](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/UbuntuMono) (for `powerlevel10k`) and the [Meslo Nerd Font](https://github.com/romkatv/powerlevel10k#fonts). Configuration is stored in `gterminal.preferences`. Use the following command to save the preferences.

```shell
dconf dump /org/gnome/terminal/ > ~/gterminal.preferences
```

To load the preferences, do the following. 

```shell
cat ~/gterminal.preferences | dconf load /org/gnome/terminal/legacy/profiles:/
```

See this post for more details: https://askubuntu.com/questions/774394/wheres-the-gnome-terminal-config-file-located. 

[`Gogh`](https://github.com/Gogh-Co/Gogh) offers a nice set of color schemes.

# Steps to carry out

1. **Installing Alacritty**: Instructions are here: https://github.com/alacritty/alacritty/blob/master/INSTALL.md.
    - Install the dependencies: `apt install cmake pkg-config libfreetype6-dev libfontconfig1-dev libxcb-xfixes0-dev libxkbcommon-dev python3`.
    - Also need to install Rust (https://www.rust-lang.org/tools/install):
            ```
            curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
            rustup override set stable
            rustup update stable
            ```
    - Build the repository using `cargo build` (by following the given instructions).
    - Make sure terminfo for `alacritty` is installed: `infocmp alacritty`. If not, install it (see the instructions page).
    - Also make sure to have a desktop entry (given in the instructions).

2. **Installing tmux:** Just do it form their manual page: https://github.com/tmux/tmux/wiki/Installing#building-dependencies.
3. **Installing Oh my tmux:** As I mentioned above, the official instruction page is a bit messy. Just do the following:
        ```
        git clone https://github.com/gpakosz/.tmux.git ~/oh-my-tmux   # clone
        ln -s ~/oh-my-tmux/.tmux.conf ~/.tmux.conf    # create symbolic link pointing to the file in oh-my-tmux
        cp ~/oh-my-tmux/.tmux.conf.local ~/.tmux.conf.local     # only make changes to this file
        ```
    From here, only make changes to `~/.tmux.conf.local`. For any other steps, check the official repo.