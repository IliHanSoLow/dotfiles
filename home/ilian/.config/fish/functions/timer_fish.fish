function timer_fish
    set start (math (date +%s) + $argv[1])
    while test $start -ge (date +%s)
        set time (math $start - (date +%s))
        printf '%s\r' (date -u -d "@$time" +%H:%M:%S)
        sleep 0.1
    end
end

