import schedules, times, os

discard os.execShellCmd("nitrogen --head=0 --set-zoom --random /bigssd/Bilder/currentWallpapers --save")
discard os.execShellCmd("nitrogen --head=1 --set-zoom --random /bigssd/Bilder/currentWallpapers --save")
schedules:
    cron(minute="*/5", hour="*", day_of_month="*", month="*", day_of_week="*", id="tick"):
        discard os.execShellCmd("nitrogen --head=0 --set-zoom --random /bigssd/Bilder/currentWallpapers --save")
        discard os.execShellCmd("nitrogen --head=1 --set-zoom --random /bigssd/Bilder/currentWallpapers --save")
