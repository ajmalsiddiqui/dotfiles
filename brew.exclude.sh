#!/usr/bin/env bash

# Install command-line tools using Homebrew.

. "$( pwd )/utils.exclude.sh"

# Install homebrew if it is not installed
which brew 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
	echo_with_prompt "Homebrew not installed. Attempting to install Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	if [ ! "$?" -eq 0 ] ; then
		echo_with_prompt "Something went wrong. Exiting..." && exit 1
	fi
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade


# ---------------------------------------------
# Basic Utilities
# ---------------------------------------------

# Core Utils
brew install coreutils


# ---------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------

# NodeJS 
brew install node

# Python 3
brew install python

# Golang
brew install go

# Clojure
brew install clojure/tools/clojure


# ---------------------------------------------
# Tools I use often
# ---------------------------------------------

# Yarn - an alternative to npm
brew install yarn

# Docker for containerization
brew install docker

# htop
brew install htop

# Make requests with awesome response formatting
brew install httpie

# Show directory structure with excellent formatting
brew install tree

# tmux :'D 
brew install tmux

# gdb
brew install gdb


# ---------------------------------------------
# Misc
# ---------------------------------------------

# Zsh 
brew install zsh

# The Fire Code font
# https://github.com/tonsky/FiraCode
# This method of installation is
# not officially supported, might install outdated version
# Change font in terminal preferences
brew tap caskroom/fonts
brew cask install font-fira-code


# ---------------------------------------------
# Terminal gimmicks xD
# ---------------------------------------------

# The computer fortune teller 
brew install fortune

# The famous cowsay
brew install cowsay

# Multicolored text output
brew install lolcat


# Remove outdated versions from the cellar
brew cleanup
