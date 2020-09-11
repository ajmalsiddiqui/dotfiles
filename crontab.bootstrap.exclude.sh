#!/bin/bash

# Setup a crontab for me!

# This script adds all the cronjobs listed here to the existing crontab (and so hopefully avoids any major damage)

# TODO add logic to ensure that you don't add a cron that already exists

. "$( pwd )/utils.exclude.sh"

PROMPT='[ CronBootstrapper ]'

crons=(
  "0 12 * * MON cd $HOME/dotfiles && git push origin master"
)

echo_crons() {
  # The ${myarray{@} syntax expands to all the elements in the array
  for cron in "${crons[@]}" ; do
    echo "$cron"
  done
}

add_to_crontab() {
  # the stuff in paranthesis executes in a subshell btw...
  # The redirection to /dev/null is needed to avoid the
  # "No crontab for user..." error message 
  # ref: https://stackoverflow.com/questions/4880290/how-do-i-create-a-crontab-through-a-script
  (crontab -l 2>/dev/null ; echo_crons) | crontab -
}

add_to_crontab

echo_with_prompt "Updated the crontab!"
