#!/bin/sh

echo "Hi"
xautolock -detectsleep -time 5 -locker /home/ilian/.config/awesome/scripts/i3lock.sh&
while true
do
    active_win_id=`xprop -root _NET_ACTIVE_WINDOW`
    echo ${active_win_id:40:9}
    if xprop -id ${active_win_id:40:9} | grep -q _NET_WM_STATE_FULLSCREEN;then
        killall xautolock
        xautolock -detectsleep -time 5 -locker /home/ilian/.config/awesome/scripts/i3lock.sh &
        echo "RESTART"
    fi
    sleep 290
done
