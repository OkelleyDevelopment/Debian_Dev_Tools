#!/bin/bash
#  A script to install common developer tools on a (Currently) debian based Linux Distros
#  
# Author: Nicholas O'Kelley
# Date: Aug 6, 2020
# Last Modified: Jun 17, 2021
#

set -o nounset # error when reference to undefined variables
set -o errexit # error out of the script

system_update() { \
    echo "Updating the system..."
    sudo apt-get update && sudo apt-get upgrade
    echo "Done."
}

system_cleanup() { \
    echo 'Updating and Cleaning Unnecessary Packages'
    sudo -- sh -c 'apt-get update; apt-get upgrade -y; apt-get full-upgrade -y; apt-get autoremove -y; apt-get autoclean -y'
    clear
}

get_curl() { \
    echo "Installing curl"
    sudo apt-get install curl -y
}

get_xClip() { \ 
    echo "Installing xClip for clipboard via CLI"
    sudo apt-get install xclip -y
}

prompt_git() { \
    echo "Installing git"
    sudo apt-get install git -y
    clear
}

config_git() { \
    echo "Before we continue, what name would you like to use in GIT user.name?"
    read git_config_user_name

    echo "What email would you like to use for GIT user.email?"
    read git_config_user_email

    git config --global user.name "$git_config_user_name"
    git config --global user.email $git_config_user_email
}

get_neovim(){ \
    echo "Installing neovim"
    sudo apt-get install neovim -y
}

get_neovim_config() { \
    echo "Pulling neovim config install script."
    bash <(curl -s https://raw.githubusercontent.com/OkelleyDevelopment/Nvim-Config/master/util/install.sh)
}

promptNode() {\

    echo "NodeJS not found, installing ... "
    curl -fsSL https://fnm.vercel.app/install | bash
    [ -n "$(uname -a | grep Ubuntu)" ] && installnodeubuntu
    echo "Done."
}

installnodeubuntu(){ \
    sudo apt install nodejs -y
    sudo apt install npm -y
    mkdir ~/.npm-global
    npm config set prefix '~/.npm-global'
    echo export PATH=~/.npm-global/bin:$PATH >> ~/.profile;  
    source ~/.profile
}

promptPipInstall() { \
    echo "pip3 not found, installing ..."
    sudo apt install python3-pip -y
    echo "Done."
}

# Welcome message
echo "Welcome to the Development Tool Suite"

# Update the system
system_update

# Set up GIT VCS
which git > /dev/null || prompt_git
# set up user
config_git

# Install pip3 
which pip3 > /dev/null && echo "pip3 installed, moving on..." || promptPipInstall

# NodeJS
which node > /dev/null && echo "NodeJS installed, moving on..." || promptNode

# Get NeoVim
get_neovim

# Clipboard toool
get_xClip

# Neofetch
get_neofetch

# Set up neovim
# TODO: This can become a list of configs that allows the user to choose the config
# they install.
echo "Would you like to install OkelleyDevelopment's NeoVim Config? (y/n) > "
read yea_or_nay

if [ "$yea_or_nay" == 'y' ]; then
    get_neovim_config
fi

# Clean up
system_cleanup 

# Clear the screen
clear

echo " "
echo "Initial Setup complete."
echo " "

exit 0;
