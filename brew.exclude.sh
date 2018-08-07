#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Install homebrew if it is not installed
which brew 1>&/dev/null
if [ ! "$?" -eq 0 ] ; then
	echo "Homebrew not installed. Attempting to install Homebrew"
	/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
	if [ ! "$?" -eq 0 ] ; then
		echo "Something went wrong. Exiting..." && exit 1
	fi
fi

# Make sure we’re using the latest Homebrew
brew update

# Upgrade any already-installed formulae
brew upgrade


# ---------------------------------------------
# Programming Languages and Frameworks
# ---------------------------------------------

# NodeJS 
brew install node

# Python 3
brew install python


# ---------------------------------------------
# Tools I use often
# ---------------------------------------------

# Heroku 
brew install heroku

# Yarn - an alternative to npm
brew install yarn

# Docker for containerization
brew install docker


# ---------------------------------------------
# Database Systems I use Often
# ---------------------------------------------

# MongoDB :D
brew install mongo

# RedisDB
brew install redis


# ---------------------------------------------
# Useful tools
# ---------------------------------------------

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

# My favorite text editor
brew cask install visual-studio-code


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
