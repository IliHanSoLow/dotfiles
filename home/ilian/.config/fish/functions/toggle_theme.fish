#!/usr/bin/env fish

function toggle_theme
    if test $COLOR_THEME = "light"
        set -xU COLOR_THEME "dark"
        kitten themes --reload-in=all Catppuccin Kitty Macchiato
    else
        set -xU COLOR_THEME "light"
        kitten themes --reload-in=all Catppuccin Kitty Latte
    end
end
