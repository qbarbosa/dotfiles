#!/bin/bash
############################
# .make.sh
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################

########## Variables

dir=~/dotfiles                    # dotfiles directory
olddir=~/.dotfiles_old             # old dotfiles backup directory
files="bash_profile bash_aliases bashrc zshrc oh-my-zsh tmux.conf vimrc vim"    # list of files/folders to symlink in homedir

##########

# create dotfiles_old in homedir
echo "Creating $olddir for backup of any existing dotfiles in ~"
mkdir -p $olddir
echo "...done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks
echo "Moving any existing dotfiles from ~ to $olddir"
for file in $files; do
    if [ -f ~/.$file ]; then
        mv ~/.$file $olddir/
    fi
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done

install_zsh () {
# Test to see if zshell is installed.  If it is:
if [ -f /bin/zsh -o -f /usr/bin/zsh ]; then
    # Clone my oh-my-zsh repository from GitHub only if it isn't already present
    if [[ ! -d $dir/oh-my-zsh/ ]]; then
        git clone http://github.com/robbyrussell/oh-my-zsh.git
    fi
    # Set the default shell to zsh if it isn't currently set to zsh
    if [[ ! $(echo $SHELL) == $(which zsh) ]]; then
        chsh -s $(which zsh)
    fi
else
    # If zsh isn't installed, get the platform of the current machine
    platform=$(uname);
    # If the platform is Linux, try an apt-get to install zsh and then recurse
    if [[ $platform == 'Linux' ]]; then
        if [[ -f /etc/redhat-release ]]; then
            sudo yum install zsh
            install_zsh
        fi
        if [[ -f /etc/debian_version ]]; then
            sudo apt-get install zsh
            install_zsh
        fi
        if [[ -f /etc/arch-release ]]; then
            sudo pacman -S zsh
            install_zsh
        fi
    # If the platform is OS X, tell the user to install zsh :)
    elif [[ $platform == 'Darwin' ]]; then
        echo "Please install zsh, then re-run this script!"
        exit
    fi
fi
}

config_sublime () {
sublime_path=.config/sublime-text-3/Packages/User
# Test to see if sublime-text-3 is installed.  If it is:
if [ -d ~/$sublime_path ]; then
    # If it has already been configured with a symlink
    if [ -L ~/$sublime_path ]; then
        echo "Sublime was already configured."
        exit
    else
        # Backup old files
        echo "Moving any Sublime preferences from ~/$sublime_path to $olddir/"
        mkdir -p $olddir/$sublime_path
        mv ~/$sublime_path/* $olddir/$sublime_path
        rmdir ~/$sublime_path
        # Linking Sublime packages and preferences to the config folder
        echo "Creating symlink to ~/$sublime_path from $dir directory."
        ln -s $dir/sublime/User/ ~/$sublime_path
        echo "Sublime was successfully configured."
        exit
    fi
else
    echo "Please install Sublime Text 3 and its Package manager, then re-run this script!"
    exit
fi
}

config_sublime
install_zsh
