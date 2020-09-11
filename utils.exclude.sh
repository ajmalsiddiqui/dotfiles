#!/usr/bin/env bash

# Utility functions that the other dotfile related scripts will use
# Note that this stuff isn't supposed to be used by the dotfiles themselves, just by the stuff that helps manage/bootstrap them
# LOL looks like a framework is surfacing... xD

echo_with_prompt () {
  # The narcissistic default prompt
  PROMPT="${PROMPT:-'[ AjmalsDotfiles ]'}"
  echo "$PROMPT $@"
}

execute_func_with_prompt() {
  # Args
  # $1 - the function to call
  # $2 - the thing this function does
  # Returns 1 if the user cancels the operation
  # Returns 2 if the function failed
  # Returns 0 if all went well

  # TODO this feels like a hack honestly :p
  # See if there is a better way than just "$1" the function
 
	echo_with_prompt "This utility will $2"
	echo_with_prompt "Proceed? (y/n)"
	read resp
	# TODO - regex here?
	if [ "$resp" = 'y' -o "$resp" = 'Y' ] ; then
    # This thing here "calls" the function
    "$1" || return 2
		echo_with_prompt "$2 complete"
	else
		echo_with_prompt "$2 cancelled by user"
    return 1
	fi
}

function get_os() {
  local os=''
	if [ $( echo "$OSTYPE" | grep 'darwin' ) ] ; then
    os='darwin'
  elif [ $( echo "$OSTYPE" | grep 'linux-gnu' ) ] ; then
    # This file contains all the details you need!
    source /etc/os-release
    # Set os to ID_LIKE if this field exists
    # Else default to ID
    # ref. https://www.freedesktop.org/software/systemd/man/os-release.html#:~:text=The%20%2Fetc%2Fos%2Drelease,like%20shell%2Dcompatible%20variable%20assignments.
    os="${ID_LIKE:-$ID}"
  else
    os='unknown'
  fi
  # Also set an env var based on this
  export DETECTED_OS="$os"
  # This is how you "return" a value when using function apparently :3
  echo "$os"
}

