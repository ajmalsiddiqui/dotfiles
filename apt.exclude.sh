#!/usr/bin/env bash

# Install my favourite tools using the apt package manager (currently tested only on Debian buster)

PROMPT='[apt-install]'

echo "$PROMPT I hope you're running this script as root!"


# Update apt
apt update -y

# Upgrade any preinstalled packages
apt upgrade -y


# ---------------------------------------------
# Basic Utilities
# ---------------------------------------------

# This installs dig, among other things
apt install dnsutils -y


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

# Docker Compose
apt install docker-compose -y

# Vim B)
apt install vim-gtk -y

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
 
