
function __fish_colcon_complete
    set -x _ARGCOMPLETE 1
    set -x _ARGCOMPLETE_DFS \t
    set -x _ARGCOMPLETE_IFS \n
    set -x _ARGCOMPLETE_SUPPRESS_SPACE 1
    set -x _ARGCOMPLETE_SHELL fish
    set -x COMP_LINE (commandline -p)
    set -x COMP_POINT (string length (commandline -cp))
    set -x COMP_TYPE
    if set -q _ARC_DEBUG
        colcon 8>&1 9>&2 1>&9 2>&1
    else
        colcon 8>&1 9>&2 1>/dev/null 2>&1
    end
end
complete --command colcon -f -a '(__fish_colcon_complete)'
