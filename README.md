# Setup

1. [`tmux`](https://github.com/tmux/tmux/wiki)
2. [`zsh`](https://www.zsh.org/) + [Oh My Zsh](https://ohmyz.sh/)
3. [`powerline`](https://github.com/powerline/powerline)

# GNOME settings

I use the [`Ubunto Mono Nerd Font`](https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/UbuntuMono). Configuration is stored in `gterminal.preferences`. Use the following command to save the preferences.

```shell
dconf dump /org/gnome/terminal/ > ~/gterminal.preferences
```

To load the preferences, do the following. 

```shell
cat ~/gterminal.preferences | dconf load /org/gnome/terminal/legacy/profiles:/
```

See this post for more details: https://askubuntu.com/questions/774394/wheres-the-gnome-terminal-config-file-located. 

[`Gogh`](https://github.com/Gogh-Co/Gogh) offers a nice set of color schemes.
