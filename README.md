# Setup

1. [`tmux`](https://github.com/tmux/tmux/wiki) + [`Oh my tmux`](https://github.com/gpakosz/.tmux#configuration).
2. [`zsh`](https://www.zsh.org/) + [Oh My Zsh](https://ohmyz.sh/) + [powerlevel10k](https://github.com/romkatv/powerlevel10k#fonts).
3. [`powerline`](https://github.com/powerline/powerline)

# `tmux` setup

Since we're using `Oh my tmux`, the `.tmux.conf` file here can be ignored. To set up `Oh my tmux`, do the following steps (the steps given in the docs for `Oh my tmux` are a bit messy).

```shell
git clone https://github.com/gpakosz/.tmux.git "~/oh-my-tmux"   # clone
ln -s ~/oh-my-tmux/.tmux.conf ~/.tmux.conf    # create symbolic link pointing to the file in oh-my-tmux
cp ~/oh-my-tmux/.tmux.conf.local ~/.tmux.conf.local     # only make changes to this file
```

After this, DON'T touch the file `.tmux.conf`. Make all modifications required to `~/.tmux.conf.local` (see the documentation for `Oh my tmux`).


# GNOME settings

I use the [Meslo Nerd Font](https://github.com/romkatv/powerlevel10k#fonts) (for `powerlevel10k`) and the [`Ubunto Mono Nerd Font`](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/UbuntuMono). Configuration is stored in `gterminal.preferences`. Use the following command to save the preferences.

```shell
dconf dump /org/gnome/terminal/ > ~/gterminal.preferences
```

To load the preferences, do the following. 

```shell
cat ~/gterminal.preferences | dconf load /org/gnome/terminal/legacy/profiles:/
```

See this post for more details: https://askubuntu.com/questions/774394/wheres-the-gnome-terminal-config-file-located. 

[`Gogh`](https://github.com/Gogh-Co/Gogh) offers a nice set of color schemes.
