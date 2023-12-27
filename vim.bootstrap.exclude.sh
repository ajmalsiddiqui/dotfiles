#!/usr/bin/env bash

# Bootstrap a few things (install plugins and stuff) for vim config

set -e

# Note that sh doesn't have source (but does support . )
# And I guess the absolute path is needed when executing via sh
. "$( pwd )/utils.exclude.sh"

DOTFILES_PROMPT='[ VimBootstrapper ]'

test-bins vim

VIM_PLUGINS_DIR="$HOME/.vim/pack/plugins/start"

echo_with_prompt "Installing the color scheme"
mkdir -p ~/.vim/colors
curl https://raw.githubusercontent.com/tomasr/molokai/master/colors/molokai.vim > ~/.vim/colors/molokai.vim

# TODO figure out a cleaner way to do this
echo_with_prompt "Installing the vim plugin for fzf..."
mkdir -p "$VIM_PLUGINS_DIR/fzf/plugin"
curl https://raw.githubusercontent.com/junegunn/fzf/master/plugin/fzf.vim > "$VIM_PLUGINS_DIR/fzf/plugin/fzf.vim"

# Initialize plugins
echo_with_prompt "Initializing plugin submodules"
git submodule update --init

# Generate the helptags for all plugins
echo_with_prompt "Generating helptags for everything"
vim -c "helptags ALL" -c q

echo_with_prompt "Done!"

