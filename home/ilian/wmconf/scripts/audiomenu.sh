#!/bin/sh
nix run ~/.config/awesome/scripts/audiomenu/ -- --menu 'rofi -dmenu -i -theme rounded_nord' select-sink
