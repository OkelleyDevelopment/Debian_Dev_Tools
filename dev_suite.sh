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

get_xClip() {\ 
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
    echo "Before we continue, what name would you like to us in GIT user.name?"
    read git_config_user_name

    echo "What email for GIT?"
    read git_config_user_email

    echo "What is your github username?"
    read username

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

get_Zoom() { \
    echo 'Installing Zoom'
    wget -c https://zoom.us/client/latest/zoom_amd64.deb
    sudo dpkg -i zoom_amd64.deb
    sudo apt-get install -f -y && rm zoom_amd64.deb
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

# Welcome message
echo "Welcome to the Ubuntu DevSuite"

# Update the system
system_update

# Set up GIT VCS
which git > /dev/null || prompt_git
# set up user
config_git

# Get curl
#get_curl

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

# Install Zoom (ew)
get_Zoom

# Spotify for the tunes
get_Spotify

# Set up neovim
get_neovim_config

# Clean up
system_cleanup
echo "... This concludes setup. Enjoy :)"

neofetch
