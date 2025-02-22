PROMPT_DIRTRIM=3
PS1="\e[1;34m\A\e[0m \e[1;90m\u@\H\e[0m \e[0;35m\w\e[0m :\e[1;35m\$ \e[0m"
#Vi-Mode
set -o vi
shopt -s autocd

# Example aliases
# alias bashconfig="mate ~/.bashrc"
# alias ohmybash="mate ~/.oh-my-bash"
export LS_COLORS="$(vivid generate catppuccin-macchiato)"
# eval "$(dircolors -b ~/.dir_colors)"

# GREETER
if [[ $- == *i* ]]; then  # Check if it's an interactive shell
	if [ "$TERM" = "xterm-kitty" ] && [ "$ZELLIJ" != 0 ]; then
		kitten icat --align left "/home/ilian/Pictures/Wallpapers/nix-glow-black.png"
	else
		cat ~/.config/fish/functions/catnap.txt
	fi
	# Misery Loves Company
	echo -e "\e[36m$(figlet 'Burn my heart, Flood my head'  -f hex)\e[0m"
fi

export PATH=~/dotfiles/nixos/git_packages/in_path/:~/dotfiles/nixos/:~/.local/bin:$PATH
source ~/.config/bashscripts/init.sh

alias cl="clear"
alias lgit="lazygit"
alias ldocker="lazydocker"
alias conf="cd ~/.config"
alias n="nvim"
alias t='zellij'
alias ta='zellij attach -c ${PWD##*/}'
alias cat="bat"
alias dev="nix develop"
alias man="batman"
alias la="ls -a"
alias lt="tree"
alias lg="git ls-files | tree --fromfile"
alias ses="sessionizer.sh"
alias rm="rm -i"
e() {
    ed -p ':' "${@:2}" | pygmentize -s -l "$1" -O style=native
}

eval "$(thefuck --alias)"
eval "$(zoxide init bash)"

[[ -f ~/.bash-preexec.sh ]] && source ~/.bash-preexec.sh
source "$(blesh-share)/ble.sh"
eval "$(atuin init bash)"
