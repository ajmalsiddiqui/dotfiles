#!/bin/bash

set -e

# TODO IMPORTANT: when you bootstrap with sudo, ownership of certain files becomes root
# eg .vim/color, .vim/fzf, etc

. "$( pwd )/utils.exclude.sh"

DOTFILES_PROMPT='[ Bootstrap ]'

source .exports

# Initialize a few things
init () {
  echo_with_prompt "Making a Projects folder in $PATH_TO_PROJECTS if it doesn't already exist"
	mkdir -p "$PATH_TO_PROJECTS"
	echo_with_prompt "Making a Playground folder in $PATH_TO_PLAYGROUND if it doesn't already exist"
	mkdir -p "$PATH_TO_PLAYGROUND"
	echo_with_prompt "Making a Playground folder in $PATH_TO_JOURNAL if it doesn't already exist"
	mkdir -p "$PATH_TO_JOURNAL"
}

download_wallpaper() {
    if [ -z "$WALLPAPER_URL" ] ; then
        echo_with_prompt "WALLPAPER_URL not set, skipping wallpaper setup"
    else
        PROMPT_COLOR=$YELLOW_BOLD echo_with_prompt "Downloading wallpaper from $WALLPAPER_URL to $HOME/wallpaper"
        curl "$WALLPAPER_URL" -o $HOME/wallpaper
        echo_with_prompt "Downloaded wallpaper"
    fi
}

# TODO : Delete symlinks to deleted files
# Is this where rsync shines?
# TODO - add support for -f and --force
link () {
  for file in $( ls -A | grep -vE '\.config|\.exclude*|\.git$|\.gitignore|\.gitmodules|.*.md' ) ; do
    # Silently ignore errors here because the files may already exist
    if [ -f "$HOME/$file" -a ! -L "$HOME/$file" ]; then
        echo_with_prompt "Backing up $HOME/$file as $HOME/$file.bak"
        mv "$HOME/$file" "$HOME/$file.bak"
    fi
    ln -sv "$PWD/$file" "$HOME" || true
  done

  mkdir -p "$HOME/.config"

  # .config contains dotfiles that should be present in XDG_CONFIG_HOME
  pushd "./.config"
  for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|\.gitmodules|.*.md' ) ; do
    # Silently ignore errors here because the files may already exist
    if [ -e "$XDG_CONFIG_HOME/$file" -a ! -L "$XDG_CONFIG_HOME/$file" ]; then
        echo_with_prompt "Backing up $XDG_CONFIG_HOME/$file as $XDG_CONFIG_HOME/$file.bak"
        mv "$XDG_CONFIG_HOME/$file" "$XDG_CONFIG_HOME/$file.bak"
    fi
    ln -sv "$PWD/$file" "$XDG_CONFIG_HOME" || true
  done
  popd
}

bootstrap_vim() {
  # TODO consider sourcing this file
  "$( pwd )/vim.bootstrap.exclude.sh"
}

bootstrap_crontab() {
  # TODO consider sourcing this file
  "$( pwd )/crontab.bootstrap.exclude.sh"
}

test-bins git curl
init
execute_func_with_prompt download_wallpaper "download wallpaper"
execute_func_with_prompt link "symlink everything"
execute_func_with_prompt bootstrap_vim "bootstrap vim with plugins and the like"
execute_func_with_prompt bootstrap_crontab "bootstrap the crontab"

# Hack to make sure this script always exits successfully
# Since the user may choose to cancel a step here and that is cool
# TODO rethink this system :p
true
