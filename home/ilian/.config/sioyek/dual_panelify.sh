#!/usr/bin/env bash
nix-shell --run "pdfjam --nup 2x1 --landscape $1 --outfile /home/ilian/.config/sioyek/converted_files/$2" /home/ilian/.config/sioyek/dual_panelify/shell.nix
echo /tmp/$2
sioyek --execute-command open "/home/ilian/.config/sioyek/converted_files/$2"
