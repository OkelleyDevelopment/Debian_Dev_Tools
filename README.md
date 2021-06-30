# Dev Tools

## Motivation

Manual installs of tools that are commonly used in a development environment becomes cumbersome
and can cause tools to be forgotten between installs. With this bash script automating the process,
all the tools will be installed and ready to go!

This projects goal is to eventually have installation scripts for the most common tools for all
Linux distributions, though currently we only support Ubuntu/Debian based distros.

## Prerequisites

1. Must have an internet connection to install the tools.
2. Must have cURL installed for the bash commands below
3. If you do not feel safe running scripts off the internet, the simply proceed to [Manual install](#Manual-Install)

## Fancy one-liners

For those that trust this script, you can copy the whole line for each command:

```sh
bash <(curl -s https://raw.githubusercontent.com/OkelleyDevelopment/Dev_Tools/master/dev_tools.sh)

bash <(curl -s https://raw.githubusercontent.com/OkelleyDevelopment/Dev_Tools/master/qol.sh)
```

## Manual Install

Assuming correct permissions once you clone the repository or run a `wget` (using the GitHub links above):

```
./dev_suite.sh

./qol.sh
```

If permissions are incorrect, then run:

```
chmod 755 <dev_suite || qol>.sh
```

## Project Structure

After updating your system, the script will then allow you to install:

### Languages

- default-jdk
- Java 11
- Rust

### Dev Tools

- GIT
- NodeJS
- Pip3
- neofetch
- NeoVim --> optionally install [OkelleyDevelopment Nvim config](https://github.com/OkelleyDevelopment/Nvim-Config)
- xClip

### Q.O.L (Quality of Life)

- Discord -- official debian package
- Spotify -- official repository
- Brave browser -- official repository

## Future Goals

- Add a small yes/no gathering for which tools to install saving space for unwanted software.
- Convert this script for Arch based distros

## Contributions

If you would like to add to any script present, or add an entirely new one simply make
a new branch and then submit a pull request. This will allow us to review the code to ensure
all scripts are safe before adding new software/features.
