Dotfiles
========
All the dots I need.

The included setup script creates symlinks from home directory to the files which 
are located in `~/dotfiles/`.

The setup script will back up existing dotfiles into a `~/.dotfiles_old/` 
directory if there is already any dotfiles of the same name as the dotfile 
symlinks being created in the home directory.

The setup script will also clone the `oh-my-zsh` repository from GitHub and then 
checks to see if `zsh` is installed.  If `zsh` is installed, and it is not already 
configured as the default shell, the setup script will execute a `chsh -s $(which zsh)`.

TL;DR, the install script will:

1. Back up any existing dotfiles in the home directory to `~/.dotfiles_old/`
2. Create symlinks to the dotfiles in `~/dotfiles/` in the home directory
3. Clone the `oh-my-zsh` repository from GitHub (to use with `zsh`)
4. Check to see if `zsh` is installed, if it isn't, try to install it.
5. If zsh is installed, run a `chsh -s` to set it as the default shell.

Installation
------------

``` bash
git clone git://github.com/franklinovitch/dotfiles ~/dotfiles
cd ~/dotfiles
./install.sh
```

*inspired by [michaeljsmalley's dotfiles repo](https://github.com/michaeljsmalley/dotfiles)*
