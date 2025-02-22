function fish_greeting
    # if test $LINES -lt 28 -o $COLUMNS -lt 153
    #     return
    # end
    if test "$TERM" = "xterm-kitty" && test "$ZELLIJ" != 0
        kitten icat --align left "/home/ilian/Pictures/Wallpapers/nix-glow-black.png"
    else
        command cat ~/.config/fish/functions/cat.txt
    end
    # neofetch
    # set_color blue; echo " Distro:  NixOS"
    set_color white; echo " Langs:   Rust  Zig  Go  JS 󰛦 TS  Python  Lua  Wasm  Ocaml"
    set_color green; echo " Shell:  󰈺 Fish"
    # set_color yellow; echo "󰟶 Mood:   👨‍💻"
    set_color cyan; figlet random -f binary
    # clear
end
