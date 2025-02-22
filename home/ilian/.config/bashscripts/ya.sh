ya() {
    local tmp=$(mktemp -t "yazi-cwd.XXXXX")
    yazi "$@" --cwd-file="$tmp"
    local cwd=$(cat "$tmp")
    if [[ -n "$cwd" && "$cwd" != "$PWD" ]]; then
        cd "$cwd"
    fi
    rm -f "$tmp"
}

