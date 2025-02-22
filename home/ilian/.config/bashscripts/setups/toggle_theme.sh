#!/usr/bin/env bash
toggle_theme(){
	if [ "$COLOR_THEME" = "light" ]; then
		export COLOR_THEME=""
		kitten themes --reload-in=all Kanagawa
	else
		export COLOR_THEME="light"
		kitten themes --reload-in=all Catppuccin-Latte
	fi
}
