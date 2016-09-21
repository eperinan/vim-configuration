#!/bin/bash

GIT=$(which git)
VIM=$(which vim)
CP=$(which cp)
RM=$(which rm)
MKDIR=$(which mkdir)

VIM_PATH="${HOME}/.vim"

VUNDLE_GITHUB="https://github.com/VundleVim/Vundle.vim.git"
VUNDLE_VIM_PATH="${HOME}/.vim/bundle/Vundle.vim"

if [ -z $GIT ]; then
    echo "Error: Git needs to be installed"
    exit 1
fi

if [ -z $VIM ]; then
    echo "Error: Vim needs to be installed"
    exit 1
fi

# Create vim directory structure
if [ ! -d $VIM_PATH ]; then
    echo "Creating .vim directories..."
    $MKDIR $VIM_PATH
    $MKDIR "${VIM_PATH}/colors"
    $MKDIR "${VIM_PATH}/bundle"
else
    echo "Warning: Directory .vim already exist"
fi

# Get vundle
if [ ! -d "$VUNDLE_VIM_PATH" ]; then
    echo "Downloading vundle..."
    $GIT clone --quiet $VUNDLE_GITHUB $VUNDLE_VIM_PATH
fi

# Copy vimrc to home
$CP ./vimrc ${HOME}/.vimrc

# Install Vundle plugins
echo "Installing plugins...."
$VIM +PluginInstall +qall

echo "Done!"
echo "Your vim is ready to use"