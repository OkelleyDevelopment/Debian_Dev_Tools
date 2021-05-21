#!/bin/bash
#  A script to install common programming languages that may not be pre-installed on
#  Linux distributions 
#  
# Author: Nicholas O'Kelley
# Date: May 21, 2021 
# Last Modified: May 21, 2021
#

get_java() {
    sudo apt install openjdk-11-jre-headless 
    apt install default-jdk-headless
}

get_rust() {
    # Found here: https://www.rust-lang.org/tools/install
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh

    # TODO: add the export for the rust cargo stuff
}

get_java

get_rust
