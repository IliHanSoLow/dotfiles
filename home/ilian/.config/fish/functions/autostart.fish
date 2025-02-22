function autostart
    pypr & \
    swww-daemon & \
    # swww img /bigssd/Bilder/Anime/ZeroTwoTriangle.png & \
    # swww img /bigssd/Bilder/wallpaper/smooth_pengernal.jpg & \
    swww img "/bigssd/Bilder/wallpaper/skeletonFestival.png" & \
    waybar & \
    poweralertd & \
    wl-paste --watch cliphist store & \
    avizo-service & \
    systemctl --user start psi-notify &\
    swayidle -w &\
    mpd
end
