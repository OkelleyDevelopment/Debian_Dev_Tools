#!/bin/bash
# A script to install common quality of life apps on 
# (Currently) debian based Linux Distros
#  
# Author: Nicholas O'Kelley
# Date: Aug 6, 2020
# Last Modified: May 14th, 2021
#

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

get_Discord() { \ 
    echo 'Installing Discord'
    wget -O discord.deb "https://discordapp.com/api/download?platform=linux&format=deb"
    sudo dpkg -i discord.deb
    sudo apt-get install -f -y && rm discord.deb
}

get_Spotify() {
    # Pulled this straight from the Spotify Website
    curl -sS https://download.spotify.com/debian/pubkey_0D811D58.gpg | sudo apt-key add - 
    echo "deb http://repository.spotify.com stable non-free" | sudo tee /etc/apt/sources.list.d/spotify.list
    sudo apt-get update && sudo apt-get install spotify-client
}

get_Brave() { \
    # Also sourced from Brave
    sudo apt install apt-transport-https curl gnupg
    curl -s https://brave-browser-apt-release.s3.brave.com/brave-core.asc | sudo apt-key --keyring /etc/apt/trusted.gpg.d/brave-browser-release.gpg add -
    echo "deb [arch=amd64] https://brave-browser-apt-release.s3.brave.com/ stable main" | sudo tee /etc/apt/sources.list.d/brave-browser-release.list
    sudo apt update
    sudo apt install brave-browser
}

# Update the system
system_update

clear

# Welcome message
echo " "
echo "Welcome to the Quality of Life Tools Install"
echo "-----------------"
echo "Discord"
echo "Spotify"
echo "Brave"
echo "-----------------"

echo "Install Discord? (y/n)>"
read yea_or_nay

if [ "$yea_or_nay" == "y" ]; then
    # Install discord
    get_Discord
fi

echo "Install Spotify? (y/n)>"
read yea_or_nay

if [ "$yea_or_nay" == "y" ]; then
    # Spotify for the tunes
    get_Spotify
fi

echo "Install Brave Browser? (y/n)>"
read yea_or_nay

if [ "$yea_or_nay" == "y" ]; then
    # Install Brave browser
    get_Brave
fi


# Clean up apt
system_cleanup > /dev/null

exit 0;
