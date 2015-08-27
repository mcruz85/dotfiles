#!/bin/bash

############################
# This script creates symlinks from the home directory to any desired dotfiles in ~/dotfiles
############################


####### Variables

dir=~/dotfiles
olddir=~/dotfiles
files="bashrc vimrc"

#######


# create dotfiles in homedir
echo -n "Creatind $olddir for backup of anything in ~ ..."
mkdir -p $olddir
echo "done"

# change to the dotfiles directory
echo "Changing to the $dir directory"
cd $dir
echo "...done"

# move any existing dotfiles in homedir to dotfiles_old directory, then create symlinks 
for file in $files; do
    echo "Moving any existing dotfiles from ~ to $olddir"
    mv ~/.$file ~/dotfiles_old/
    echo "Creating symlink to $file in home directory."
    ln -s $dir/$file ~/.$file
done
