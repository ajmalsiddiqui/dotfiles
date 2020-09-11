#!/usr/bin/env bash

# Utility functions that the other dotfile related scripts will use
# Note that this stuff isn't supposed to be used by the dotfiles themselves, just by the stuff that manages/bootstraps them
# LOL looks like a framework is surfacing... xD

echo_with_prompt () {
  # The narcissistic default prompt
  PROMPT="${PROMPT:-'[ AjmalsDotfiles ]'}"
  echo "$PROMPT $@"
}

