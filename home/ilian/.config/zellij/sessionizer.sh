#!/usr/bin/env bash

paths=(
    "/bigssd/Dokumente/git"
    "/bigssd/Dokumente/Q11"
)

# Function to find Git directories and list them with fzf
find_git_dirs() {
    fd . $1 --min-depth 1 --max-depth 2 --type d
}
export -f find_git_dirs

selected_path=$(parallel find_git_dirs ::: "${paths[@]}" |fzf)

if [[ -z $selected_path ]]; then
    exit 0
fi

# Get the name of the selected directory, replacing "." with "_"
session_name=$(basename "$selected_path" | tr . _)

# We're outside of zellij, so lets create a new session or attach to a new one.
if [[ -z $ZELLIJ ]]; then
	cd $selected_path
  
  # -c will make zellij to either create a new session or to attach into an existing one
	zellij attach $session_name -c
	exit 0
fi

# We're inside zellij so we'll open a new pane and move into the selected directory
zellij action new-pane

# Hopefully they'll someday support specifying a directory and this won't be as laggy
# thanks to @msirringhaus for getting this from the community some time ago!
zellij action write-chars "cd $selected_path" && zellij action write 10
