#!/bin/sh
gitst_rm(){
	if [ -d ".git" ]; then
		echo """[bash-it]
		hide-status = 1""" >> .git/config
		git config --edit
	else
		>&2 echo "Nicht in einem git repo"
	fi
}
