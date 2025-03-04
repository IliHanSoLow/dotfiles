#!/usr/bin/env sh

# ScrDir=`dirname "$(realpath "$0")"`
# source $ScrDir/globalcontrol.sh

function print_error
{
cat << "EOF"
    ./brightnesscontrol.sh <action>
    ...valid actions are...
        i -- <i>ncrease brightness [+5%]
        d -- <d>ecrease brightness [-5%]
EOF
}

function send_notification {
    brightness=`brightnessctl info | grep -oP "(?<=\()\d+(?=%)" | cat`
    brightinfo=$(brightnessctl info | awk -F "'" '/Device/ {print $2}')
    dunstify "t2" -i -a "$brightness %" "$brightinfo" -r 91190 -t 800
}

function get_brightness {
    brightnessctl -m | grep -o '[0-9]\+%' | head -c-2
}

case $1 in
i)  # increase the backlight
    if [[ $(get_brightness) -lt 10 ]] ; then
        # increase the backlight by 1% if less than 10%
        brightnessctl set +1%
        brightnessctl -d amdgpu_bl1 set +1%
    else
        # increase the backlight by 5% otherwise
        brightnessctl set +5%
        brightnessctl -d amdgpu_bl1 set +5%
    fi
    send_notification ;;
d)  # decrease the backlight
    if [[ $(get_brightness) -le 1 ]] ; then
        # avoid 0% brightness
        brightnessctl set 1%
        brightnessctl -d amdgpu_bl1 set set 1%
    elif [[ $(get_brightness) -le 10 ]] ; then
        # decrease the backlight by 1% if less than 10%
        brightnessctl set 1%-
        brightnessctl -d amdgpu_bl1 set 1%-
    else
        # decrease the backlight by 5% otherwise
        brightnessctl set 5%-
        brightnessctl -d amdgpu_bl1 set 5%-
    fi
    send_notification ;;
*)  # print error
    print_error ;;
esac

