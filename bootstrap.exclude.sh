#!/bin/bash

source utils.exclude.sh

PROMPT='[ Bootstrap ]'

source .exports

# Initialize a few things
init () {
  echo_with_prompt "Making a Projects folder in $PATH_TO_PROJECTS if it doesn't already exist"
	mkdir -p "$PATH_TO_PROJECTS"
	echo_with_prompt "Making a Playground folder in $PATH_TO_PLAYGROUND if it doesn't already exist"
	mkdir -p "$PATH_TO_PLAYGROUND"
}

# TODO : Delete symlinks to deleted files
# Is this where rsync shines?
# TODO - add support for -f and --force
link () {
	echo_with_prompt "This utility will symlink the files in this repo to the home directory"
	echo_with_prompt "Proceed? (y/n)"
	read resp
	# TODO - regex here?
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
		for file in $( ls -A | grep -vE '\.exclude*|\.git$|\.gitignore|\.gitmodules|.*.md' ) ; do
			ln -sv "$PWD/$file" "$HOME"
		done
		# TODO: source files here?
		echo_with_prompt "Symlinking complete"
	else
		echo_with_prompt "Symlinking cancelled by user"
		return 1
	fi
}

install_tools () {
	if [ $( echo "$OSTYPE" | grep 'darwin' ) ] ; then
		echo_with_prompt "Detected macOS"
		echo_with_prompt "This utility will install useful utilities using Homebrew"
		echo_with_prompt "Proceed? (y/n)"
		read resp
		# TODO - regex here?
		if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
			echo_with_prompt "Installing useful stuff using brew. This may take a while..."
			sh brew.exclude.sh
		else
			echo_with_prompt "Brew installation cancelled by user"
		fi
	else
		echo_with_prompt "Skipping installations using Homebrew because MacOS was not detected..."
	fi

	if [ $( echo "$OSTYPE" | grep 'linux-gnu' ) ] ; then
		echo_with_prompt "Detected Linux"
		echo_with_prompt "This utility will install useful utilities using apt (this has been tested on Debian buster)"
		echo_with_prompt "Proceed? (y/n)"
		read resp
		# TODO - regex here?
		if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
			echo_with_prompt "Installing useful stuff using apt. This may take a while..."
			sh apt.exclude.sh
		else
			echo_with_prompt "Apt installation cancelled by user"
		fi
	else
		echo_with_prompt "Skipping installations using apt because Debian/Linux was not detected..."
	fi
}

bootstrap_vim() {
	echo_with_prompt "This utility will bootstrap vim with plugins and the like"
	echo_with_prompt "Proceed? (y/n)"
	read resp
	# TODO - regex here?
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    sh vim.bootstrap.exclude.sh
		echo_with_prompt "Vim bootstrapping complete"
	else
		echo_with_prompt "Vim bootstrapping cancelled by user"
	fi
}

init
link
install_tools
bootstrap_vim
