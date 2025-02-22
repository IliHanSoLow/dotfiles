#!/bin/sh

run() {
    if ! pgrep -f "$1"; then
        "$@" &
    fi
}

# run /home/ilian/.config/awesome/scripts/wallpaper

run "picom"
run "Thunar --daemon"
run "mpd"
run "cbatticon"
run "poweralertd"
