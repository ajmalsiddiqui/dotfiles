#!/usr/bin/env bash

# Install my favourite tools using the apt package manager (currently tested only on Debian buster)

PROMPT='[apt-install]'

echo "$PROMPT I hope you're running this script as root!"


# Update apt
apt update -y

# Upgrade any preinstalled packages
apt upgrade -y


# ---------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------

# NodeJS 
apt install nodejs -y

# Golang
add-apt-repository ppa:longsleep/golang-backports
apt update -y
apt install golang-go -y


# ---------------------------------------------
# Tools I use often
# ---------------------------------------------

# Git, obviously
apt install git -y

# Docker for containerization
# Official installation instructions: https://docs.docker.com/install/linux/docker-ce/ubuntu/
apt install apt-transport-https ca-certificates curl software-properties-common -y
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable"
apt update -y
apt install docker-ce docker-ce-cli containerd.io -y
echo "$PROMPT Verifying docker installation using a hello world container..."
# Verify the installaiton
docker run hello-world

# Vim B)
apt install vim -y

# Make requests with awesome response formatting
apt install httpie -y

# Show directory structure with excellent formatting
apt install tree -y

# tmux :'D 
apt install tmux -y


# ---------------------------------------------
# Misc
# ---------------------------------------------

# Zsh 
apt install zsh -y
echo "$PROMPT This script (intentionally) does not install the Oh-my-zsh framework. If you want it, install it manually!"

# The Fire Code font
apt install fonts-firacode -y

# My favorite text editor: VS Code
# Installation instructions: https://code.visualstudio.com/docs/setup/linux
curl https://packages.microsoft.com/keys/microsoft.asc | gpg --dearmor > packages.microsoft.gpg
install -o root -g root -m 644 packages.microsoft.gpg /usr/share/keyrings/
sh -c 'echo "deb [arch=amd64 signed-by=/usr/share/keyrings/packages.microsoft.gpg] https://packages.microsoft.com/repos/vscode stable main" > /etc/apt/sources.list.d/vscode.list'
apt install apt-transport-https -y
apt update
apt install code -y
echo "$PROMPT VS Codes adds some GPG key during its install. Removing it!"
rm packages.microsoft.gpg

# ---------------------------------------------
# Terminal gimmicks xD
# ---------------------------------------------

# The computer fortune teller 
apt install fortune -y

# The famous cowsay
apt install cowsay -y

# Multicolored text output -y
apt install lolcat -y


# Cleanup the cache (TODO: set up a cron to do this)
apt clean
 
