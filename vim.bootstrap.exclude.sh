#!/usr/bin/env bash

# Bootstrap a few things (install plugins and stuff) for vim config

PROMPT='[ VimBootstrapper ]'

# Install the NERDTree plugin
echo "$PROMPT Installing NERDTree..."
git clone https://github.com/preservim/nerdtree.git ~/.vim/pack/vendor/start/nerdtree
vim -u NONE -c "helptags ~/.vim/pack/vendor/start/nerdtree/doc" -c q
echo "$PROMPT NERDTree has been installed!"

echo "$PROMPT Done!"

