#!/bin/bash
# A script that follows the commands listed here: https://www.digitalocean.com/community/tutorials/how-to-install-and-use-docker-on-ubuntu-20-04
# Author for this script: Nicholas O'Kelley

sudo apt update && sudo apt upgrade;

# Let's apt use packages over https
sudo apt install apt-transport-https ca-certificates curl software-properties-common

# Add the GPG key for the official Docker repo
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -

# Add docker repo to the APT sources
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"

# Update the apt database
sudo apt update;

# Make sure it is the correct repo
apt-cache policy docker-ce


echo "Should find the Ubuntu 20.04 (focal) under the candidate information."
echo "Ex:  Candidate: 5:19.03.9-3-9-ubuntu-focal"
echo " "
echo "Is this info accurate? (y/n)> "
read reply 

if [ "$reply" != "y" ]; then
    echo "Failed to input valid answer... exitiing.";
    exit 1;
fi 

# Install docker
sudo apt install docker-ce

# Verfity that docker is active
sudo systemctl status docker

echo "You should now see that docker-ce is active."

exit 0;




