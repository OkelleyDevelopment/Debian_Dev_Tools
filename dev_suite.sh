#!/bin/bash

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

get_neofetch() { \
    echo "Installing neofetch"
    sudo apt-get install neofetch -y
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

get_Discord() { \ 
    echo 'Installing Discord'
    wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
    sudo dpkg -i discord.deb
    sudo apt-get install -f -y && rm discord.deb
}

get_Spotify() {
    sudo snap install spotify
}

prompt_snap(){
    echo "Installing snapd"
    sudo apt-get install snapd
}

get_neovim(){ \
    echo "Installing neovim"
    sudo apt-get install neovim -y
}

get_neovim_config() { \
    echo "Pulling neovim config install script."
    bash <(curl -s https://raw.githubusercontent.com/OkelleyDevelopment/Nvim-Configs/installScript/util/nvim_install.sh)
}

promptNode() {\
    echo "NodeJS not found, installing ... "
    sudo apt install nodejs -y
    sudo apt install npm -y
    echo "Done."
}

promptPipInstall() { \
    echo "pip3 not found, installing now ..."
    sudo apt install python3-pip -y
    echo "Done."
}

# Welcome message
echo "Welcome to the Ubuntu DevSuite"

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



# Neofetch
get_neofetch

# Get NeoVim
get_neovim

# Clipboard toool
get_xClip

# Check for snapd
which snap > /dev/null || prompt_snap

# Install discord
get_Discord

# Spotify for the tunes
get_Spotify

# Set up neovim
echo "Would you like to install OkelleyDevelopment's NeoVim Config? (y or n)"
read yea_or_nay

if [ yea_or_nay == 'y' ]
then
    get_neovim_config
fi

# Clean up
system_cleanup

neofetch
