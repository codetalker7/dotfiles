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
    - Copy the tmux config: `cp .tmux.conf.local ~/.tmux.conf.local`.
    - Set up copy-paste in `tmux` from here: https://www.seanh.cc/2020/12/27/copy-and-paste-in-tmux/.
    - Also need to install `xclip` for step 5. to work; see the `.tmux.conf.local` file for more details.
4. **Installing zsh and Oh-my-zsh:** Installation instructions for `zsh` are here: https://github.com/ohmyzsh/ohmyzsh/wiki/Installing-ZSH. Instructions for
    Oh-my-zsh are here: https://github.com/ohmyzsh/ohmyzsh.
    - Then put the config file on your home folder: `cp .zshrc ~/.zshrc`.

5. **Installing stuff required for zsh:**
    - Install `powerlevel10k`: https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#meslo-nerd-font-patched-for-powerlevel10k in the Oh-my-zsh section.
    - Install the `Meslo Nerd Font` or the `Ubuntu Mono Nerd Font`: https://github.com/romkatv/powerlevel10k?tab=readme-ov-file#meslo-nerd-font-patched-for-powerlevel10k or https://github.com/ryanoasis/nerd-fonts/tree/master/patched-fonts/UbuntuMono (Ubuntu's font is better).
    - Put the `powerlevel10k` config file in the home directory: `cp .p10k.zsh ~/.p10k.zsh`.
    - Install all the plugins mentioned in `.zshrc` from instructions in their corresponding repos.
    - Install `colorls`: https://github.com/athityakumar/colorls?tab=readme-ov-file#installation and move the config file: `cp -r .config/colorls ~/.config/colorls`.

6. **Installing `nvim`:** from https://github.com/neovim/neovim/blob/master/INSTALL.md. Use a binary to install, and append the location to `.zshrc`'s PATH.
    - Move the config files: `cp -r .config/nvim ~/.config/nvim`.
    - Install `packer.nvim`: https://github.com/wbthomason/packer.nvim.
    - Configure/update all the neovim plugins from the config file. Some plugins break when new versions are introduced, so need to make the appropriate changes.
    - Install the LSP servers mentioned in the section on `lspconfig` in the config file. Do `:help lspconfig-all`.
    - Also install the treesitter parsers! As a start, you can begin with the following (`TSInstall <lspname>`): `c`, `cuda`, `go`, `java`, `julia`, `lua`, `markdown`, `markdown_inline`, `python`, `rust`.

7. **Configuring `alacritty`:** Move the config file: `cp -r .config/alacritty ~/.config/alacritty`.
    - Setup the `dracula` theme: https://draculatheme.com/alacritty.

8. **Dracula theme for `tmux`:** Copy the `dracula.conf` file from https://github.com/atgmello/dracula.omt to `~/.config/oh-my-tmux/themes`.

9. **Install the `Xfce` desktop environment:** Known to be faster than KDE. I followed this guide: https://www.linuxcapable.com/how-to-install-xfce-on-ubuntu-linux/.

10. **Install `fzf`:** A must needed fuzzy finder for linux. Install from here: https://github.com/junegunn/fzf?tab=readme-ov-file#linux-packages.

11. **Install `ripgrep`:** Needed for some features in `telescope.nvim`. Install from here: https://github.com/BurntSushi/ripgrep.

12. **Insall Tridactyl for firefox:** Vim-like keybinds for Firefox, see https://github.com/tridactyl/tridactyl.

13. **Install Vimium for chromium-browsers:** https://vimium.github.io/.

# LaTeX installation and setup

I largely followed [Evan Chen's local text setup]()

1. We'll use `zathura` as our pdf viewer: https://pwmt.org/projects/zathura/installation/. It is super smooth. Check `man zathura` to see how to use it. The config is in `.config/zathura/zathurarc`. Move it to the required location:
    
    ```
    cp .config/zathura/zathurarc ~/.config/zathura/zathurarc
    ```

2. **Install `TeX Live`:** I largely followed this tutorial for Jammy Jellyfish: https://linuxconfig.org/how-to-install-latex-on-ubuntu-22-04-jammy-jellyfish-linux. I installed the `texlive-latex-extra` package from `apt`. Next, check the `tlgmr` version:

    ```
    tlmgr --version
    ```
    I had the `2021` version. Installing/managing packages using `tlmgr` requires the local repository and the CTAN mirror to have the same versions (see the **Past releases** section here: https://tug.org/texlive/acquire.html). So, we set the `2021` remote version as follows:

    ```
    tlmgr option repository https://ftp.math.utah.edu/pub/tex/historic/systems/texlive/2021/tlnet-final
    ```
    
    To see the default directories and other environement variables related to `tlmgr`, you can do `tlmgr conf` (all of this info is available in `man tlmgr`). For instance, packages are installed in the directory specified by `TEXMFHOME`.

3. **Install and configure latexmk:** I followed instructions from this page: https://mg.readthedocs.io/latexmk.html#. 
article
4. **Install some basic latex packages:** 

    ```
    tlmgr install latex latex-bin latexconfig latex-fonts
    tlmgr install amsmath babel carlisle ec geometry graphics hyperref lm  marvosym oberdiek parskip graphics-def url
    ```

5. **Install `vimtex` and related LSP for `nvim`:** See https://github.com/lervag/vimtex?tab=readme-ov-file for the `nvim` plugin; there's also an LSP server for latex, called `texlab`: https://github.com/latex-lsp/texlab. Also, make sure to install the `treesitter` parser for `latex`. Try to do `TSInstall latex`. We probably need `tree-sitter CLI` for this: https://github.com/tree-sitter/tree-sitter/blob/master/cli/README.md.

# Document and bibliography management

I recommend [`papis`](https://github.com/papis/papis?tab=readme-ov-file) for this. Their README has all the information needed!

# File managers 

I use [`yazi`](https://yazi-rs.github.io/docs/installation/), a fast TUI file-manager. Check out their docs for installation steps! A nice alternative is [`fman`](https://fman.io/), which has Vim-like key bindings!

# Pandoc setup

1. Install from here: https://pandoc.org/installing.html.
