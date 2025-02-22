#!/usr/bin/env bash
link_files () {
	
	read -p "Do you want to delete /${1} and all its subdirs (y/n)" confirmation
	if [[ "$confirmation" == "y" ]]; then
		rm -rf /${1}
		ln -s ${PWD}/${1} /${1}
	else
		echo "cancled process"
	fi
}

export -f link_files
find home/ilian/ -mindepth 1 -maxdepth 1 \( ! -name ".config" \) -exec bash -c 'link_files {}' \;
find home/ilian/.config -mindepth 1 -maxdepth 1 -exec bash -c 'link_files {}' \;
