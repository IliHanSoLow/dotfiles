
function __fish_rosidl_complete
    set -x _ARGCOMPLETE 1
    set -x _ARGCOMPLETE_DFS \t
    set -x _ARGCOMPLETE_IFS \n
    set -x _ARGCOMPLETE_SUPPRESS_SPACE 1
    set -x _ARGCOMPLETE_SHELL fish
    set -x COMP_LINE (commandline -p)
    set -x COMP_POINT (string length (commandline -cp))
    set -x COMP_TYPE
    if set -q _ARC_DEBUG
        rosidl 8>&1 9>&2 1>&9 2>&1
    else
        rosidl 8>&1 9>&2 1>/dev/null 2>&1
    end
end
complete --command rosidl -f -a '(__fish_rosidl_complete)'
