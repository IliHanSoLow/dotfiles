function stopwatch_fish
    set start (date +%s)
    while true
        set time (math (date +%s) - $start)
        printf '%s\r' (date -u -d "@$time" +%H:%M:%S)
        sleep 0.1
    end
end
