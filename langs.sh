#!/bin/bash
#  A script to install common programming languages that may not be pre-installed on
#  Linux distributions 
#  
# Author: Nicholas O'Kelley
# Date: May 21, 2021 
# Last Modified: June 17, 2021
#

get_java() {
    sudo apt install openjdk-11-jre-headless 
    sudo apt install default-jdk-headless
}

get_rust() {
    clear
    # Found here: https://www.rust-lang.org/tools/install
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    source $HOME/.cargo/env
}

get_flex_buildEssential() { \
    sudo apt install flex;
    sudo apt install build-essential;
}

echo "Install Java 11? (y/n) > "
read java

echo "Install Rust lang? (y/n) > "
read answer


# Install Java
if [ "$java" == 'y' ]; then
    get_java
fi

# Install Rust
if [ "$answer" == 'y' ]; then
    get_flex_buildEssential
    get_rust
fi

exit 0
