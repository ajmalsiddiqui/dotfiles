export PATH="$HOME/bin:$PATH"

# Source this first since it contains the locations of directories needed by funcitons
source "$HOME/.exports"
source "$HOME/.functions"
source "$HOME/.aliases"

# This should be the last line of the file
# For local changes
# Don't make edits below this
[ -f ".bash_profile.local" ] && source ".bash_profile.local"
