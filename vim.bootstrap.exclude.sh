#!/usr/bin/env bash

# Bootstrap a few things (install plugins and stuff) for vim config

PROMPT='[ VimBootstrapper ]'

echo_with_prompt () {
  echo "$PROMPT $@"
}

echo_with_prompt "Initializing .vim directory"
mkdir -p ~/.vim

echo_with_prompt "Installing the color scheme"
mkdir -p ~/.vim/colors
curl https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim > ~/.vim/colors/molokai.vim

# Install the NERDTree plugin
echo_with_prompt "Installing NERDTree..."
mkdir -p ~/.vim/pack/vendor/start/nerdtree
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
echo_with_prompt "NERDTree has been installed!"

# Install the commentary plugin
echo_with_prompt "Installing Commentary..."
mkdir -p ~/.vim/pack/tpope/start
git clone https://tpope.io/vim/commentary.git ~/.vim/pack/tpope/start/commentary
vim -u NONE -c "helptags ~/.vim/pack/tpope/start/commentary/doc" -c q
echo_with_prompt "Commentary has been installed"

echo_with_prompt "Done!"

