#!/usr/bin/env bash

# Get the current layer of the focused window
current_layer=$(bspc query -T -n | jq -r '.client.layer')

# Decide action based on the argument
case $1 in
    increase)
        case $current_layer in
            "normal")
                bspc node -l above
                ;;
            "below")
                bspc node -l normal
                ;;
        esac
        ;;
    decrease)
        case $current_layer in
            "normal")
                bspc node -l below
                ;;
            "above")
                bspc node -l normal
                ;;
        esac
        ;;
esac
