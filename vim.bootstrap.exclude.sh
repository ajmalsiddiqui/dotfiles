#!/usr/bin/env bash

# Bootstrap a few things (install plugins and stuff) for vim config

source utils.exclude.sh

PROMPT='[ VimBootstrapper ]'

echo_with_prompt "Installing the color scheme"
mkdir -p ~/.vim/colors
curl https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim > ~/.vim/colors/molokai.vim

# Initialize plugins
echo_with_prompt "Initializing plugin submodules"
git submodule update --init

# Generate the helptags for all plugins
echo_with_prompt "Generating helptags for everything"
vim -c "helptags ALL" -c q

echo_with_prompt "Done!"

