# Dev Tools

## Motivation

Manual installs of tools that are commonly used in a development environment becomes cumbersome
and can cause tools to be forgotten between installs. With this bash script automating the process,
all the tools will be installed and ready to go!

## Prerequisites

1. Must have an internet connection to install the tools.
2. Must have cURL installed for the bash commands below

## Fancy one-liners

For those that trust this script, you can
copy the whole line for each command:

```sh
bash <(curl -s https://raw.githubusercontent.com/OkelleyDevelopment/Dev_Tools/master/dev_tools.sh)

bash <(curl -s https://raw.githubusercontent.com/OkelleyDevelopment/Dev_Tools/master/qol.sh)
```

## Manual Install

Assuming correct permissions once you clone the repository or run a wget:

```
./dev_suite.sh

./qol.sh
```

If permissions are incorrect, then run:

```
chmod 755 <dev_suite | qol>.sh
```

## Future Goals

- Add a small yes/no gathering for which tools to install saving space for unwanted software.
- Convert this script for Arch based distros

## Installed Tools

After updating your system, the script will then install:

### Dev Suite

- GIT
- NodeJS
- Pip3
- neofetch
- NeoVim
- xClip
- Java 11 and default-jdk

### Q.O.L (Quality of Life)

- Discord -- official debian package
- Spotify -- official repository
- Brave browser -- offical repository
