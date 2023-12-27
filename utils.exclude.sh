#!/usr/bin/env bash

# Utility functions that the other dotfile related scripts will use
# Note that this stuff isn't supposed to be used by the dotfiles themselves, just by the stuff that helps manage/bootstrap them
# LOL looks like a framework is surfacing... xD

echo_with_prompt () {
  # The narcissistic default prompt
  DOTFILES_PROMPT="${DOTFILES_PROMPT:-'[ AjmalsDotfiles ]'}"
  echo "$DOTFILES_PROMPT $@"
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

# Function to ensure needed binaries are installed
test-bins () {
    echo_with_prompt "Making sure required commands are installed..."

    for bin in $@ ; do
        which $bin || { echo_with_prompt "Command $bin not found, please install it to continue" ; return 1 ; }
    done

    echo_with_prompt "All good!"
}

