#!/bin/sh

# Define options
options=("Hyrpland" "BSPWM" "Awesome" "Ragnar")

# Prompt user to select an option using fzf
selected_option=$(printf '%s\n' "${options[@]}" | fzf)

# Check selected option and perform corresponding action
case "$selected_option" in
    "Hyrpland")
        Hyprland
        ;;
    # "Ragnar")
    #     cp ~/wmconf/ragnar.conf ~/.xinitrc
    #     startx
    #     ;;
    "Awesome")
        cp ~/wmconf/awesome.conf ~/.xinitrc
        startx
        ;;
    "BSPWM")
        cp ~/wmconf/bspwm.conf ~/.xinitrc
        startx
        ;;
    *)
        echo "Invalid option selected"
        ;;
esac
